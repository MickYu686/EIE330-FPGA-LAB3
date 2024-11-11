`timescale 1ns/1ns

module tb_vendingmachine();
reg sys_clk ;
reg sys_rst_n ;
reg [1:0] i_money ;

wire o_cola;
wire o_change;

initial begin
    sys_clk = 1'b1;
    sys_rst_n <= 1'b0;
    #20
    sys_rst_n <= 1'b1;
end

    always #10 sys_clk = ~sys_clk;

    always begin
        #500 sys_rst_n = 1'b0;
        #20 sys_rst_n = 1'b1; 
    end
	 
    always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        i_money <= 2'b0;
    else
        i_money <= {$random} % 3;

    wire [3:0] state = vendingmachine_inst.state;

vendingmachine vendingmachine_inst(
    .sys_clk (sys_clk),
    .sys_rst_n (sys_rst_n), 
    .i_money (i_money),

    .o_cola (o_cola),
    .o_change (o_change)
);
endmodule