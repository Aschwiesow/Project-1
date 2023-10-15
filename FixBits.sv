module FixBits(
	input logic [3:0] A,
	output logic [3:0]B
);
	
	assign B[0] = A[0];
		assign B[1] = A[1];
			assign B[2] = A[2];
				assign B[3] = A[3];

endmodule