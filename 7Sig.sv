module seven_seg(input logic [3:0] a, dot,
	output logic [6:0] Osig, dotout);
	
	logic [15:0] y;
	
	logic Eb;
	assign Eb = 1'b1;
	
	
	assign y[0] = (~a[3] & ~a[2] & ~a[1] & ~a[0]) ;
		assign y[1] = (~a[3] & ~a[2] & ~a[1] & a[0]) ;
			assign y[2] = (~a[3] & ~a[2] & a[1] & ~a[0]) ;
				assign y[3] = (~a[3] & ~a[2] & a[1] & a[0]) ;
					assign y[4] = (~a[3] & a[2] & ~a[1] & ~a[0]) ;
						assign y[5] = (~a[3] & a[2] & ~a[1] & a[0]) ;
							assign y[6] = (~a[3] & a[2] & a[1] & ~a[0]) ;
								assign y[7] = (~a[3] & a[2] & a[1] & a[0]) ;
									assign y[8] = (a[3] & ~a[2] & ~a[1] & ~a[0]) ;
	
	
	assign Osig[0] = (y[1] | y[4] | y[11] | y[13]) 							* in_enable;
		assign Otsig[1] = (y[5] | y[6] | y[11] | y[12] | y[14] | y[15]) 	* in_enable;
			assign Osig[2] = (y[2] | y[12] | y[14] | y[15]) 						* in_enable;
				assign Osig[3] = (y[1] | y[4] | y[7] | y[10] | y[15]) 				* in_enable;
					assign Osig[4] = (y[1] | y[3] | y[4] | y[5] | y[7] | y[9]) 			* in_enable;
						assign Osig[5] = (y[1] | y[2] | y[3] | y[7] | y[13]) 					* in_enable;
							assign Osig[6] = (y[0] | y[1] | y[7] | y[12]) 							* in_enable;
				
endmodule