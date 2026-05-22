module alu_8bit (
    input  wire [7:0] A,        // Operand A
    input  wire [7:0] B,        // Operand B
    input  wire [2:0] opcode,   // 3-bit operation select
    output reg  [7:0] result,   // 8-bit result
    output reg        carry,    // Carry / borrow flag
    output wire       zero,     // Zero flag  (result == 0)
    output wire       negative  // Negative flag (MSB of result)
);

    // ── Opcode encoding ────────────────────────────────────
    localparam ADD = 3'b000;
    localparam SUB = 3'b001;
    localparam AND = 3'b010;
    localparam OR  = 3'b011;
    localparam XOR = 3'b100;
    localparam NOT = 3'b101;
    localparam SHL = 3'b110;   // Shift Left  by 1
    localparam SHR = 3'b111;   // Shift Right by 1

    reg [8:0] temp; // 9-bit for carry detection

    // ── ALU combinational logic ─────────────────────────────
    always @(*) begin
        temp  = 9'b0;
        carry = 1'b0;

        case (opcode)
            ADD: begin
                temp   = {1'b0, A} + {1'b0, B};
                result = temp[7:0];
                carry  = temp[8];
            end
            SUB: begin
                temp   = {1'b0, A} - {1'b0, B};
                result = temp[7:0];
                carry  = temp[8];   // borrow flag
            end
            AND: begin
                result = A & B;
            end
            OR: begin
                result = A | B;
            end
            XOR: begin
                result = A ^ B;
            end
            NOT: begin
                result = ~A;        // B is ignored
            end
            SHL: begin
                {carry, result} = {A, 1'b0};   // shift left, MSB → carry
            end
            SHR: begin
                result = {1'b0, A[7:1]};        // shift right, fill with 0
                carry  = A[0];                   // LSB → carry
            end
            default: begin
                result = 8'b0;
                carry  = 1'b0;
            end
        endcase
    end

    // ── Status flags ────────────────────────────────────────
    assign zero     = (result == 8'b0);
    assign negative =  result[7];       // MSB = sign in 2's complement

endmodule
