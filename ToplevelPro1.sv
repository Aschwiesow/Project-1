module ToplevelPro1(
	input logic Reset, CLK, CLK50MHZ,
	input logic P1, H50, F25,
	
	output logic Item,  
	output logic [6:0] Change1, 
	output logic [6:0] Change2, 
	output logic [6:0] Change3, 
	output logic DOT,	
	output logic [6:0] OutCr_State,	OutCr_change,
	output [3:0] OBits
	);
	
		
	logic CDbounce, RDbounce;
	
		Debouncer (.A(CDbounce), .A_noisy(CLK), .CLK50M(CLK50MHZ));
		Debouncer (.A(RDbounce), .A_noisy(Reset), .CLK50M(CLK50MHZ));
	
	logic[1:0] A;
	
		E3_2 e3_2(.A(A), .P(P1), .H(H50), .F(F25));
		
		
	logic [3:0] NState;
		logic [3:0] CState;
			NStateCode(.Out(NState), .X(CState), .Y(A));

	
	
	
	//DFF
		D_FF_neg(.Q(CState[0]), .D(NState[0]), .CLKb(CDbounce), .RSTb(RDbounce));
		D_FF_neg(.Q(CState[1]), .D(NState[1]), .CLKb(CDbounce), .RSTb(RDbounce));
		D_FF_neg(.Q(CState[2]), .D(NState[2]), .CLKb(CDbounce), .RSTb(RDbounce));
		D_FF_neg(.Q(CState[3]), .D(NState[3]), .CLKb(CDbounce), .RSTb(RDbounce));
	
	seg7(.Oseg(OutCr_State), .a(CState));
	FixBits(.B(OBits), .A(CState));
	
			
		logic [3:0]changeBack;
			OLogic OutputL(.A(CState), .ItemOut(Item), .ChangeBitOut(changeBack), .cFarthing(Change_25), .cHalf(CHange_50));
			seg7 setSeg(.a(changeBack), .Oseg(ChangeDisplay));
	
	
	endmodule