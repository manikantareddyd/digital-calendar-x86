module caltb;
   wire [2:0] Day;
   wire [4:0] Date;
   wire [3:0] Month;
   reg [2:0] day;
   reg [4:0] date;
   reg [3:0] month;
   reg 	clk;
   
   cal my_cal(clk, day, date, month, Day, Date, Month);


   initial
     begin
    	$dumpfile("tb.vcd");
    	$dumpvars(0,caltb);
    	day = 0;
    	date = 0;
    	month = 0;
      clk=1;
     end
     always
       begin
         #1 clk = ~clk;
       end
endmodule // caltb
