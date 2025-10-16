module shiftregister (
    input wire clk,         // Clock signal
    input wire rst,         // Asynchronous reset
    input wire serial_in,   // Serial data input
    output wire serial_out  // Serial data output (MSB)
);

    // 4-bit shift register
    reg [3:0] shift_reg;

    // Assign the MSB as serial output
    assign serial_out = shift_reg[3];

    // Shift logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000;                    // Clear on reset
        else
            shift_reg <= {shift_reg[2:0], serial_in}; // Shift left and input new bit
    end

endmodule
