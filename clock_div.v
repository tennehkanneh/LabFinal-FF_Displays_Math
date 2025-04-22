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

    reg [DIVIDE_BY-1:0] count;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            count <= 0;
            div_clock <= 0;
        end else begin
            count <= count + 1;
            div_clock <= count[DIVIDE_BY-1]; // MSB as output clock
        end
    end
    

endmodule
