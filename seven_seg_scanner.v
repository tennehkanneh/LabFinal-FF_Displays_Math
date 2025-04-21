module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);
    wire [1:0] current_state;
    wire [1:0] next_state;

    // This block should activate one anode at a time in the seven segment
    // displays. Keep in mind THEY ARE INVERSE DRIVE, that is that 0 is on 1 is
    // off. Think of it as a state machine.

    // The reset line should set things back to segment 0

    // Use the D FlipFlops from previous labs, and implement all other logic
    // purely combinatorial.

    dff state_ff0 (
        .reset(reset),
        .clock(div_clock),
        .D(next_state[0]),
        .Q(current_state[0])
    );

    dff state_ff1 (
        .reset(reset),
        .clock(div_clock),
        .D(next_state[1]),
        .Q(current_state[1])
    );

    assign next_state = reset ? 2'b00 : current_state + 1'b1;

    // Anodes are:
    // 0: R Right
    assign anode[0] = (current_state == 2'b00) ? 1'b0 : 1'b1;
    // 1: RC Right Center
    assign anode[1] = (current_state == 2'b01) ? 1'b0 : 1'b1;
    // 2: LC Left Center
    assign anode[2] = (current_state == 2'b10) ? 1'b0 : 1'b1;
    // 3: L Left
    assign anode[3] = (current_state == 2'b11) ? 1'b0 : 1'b1;

endmodule