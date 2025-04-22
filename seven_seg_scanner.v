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
    assign next_state = current_state + 1;
    
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

    assign anode =
        (current_state == 2'b00) ? 4'b1110 :  // R
        (current_state == 2'b01) ? 4'b1101 :  // RC
        (current_state == 2'b10) ? 4'b1011 :  // LC
        (current_state == 2'b11) ? 4'b0111 :  // L
        4'b1111;                      // default (all off)
    
endmodule
