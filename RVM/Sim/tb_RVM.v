`timescale 1ns/1ns
module tb_RVM();
reg sys_clk ;
reg sys_rst_n ;
reg [1:0]coin ;

wire cola;
wire[2:0] returncoins;

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
        coin <= 2'b0;
    else
        coin <= {$random} % 3; 

    wire [2:0] st_cur = RVM_inst.st_cur;
    wire [2:0] st_next = RVM_inst.st_next;

initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t: coin=%b st_cur=%b st_next=%b cola=%b return_coins=%b",
    $time, coin, st_cur, st_next, cola, returncoins);
end

RVM RVM_inst(
    .sys_clk (sys_clk ),
    .sys_rst_n (sys_rst_n ),
    .coin (coin),
    .coke (cola),
    .refund_coins (returncoins)
);
endmodule