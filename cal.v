module cal(input clk, input[2:0] day, input[4:0] date, input[3:0] month, output[2:0] Day, output[4:0] Date, output[3:0] Month);
   reg [2:0] Day;
   reg [4:0] Date;
   reg [3:0] Month;
   always @(day,date,month)
     begin
   	Day=day;
	Date=date;
	Month=month;
     end
   always @(posedge clk)
     begin
	Day = (Day+1)%7;
	if((Month == 1))
	  begin
	     if(Date==27)
	       begin
		  Date=0;
		  Month=2;
	       end
	     else
	       begin
		  Date = Date + 1;
	       end
	  end // if february
	else if((Month == 0) || (Month == 2) || (Month == 4) || (Month == 6) || (Month == 7) || (Month == 9) || (Month == 11))
	  begin
	     if(Date == 30)
	       begin
		  Date = 1;
		  Month = (Month + 1)%12;
	       end
	     else
	       begin
		  Date = Date + 1;
	       end
	end // if Month with 31 Days
	else if((Month == 3) || (Month == 5) || (Month == 8) || (Month == 10))
	  begin
	     if(Date == 29)
	       begin
		  Date = 1;
		  Month = Month + 1;
	       end
	     else
	       begin
		  Date = Date + 1;
	       end
	  end // else: Month with 30 Days
     end
endmodule // cal