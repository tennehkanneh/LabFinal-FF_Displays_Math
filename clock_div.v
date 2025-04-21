module clock_div 
#(
    parameter DIVIDE_BY = 17
) 
(
    input clock,
    input reset,
    output reg div_clock
);

    // 100 MHz input clock, divide down by chaining N FlipFlops together
    // to slow down the clock by 1/2^N
    
    wire [DIVIDE_BY - 1: 0] q_chain;

    genvar i;

    generate
        for (i = 0; i < DIVIDE_BY; i = i + 1) begin
            dff ff_i (
                .reset(reset),
                .clock(clock),
                .D((i == 0) ? 1'b1 : q_chain[i - 1]),
                .Q(q_chain[i]),
                .NotQ() 
            );
        end
    endgenerate

    always @(posedge reset, posedge clock) begin
        if (reset) begin
            div_clock <= 0;
        end else if (clock) begin
            div_clock <= q_chain[DIVIDE_BY - 1];
        end
    end
    

endmodule