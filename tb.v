module tb;

parameter data_width = 8;

reg rd_clk;
reg wr_clk;
reg rst;
reg rd_en;
reg wr_en;
reg [data_width-1 : 0] wdata;

wire  [data_width-1 : 0] rdata;
wire full;
wire empty;
wire valid;
wire overflow;
wire underflow;

integer k;

//parameter fifo_depth = 8;
//parameter data_width = 8;

async_fifo a1(rd_clk, wr_clk, rst, rd_en, wr_en, rdata, wdata, valid, empty, full, overflow,underflow);

initial begin
rd_clk=0;
wr_clk=0;
rst=0;

#20 rst =1;
#10 rst =0;
#500 $finish;
end

always #5 wr_clk=~wr_clk;
always #7 rd_clk=~rd_clk;

initial begin
 for (k=0; k<12;k=k+1) begin
    wdata = k;
	 #10 wr_en=1;
 end
    wr_en=0;
end

initial begin 
  rd_en=0;
  #150 rd_en=1;
end 

endmodule










