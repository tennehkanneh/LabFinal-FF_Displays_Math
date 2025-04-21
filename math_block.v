module math_block (
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);
    wire [4:0] carry;
    wire [4:0] borrow;

    genvar i;

 
    generate
        full_adder add0 (
            .A(A[0]),
            .B(B[0]),
            .Cin(1'b0),
            .Y(AplusB[0]),
            .Cout(carry[0])
        );

        for (i = 1; i < 4; i = i + 1) begin
            full_adder add_i (
                .A(A[i]),
                .B(B[i]),
                .Cin(carry[i-1]),
                .Y(AplusB[i]),
                .Cout(carry[i])
            );
        end
    endgenerate

    
    generate
        full_subtractor sub0 (
            .A(A[0]),
            .B(B[0]),
            .Bin(1'b0), 
            .Y(AminusB[0]),
            .Bout(borrow[0])
        );

        for (i = 1; i < 4; i = i + 1) begin
            full_subtractor sub_i (
                .A(A[i]),
                .B(B[i]),
                .Bin(borrow[i-1]),
                .Y(AminusB[i]),
                .Bout(borrow[i])
            );
        end
    endgenerate

endmodule

