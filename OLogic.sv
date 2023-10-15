module OLogic(
		input logic [3:0] A,
		
		output logic ItemOut, 
		output logic [3:0] ChangeBitOut,

		
		output logic cFarthing, cHalf);
		
		logic [3:0] Case;
		
		assign Case[0] = (~A[3] & A[2] & ~A[1] & A[0]); 	
			assign Case[1] = (~A[3] & A[2] & A[1] & ~A[0]);		
				assign Case[2] = (~A[3] & A[2] & A[1] & A[0]);		
					assign Case[3] = (A[3] & ~A[2] & ~A[1] & ~A[0]);	
		
		assign ChangeBitOut[0] = Case[1] | Case[3];
			assign ChangeBitOut[1] = Case[2] | Case[3];
				assign ChangeBitOut[2] = 1'b0;
					assign ChangeBitOut[3] = 1'b0; 		
		
		assign cFarthing = ChangeBitOut[1] | ChangeBitOut[3];
		assign cHalf = ChangeBitOut[2] | ChangeBitOut[3];
		
		assign ItemOut = Case[0] | Case[1] | Case[2] | Case[3];

endmodule