module choose_state(
	input		[7:0]		u,//计数器输入前提电压
	input		[7:0]		i,//计数器输入前提电流
	input					clk,//计数器基准时钟
	input					rst,//系统复位
	output		[31:0]  	y,//商*100
	output		[31:0]  	remain
);
	wire	[31:0]	a;//定义所有状态计数器计数之和
	wire	[31:0]	quotient;	
	reg		[31:0]	off;//定义计数器 开路 寄存器
	reg		[31:0]	good;//定义计数器 火花+瞬时 寄存器
	reg		[31:0]	bad;//定义计数器 短路+稳定 寄存器
	reg		[31:0]	delay;


	parameter u_2 = 8'd18 , u_4 = 8'd36 , i_d = 8'd54;
	
	always @ (posedge clk or negedge rst)
	
	begin
		
		if(rst == 1'b0) 
			begin
				off		<= 32'b0;
				good	<= 32'b0;
				bad		<= 32'b0;
				delay	<= 32'b0;
			end
			
		else 
			if(i < i_d )
				begin
					if(u > u_2 && u < u_4 )
						delay <= delay + 1'b1;
					else
						off <= off + 1'b1;//好的状态
				end
			else  //i>id
				begin 
					if(u > u_2 && u < u_4)
						good <= good + 1'b1;
					else 
						bad <= bad + 1'b1;
				end
	end

		assign a = bad + good + off;

		
	
		div div_ip(
		.denom(a),
		.numer(bad),
		.quotient(quotient),
		.remain(remain)
		);
	
		assign y = quotient * 100;
	
	endmodule
	
	begin
		end
	end
    begin
        gi
        begin
            dad、
    endmodule
    begin
        input