/***************************************************

* Module Name : clk_generator

* Engineer : Crazy Bingo

* Target Device : EP2C8Q208C8

* Tool versions : Quartus II 9.1SP1

* Create Date : 2011-6-25

* Revision : v1.0

* Description :

**************************************************/

/*************************************************

fc = 50MHz 50*10^6

fo = fc*K/(2^32)

K = fo*(2^32)/fc	//K为频率控制字

= fo*(2^32)/(50*10^6)

**************************************************/

module clk_generator

#(parameter FREQ_WORD = 32'd8590 //1KHz)

(
	input			clk, //50MHz
	input			rst_n, //clock reset
	output	reg		clk_out
);

//--------------------------------------

reg [31:0] max_value;

always@(posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			max_value <= 1'b0;
		else
			max_value <= max_value + FREQ_WORD;
	end

//--------------------------------------

always@(posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			clk_out <= 1'b0;
		else
			begin
				if(max_value < 32'h7FFF_FFFF)
					clk_out <= 1'b0;
				else
					clk_out <= 1'b1;
			end
	end

endmodule