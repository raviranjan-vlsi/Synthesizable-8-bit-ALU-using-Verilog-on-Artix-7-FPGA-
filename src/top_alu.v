module top_alu_basys3 (
    input  wire        clk,          // 100 MHz on-board clock (unused here)
    input  wire [15:0] sw,           // 16 slide switches
    input  wire        btnC,         // centre button (reset / reserved)
    input  wire        btnU,         // up    button → opcode[2]
    input  wire        btnL,         // left  button → opcode[1]
    input  wire        btnR,         // right button → opcode[0]
    output wire [15:0] led,          // 16 LEDs
    // 7-segment display (optional — shows result in hex)
    output wire [6:0]  seg,
    output wire        dp,
    output wire [3:0]  an
);

    // ── Opcode from buttons ──────────────────────────────────
    wire [2:0] opcode;
    assign opcode = {btnU, btnL, btnR};  // MSB first

    // ── ALU connections ──────────────────────────────────────
    wire [7:0] result;
    wire        carry, zero, negative;

    alu_8bit alu_inst (
        .A        (sw[7:0]),    // Operand A  = right 8 switches
        .B        (sw[15:8]),   // Operand B  = left  8 switches
        .opcode   (opcode),
        .result   (result),
        .carry    (carry),
        .zero     (zero),
        .negative (negative)
    );

    // ── LED outputs ──────────────────────────────────────────
    assign led[7:0]  = result;     // ALU result  → 8 LEDs
    assign led[8]    = carry;      // Carry flag  → LED8
    assign led[9]    = zero;       // Zero  flag  → LED9
    assign led[10]   = negative;   // Neg   flag  → LED10
    assign led[15:11]= 5'b0;       // unused LEDs off

    // ── 7-Segment Display (shows lower nibble of result) ─────
    // Uses a simple hex decoder; anode AN0 only (rightmost digit)
    seg7_decoder seg_lo (
        .hex  (result[3:0]),
        .seg  (seg)
    );
    assign dp = 1'b1;       // decimal point off (active-low → 1 = off)
    assign an = 4'b1110;    // only AN0 active (active-low)

endmodule
