`timescale 1ns/1ns

module board();

reg clk;
reg serial_clk;

initial clk = 1'b0;
initial serial_clk = 1'b0;

always clk = #4 ~clk;
always serial_clk = #407 ~serial_clk; /* generate 9600*16 clock for serial */


`ifdef SIM
initial $display("SIM Defined!!!!!");
`else
initial $display("SIM NOT Defined!!!!!");
`endif

fpgaminer_top top(.osc_clk(clk));

endmodule
