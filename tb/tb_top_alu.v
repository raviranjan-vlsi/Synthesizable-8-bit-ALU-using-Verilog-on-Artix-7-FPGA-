`timescale 1ns / 1ps

module tb_alu_8bit;

    // ── DUT inputs (driven as regs) ─────────────────────────
    reg  [7:0] A;
    reg  [7:0] B;
    reg  [2:0] opcode;

    // ── DUT outputs (observed as wires) ─────────────────────
    wire [7:0] result;
    wire        carry;
    wire        zero;
    wire        negative;

    // ── Instantiate DUT ─────────────────────────────────────
    alu_8bit uut (
        .A        (A),
        .B        (B),
        .opcode   (opcode),
        .result   (result),
        .carry    (carry),
        .zero     (zero),
        .negative (negative)
    );

    // ── Task: apply one test vector and print result ─────────
    task apply_test;
        input [7:0]  ta, tb;
        input [2:0]  top;
        input [127:0] label;   // string tag
        begin
            A = ta; B = tb; opcode = top;
            #10;  // wait for combinational settle
            $display("[%0s]  A=%02h  B=%02h  OP=%03b  =>  result=%02h  C=%b  Z=%b  N=%b",
                      label, A, B, opcode, result, carry, zero, negative);
        end
    endtask

    // ── Stimulus ─────────────────────────────────────────────
    initial begin
        $display("=======================================================");
        $display("  8-bit ALU Simulation — Vivado / Icarus               ");
        $display("=======================================================");

        // -- ADD --------------------------------------------------
        apply_test(8'h05, 8'h03, 3'b000, "ADD      ");  // 5+3   = 8
        apply_test(8'hFF, 8'h01, 3'b000, "ADD_CARRY");  // 255+1 = 0, carry=1
        apply_test(8'h00, 8'h00, 3'b000, "ADD_ZERO ");  // 0+0   = 0, zero=1

        // -- SUB --------------------------------------------------
        apply_test(8'h0A, 8'h03, 3'b001, "SUB      ");  // 10-3  = 7
        apply_test(8'h03, 8'h0A, 3'b001, "SUB_BRRW ");  // 3-10  = negative, borrow=1

        // -- AND --------------------------------------------------
        apply_test(8'hF0, 8'h0F, 3'b010, "AND      ");  // F0 & 0F = 00
        apply_test(8'hAA, 8'hFF, 3'b010, "AND_MASK ");  // AA & FF = AA

        // -- OR ---------------------------------------------------
        apply_test(8'hF0, 8'h0F, 3'b011, "OR       ");  // F0 | 0F = FF
        apply_test(8'h00, 8'h00, 3'b011, "OR_ZERO  ");  // 00 | 00 = 00, zero=1

        // -- XOR --------------------------------------------------
        apply_test(8'hAA, 8'hAA, 3'b100, "XOR_SAME ");  // same  = 00, zero=1
        apply_test(8'hAA, 8'h55, 3'b100, "XOR_COMP ");  // compl = FF, neg=1

        // -- NOT --------------------------------------------------
        apply_test(8'h00, 8'hXX, 3'b101, "NOT_00   ");  // ~00 = FF, neg=1
        apply_test(8'hFF, 8'hXX, 3'b101, "NOT_FF   ");  // ~FF = 00, zero=1
        apply_test(8'hA5, 8'hXX, 3'b101, "NOT_A5   ");  // ~A5 = 5A

        // -- SHL --------------------------------------------------
        apply_test(8'h01, 8'hXX, 3'b110, "SHL_1    ");  // 01 << 1 = 02
        apply_test(8'h80, 8'hXX, 3'b110, "SHL_CARRY");  // 80 << 1 = 00, carry=1

        // -- SHR --------------------------------------------------
        apply_test(8'h80, 8'hXX, 3'b111, "SHR_80   ");  // 80 >> 1 = 40
        apply_test(8'h01, 8'hXX, 3'b111, "SHR_CARRY");  // 01 >> 1 = 00, carry=1

        $display("=======================================================");
        $display("  Simulation complete!");
        $display("=======================================================");
        $finish;
    end

    // ── Optional waveform dump (Icarus / GTKWave) ────────────
    initial begin
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, tb_alu_8bit);
    end

endmodule
