module NStateCode(
		input logic [3:0] X,
		input logic [1:0] Y,
		
		output logic [3:0] Out
);
	
	logic [8:0] Statenext;
	
	assign Statenext[0] = ~X[3] & ~X[2] & ~X[1] & ~X[0] & ~Y[1] & ~Y[0] 
							| ~X[3] & X[2] & ~X[1] & X[0] & ~Y[1] & ~Y[0]  
							| ~X[3] & X[2] & X[1] & ~X[0] & ~Y[1] & ~Y[0]  
							| ~X[3] & X[2] & X[1] & X[0] & ~Y[1] & ~Y[0]  
							| X[3] & ~X[2] & ~X[1] & ~X[0] & ~Y[1] & ~Y[0];
	
	assign Statenext[1] = ~X[3] & ~X[2] & ~X[1] & ~X[0] & ~Y[1] & Y[0] 
							| ~X[3] & ~X[2] & ~X[1] & X[0] & ~Y[1] & ~Y[0] 
							| ~X[3] & X[2] & ~X[1] & X[0] & ~Y[1] & Y[0];
	
	assign Statenext[2] = ~X[3] & ~X[2] & ~X[1] & ~X[0] & Y[1] & ~Y[0] 
							| ~X[3] & ~X[2] & ~X[1] & X[0] & ~Y[1] & Y[0] 
							| ~X[3] & ~X[2] & X[1] & ~X[0] & ~Y[1] & ~Y[0]
							| ~X[3] & X[2] & X[1] & ~X[0] & ~Y[1] & Y[0]  
							| ~X[3] & X[2] & ~X[1] & X[0] & Y[1] & ~Y[0];  
							
	assign Statenext[3] = ~X[3] & ~X[2] & ~X[1] & X[0] & Y[1] & ~Y[0] 
							| ~X[3] & ~X[2] & X[1] & X[0] & ~Y[1] & ~Y[0] 
							| ~X[3] & ~X[2] & X[1] & ~X[0] & ~Y[1] & Y[0] 
							| ~X[3] & X[2] & X[1] & ~X[0] & Y[1] & ~Y[0] 
							| ~X[3] & X[2] & X[1] & X[0] & ~Y[1] & Y[0]; 
							
	assign Statenext[4] = ~X[3] & ~X[2] & ~X[1] & ~X[0] & Y[1] & Y[0] 
							| ~X[3] & ~X[2] & X[1] & X[0] & ~Y[1] & Y[0] 
							| ~X[3] & ~X[2] & X[1] & ~X[0] & Y[1] & ~Y[0] 
							| ~X[3] & X[2] & ~X[1] & ~X[0] & ~Y[1] & ~Y[0] 
							| ~X[3] & X[2] & ~X[1] & X[0] & Y[1] & Y[0] 
							| ~X[3] & X[2] & X[1] & X[0] & Y[1] & ~Y[0] 
							| X[3] & ~X[2] & ~X[1] & ~X[0] & ~Y[1] & Y[0]; 
							
	assign Statenext[5] = ~X[3] & ~X[2] & ~X[1] & X[0] & Y[1] & Y[0] 
							| ~X[3] & ~X[2] & X[1] & X[0] & Y[1] & ~Y[0] 
							| ~X[3] & X[2] & ~X[1] & ~X[0] & ~Y[1] & Y[0] 
							| ~X[3] & X[2] & X[1] & ~X[0] & Y[1] & Y[0] 
							| X[3] & ~X[2] & ~X[1] & ~X[0] & Y[1] & ~Y[0]; 
	
	assign Statenext[6] = ~X[3] & ~X[2] & X[1] & ~X[0] & Y[1] & Y[0] 
							| ~X[3] & X[2] & ~X[1] & ~X[0] & Y[1] & ~Y[0] 
							| ~X[3] & X[2] & X[1] & X[0] & Y[1] & Y[0]; 
	
	assign Statenext[7] = ~X[3] & ~X[2] & X[1] & X[0] & Y[1] & Y[0] 
							| X[3] & ~X[2] & ~X[1] & ~X[0] & Y[1] & Y[0]; 
	
	assign Statenext[8] = ~X[3] & X[2] & ~X[1] & ~X[0] & Y[1] & Y[0]; 
	
	
	
	assign Out[0] = Statenext[1] | Statenext[3] | Statenext[5] | Statenext[7];
		assign Out[1] = Statenext[2] | Statenext[3] | Statenext[6] | Statenext[7];
			assign Out[2] = Statenext[4] | Statenext[5] | Statenext[6] | Statenext[7];
				assign Out[3] = Statenext[8];
	
endmodule