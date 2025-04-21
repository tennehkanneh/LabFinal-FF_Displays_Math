module full_subtractor (
    input A, B, Bin,
    output Y, Bout
);
    wire Diff;
    assign Diff = A ^ B;

    assign Y = Diff ^ Bin;
    assign Bout = (~A & B) | (~A & Bin) | (B & Bin);

endmodule