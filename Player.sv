module Player(i_clk, i_rst_n, i_init, i_start, i_prev_card, i_play, i_out_card, i_draw_card, i_draw_two, i_draw_four, i_drawn, i_check, i_drawed_card, o_out, o_full, o_hands);
    //----------------- port definition -----------------//
    input i_clk, i_rst_n, i_init, i_start, i_draw_two, i_draw_four, i_drawn, i_check;
    input [5:0] i_prev_card;
    input [5:0] i_out_card; // output cards
    input       i_play; // player chooses a card
    output [5:0] o_hands [19:0]; // the player's hand
    output      o_out; // decide whether to play a card
    input       i_draw_card; // player decides to draw card
    input [5:0] i_drawed_card; // the card that the player drawed
    output      o_full; // player has 20 cards
    //----------------- fsm state definition -----------------//
    localparam S_IDLE = 3'b000, S_DRAW = 3'b001, S_OUT = 3'b010, S_CHECK_COLOR = 3'b100, S_CHECK_NUM = 3'b101, S_INIT = 3'b110, S_SEARCH_NUM = 3'b111, S_DRAW_BUFF = 3'b011;
    localparam S_HOLD = 1'b0, S_SORT = 1'b1;
    //----------------- sequential signal definition -----------------//
    logic [5:0] red_hands_w [14:0];
    logic [5:0] red_hands_r [14:0];
    logic [5:0] blue_hands_w [14:0];
    logic [5:0] blue_hands_r [14:0];
    logic [5:0] green_hands_w [14:0];
    logic [5:0] green_hands_r [14:0];
    logic [5:0] yellow_hands_w [14:0];
    logic [5:0] yellow_hands_r [14:0];
    logic [5:0] wild_hands_w [3:0];
    logic [5:0] wild_hands_r [3:0];
    logic [5:0] wildf_hands_w [3:0];
    logic [5:0] wildf_hands_r [3:0];
    logic [5:0] hands_w [14:0];
    logic [5:0] hands_r [14:0];

    logic [3:0] red_num_w, red_num_r, blue_num_w, blue_num_r, green_num_w, green_num_r, yellow_num_w, yellow_num_r, wild_num_w, wild_num_r, wildf_num_w, wildf_num_r;
    logic [2:0] state_w, state_r;
    logic       state_hands_w, state_hands_r;
    logic [2:0] draw_num_w, draw_num_r;
    logic [3:0] iter_w, iter_r;
    logic       sort_w, sort_r;
    logic       out;

    logic [3:0] lfsr_w, lfsr_r;

    integer i, j, k;
    //----------------- wire connection -----------------//
    genvar x;
    generate
        for(x=0; x<15; x++) begin
            assign o_hands[x] = hands_r[x];
        end
    endgenerate
    assign o_out = out;
    assign o_full = ((red_num_r + yellow_num_r + green_num_r + blue_num_r + wild_num_r + wildf_num_r) >= 4'd15);
    //----------------- combinational part -----------------//
    always_comb begin
        for(i = 0; i < 15; i = i + 1) begin
            red_hands_w[i] = red_hands_r[i];
            blue_hands_w[i] = blue_hands_r[i];
            green_hands_w[i] = green_hands_r[i];
            yellow_hands_w[i] = yellow_hands_r[i];
        end
        for(i = 0; i < 4; i = i + 1) begin
            wild_hands_w[i] = wild_hands_r[i];
            wildf_hands_w[i] = wild_hands_r[i];
        end
        red_num_w = red_num_r;
        blue_num_w = blue_num_r;
        green_num_w = green_num_r;
        yellow_num_w = yellow_num_r;
        wild_num_w = wild_num_r;
        wildf_num_w = wildf_num_r;
        draw_num_w = 3'd0;
        iter_w = 3'd0;
        sort_w = 1'b0;
        lfsr_w = {lfsr_r[0]^lfsr_r[1], lfsr_r[3], lfsr_r[2], lfsr_r[1]};
        case(state_r)
            S_IDLE: begin
                iter_w = 4'd0;
                if(i_start) begin // if it's the player's turn
                    if(i_draw_two) begin
                        state_w = S_DRAW;
                        draw_num_w = 3'd2;
                    end
                    else if(i_draw_four) begin
                        state_w = S_DRAW;
                        draw_num_w = 3'd4;
                    end
                    else begin
                        state_w = S_PLAY;
                        draw_num_w = 3'd0;
                    end
                end
                else if(i_init) begin // if it's the initial hands
                    state_w = S_DRAW;
                    draw_num_w = 3'd7;
                end
                else begin
                    state_w = S_IDLE;
                end
            end
            S_DRAW: begin
                iter_w = 4'd0;
                if(i_drawn) begin
                    if(draw_num_r <= 1 && i_start) begin
                        state_w = S_PLAY;
                        sort_w = 1'b1;
                        draw_num_w = 3'd0;
                    end
                    else begin
                        state_w = S_DRAW;
                        sort_w = 1'b0;
                        draw_num_w = draw_num_r - 1;
                    end
                    if(i_drawed_card[3:0] == 4'b1101) begin // if the card is wild
                        wild_hands_w[number_exist_r[13]] = i_drawed_card;
                        wild_num_w = wild_num_r + 1;
                    end
                    else if (i_drawed_card[3:0] == 4'b1110) begin // if the card is wild draw four
                        wildf_hands_r[number_exist_r[14]] = i_drawed_card;
                        wildf_num_w = wildf_num_r + 1;
                    end
                    else begin
                        case(i_drawed_card[5:4])
                            2'b00: begin // red
                                red_hands_w[red_num_r] = i_drawed_card;
                                red_num_w = red_num_r + 1;
                            end
                            2'b01: begin // yellow
                                yellow_hands_w[yellow_num_r] = i_drawed_card;
                                yellow_num_w = yellow_num_r + 1;
                            end
                            2'b10: begin // green
                                green_hands_w[green_num_r] = i_drawed_card;
                                green_num_w = green_num_r + 1;
                            end
                            2'b11: begin // blue
                                blue_hands_w[blue_num_r] = i_drawed_card;
                                blue_num_w = blue_num_r + 1;
                            end
                        endcase
                    end
                end
                else begin
                    state_w = S_DRAW;
                    sort_w = 1'b0;
                    draw_num_w = draw_num_r;
                end
            end
            S_OUT: begin
                iter_w = 4'd0;
                out = 1'b1; // play the card
                sort_w = 1'b0;
                if(deck_idle)   state_w = S_IDLE;
                else            state_w = S_OUT;
            end
            S_PLAY: begin
                iter_w = 4'd0;
                sort_w = 1'b0;
                if(i_draw) begin
                    state_w = S_NOCARD;
                end
                else if(i_play) begin
                    if(i_out_card[3:0] == 4'd13 || i_out_card[3:0] == 4'd14 || i_out_card[5:4] == i_prev_card[5:4] || i_out_card[3:0] == i_prev_card[3:0]) begin
                        case (i_out_card[5:4])
                            2'b00:  state_w = S_SEARCHR;
                            2'b01:  state_w = S_SEARCHY;
                            2'b10:  state_w = S_SEARCHG;
                            2'b11:  state_w = S_SEARCHB;
                        endcase
                    end
                    else begin
                        state_w = S_PLAY;
                    end
                end
            end
            S_SEARCHR: begin
                if(red_hands_r[iter_r][3:0] == i_out_card[3:0]) begin
                    state_w = S_OUT;
                    sort_w = 1'b1;
                    iter_w = 0;
                    for(i=iter_r; i<red_num_r; i++) begin
                        red_hands_w[iter_r] = red_hands_r[iter_r+1];
                    end
                    red_num_w = red_num_r - 1;
                end
                else begin
                    state_w = S_SEARCHR;
                    sort_w = 1'b0;
                    iter_w = iter_r + 1;
                    red_num_w = red_num_r;
                end
            end
            S_SEARCHY: begin
                if(yellow_hands_r[iter_r][3:0] == i_out_card[3:0]) begin
                    state_w = S_OUT;
                    sort_w = 1'b1;
                    iter_w = 0;
                    for(i=iter_r; i<yellow_num_r; i++) begin
                        yellow_hands_w[iter_r] = yellow_hands_r[iter_r+1];
                    end
                    yellow_num_w = yellow_num_r - 1;
                end
                else begin
                    state_w = S_SEARCHY;
                    sort_w = 1'b0;
                    iter_w = iter_r + 1;
                    yellow_num_w = yellow_num_r;
                end
            end
            S_SEARCHG: begin
                if(green_hands_r[iter_r][3:0] == i_out_card[3:0]) begin
                    state_w = S_OUT;
                    sort_w = 1'b1;
                    iter_w = 0;
                    for(i=iter_r; i<green_num_r; i++) begin
                        green_hands_w[iter_r] = green_hands_r[iter_r+1];
                    end
                    green_num_w = green_num_r - 1;
                end
                else begin
                    state_w = S_SEARCHG;
                    sort_w = 1'b0;
                    iter_w = iter_r + 1;
                    green_num_w = green_num_r;
                end
            end
            S_SEARCHB: begin
                if(blue_hands_r[iter_r][3:0] == i_out_card[3:0]) begin
                    state_w = S_OUT;
                    sort_w = 1'b1;
                    iter_w = 0;
                    for(i=iter_r; i<blue_num_r; i++) begin
                        blue_hands_w[iter_r] = blue_hands_r[iter_r+1];
                    end
                    blue_num_w = blue_num_r - 1;
                end
                else begin
                    state_w = S_SEARCHB;
                    sort_w = 1'b0;
                    iter_w = iter_r + 1;
                    blue_num_w = blue_num_r;
                end
            end
            S_NOCARD: begin
                if(i_drawn) begin
                    state_w = S_CHECK;
                    if(i_drawed_card[3:0] == 4'b1101) begin // if the card is wild
                        wild_hands_w[number_exist_r[13]] = i_drawed_card;
                        wild_num_w = wild_num_r + 1;
                    end
                    else if (i_drawed_card[3:0] == 4'b1110) begin // if the card is wild draw four
                        wildf_hands_r[number_exist_r[14]] = i_drawed_card;
                        wildf_num_w = wildf_num_r + 1;
                    end
                    else begin
                        case(i_drawed_card[5:4])
                            2'b00: begin // red
                                red_hands_w[red_num_r] = i_drawed_card;
                                red_num_w = red_num_r + 1;
                            end
                            2'b01: begin // yellow
                                yellow_hands_w[yellow_num_r] = i_drawed_card;
                                yellow_num_w = yellow_num_r + 1;
                            end
                            2'b10: begin // green
                                green_hands_w[green_num_r] = i_drawed_card;
                                green_num_w = green_num_r + 1;
                            end
                            2'b11: begin // blue
                                blue_hands_w[blue_num_r] = i_drawed_card;
                                blue_num_w = blue_num_r + 1;
                            end
                        endcase
                    end
                end
                else begin
                    state_w = S_NOCARD;
                    draw_num_w = draw_num_r;
                end
            end
            S_CHECK: begin
                state_w = (i_check) ? S_CHECK : S_IDLE;
            end
        endcase
    end
    always_comb begin
        case (state_hands_r)
            S_HOLD: begin
                for(j=0; j<15; j++) begin
                    hands_w[j] = hands_r[j];
                end
                if(sort_r)  state_w = S_SORT;
                else        state_w = S_HOLD;
            end
            S_SORT: begin
                for(j=0; j<red_num_r; j++) begin
                    hands_w[j] = red_hands_r[j];
                end
                for(j=0; j<yellow_num_r; j++) begin
                    hands_w[red_num_r + j] = yellow_hands_r[j];
                end
                for(j=0; j<green_num_r; j++) begin
                    hands_w[red_num_r + yellow_num_r + j] = green_num_r[j];
                end
                for(j=0; j<blue_num_r; j++) begin
                    hands_w[red_num_r + yellow_num_r + green_num_r + j] = blue_hands_r[j];
                end
                for(j=0; j<wild_num_r; j++) begin
                    hands_w[red_num_r + yellow_num_r + green_num_r + blue_num_r + j] = wild_hands_r[j];
                end
                for(j=0; j<wildf_num_r; j++) begin
                    hands_w[red_num_r + yellow_num_r + green_num_r + blue_num_r + wild_num_r + j] = wildf_hands_r[j];
                end
                for(j=red_num_r+yellow_num_r+green_num_r+blue_num_r+wild_num_r+wildf_num_r; j<15; j++) begin
                    hands_w[j] = 6'b111111;
                end
                state_w = S_HOLD;
            end
        endcase
    end
    //----------------- sequential part -----------------//
    always_ff @(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) begin
            state_r <= S_IDLE;
            state_hands_r <= S_HOLD;
            for(k = 0; k < 15; k = k + 1) begin
                red_hands_r[k] <= 6'b111111;
                blue_hands_r[k] <= 6'b111111;
                green_hands_r[k] <= 6'b111111;
                yellow_hands_r[k] <= 6'b111111;
            end
            for(k = 0; k < 4; k = k + 1) begin
                wild_hands_r[k] <= 6'b111111;
                wildf_hands_r[k] <= 6'b111111;
            end
            red_num_r <= 4'b0;
            blue_num_r <= 4'b0;
            green_num_r <= 4'b0;
            yellow_num_r <= 4'b0;
            wild_num_r <= 4'b0;
            wildf_num_r <= 4'b0;
            draw_num_r <= 3'd0;
            iter_r <= 4'd0;
            lfsr_r <= 4'b0110;
            sort_r <= 1'b0;
        end
        else begin
            state_r <= state_w;
            state_hands_r <= state_hands_w;
            for(k = 0; k < 15; k = k + 1) begin
                red_hands_r[k] <= red_hands_w[k];
                blue_hands_r[k] <= blue_hands_w[k];
                green_hands_r[k] <= green_hands_w[k];
                yellow_hands_r[k] <= yellow_hands_w[k];
            end
            for(k = 0; k < 4; k = k + 1) begin
                wild_hands_r[k] <= wild_hands_w[k];
                wildf_hands_r[k] <= wild_hands_w[k];
            end
            red_num_r <= red_num_w;
            blue_num_r <= blue_num_w;
            green_num_r <= green_num_w;
            yellow_num_r <= yellow_num_w;
            wild_num_r <= wild_num_w;
            wildf_num_r <= wildf_num_w;
            draw_num_r <= draw_num_w;
            iter_r <= iter_w;
            lfsr_r <= lfsr_w;
            sort_r <= sart_w;
        end
    end
endmodule
