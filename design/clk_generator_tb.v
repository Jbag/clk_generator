`timescale		1ns/1ns;
module		clk_generator_tb;

	reg			clk;
	reg			rst_n;
	// wire	[31:0]	max_vaule;
	wire		clk_out;
parameter FREQ_WORD = 32'd8590 ;//1KHz

initial
	begin
		clk			=	0;
		rst_n		=	0;
		#201
		rst_n		=	1;
	end

always	#20	clk	=	~clk;

clk_generator	clk_generator_inst	(
.clk			(clk), //50MHz
.rst_n			(rst_n), //clock reset
.clk_out		(clk_out)
);

endmodule