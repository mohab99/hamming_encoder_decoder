module tb_decoder;

	reg clk_slow, clk_fast, serial_in;
	wire  serial_out;
	wire [3:0] po1; 

	hamming_decoder  uut(.serial_in(serial_in), .serial_out(serial_out), .po1(po1), .clk_fast(clk_fast), .clk_slow(clk_slow));

	initial begin
  		clk_slow=1;
  			forever begin
    			#70 clk_slow = ~clk_slow; 
  			end
		end
	initial begin
  		clk_fast=1;
  			forever begin
    			#40 clk_fast = ~clk_fast; 
  			end
		end

	initial 
		begin
			@(posedge clk_fast);
			serial_in = 1;
    			@(posedge clk_fast);
			serial_in = 1;
    			@(posedge clk_fast);
			serial_in = 1;
    			@(posedge clk_fast);	// excpected output "1011"
			serial_in = 0;
			@(posedge clk_fast);
			serial_in = 1;
    			@(posedge clk_fast);
			serial_in = 0;
			@(posedge clk_fast);
			serial_in = 1;	
//********************************************************
			@(posedge clk_fast);
			serial_in = 1;
    			@(posedge clk_fast);
			serial_in = 0;
    			@(posedge clk_fast);
			serial_in = 1;
    			@(posedge clk_fast);	// excpected output "1011"
			serial_in = 0;
			@(posedge clk_fast);
			serial_in = 1;
    			@(posedge clk_fast);
			serial_in = 0;
			@(posedge clk_fast);
			serial_in = 1;
//********************************************************			
			@(posedge clk_fast);
			serial_in = 0;
    			@(posedge clk_fast);
			serial_in = 0;
    			@(posedge clk_fast);
			serial_in = 1;
    			@(posedge clk_fast);	// excpected output "1001"
			serial_in = 1;
			@(posedge clk_fast);
			serial_in = 0;
    			@(posedge clk_fast);
			serial_in = 0;
			@(posedge clk_fast);
			serial_in = 1;		
		end
endmodule 
