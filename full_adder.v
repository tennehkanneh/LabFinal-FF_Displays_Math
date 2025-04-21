module full_adder (
    input A, B, Cin,
    output Y, Cout
);
    wire Sum;

    assign Sum = A ^ B; // A + B

    assign Y = Sum ^ Cin; // (A + B) + Carry In from previous bit

    assign Cout = (A & B) | (A & Cin) | (B & Cin); // Overflow

endmodule