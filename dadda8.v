module dadda8(out_end,out, a, b);

	input [7:0]a;
	input [7:0]b;
	output [7:0]out;
	output out_end; 
	
	wire [3:0] la1;
	wire [3:0] lb1;
	wire [3:0] la2;
	wire [3:0] la3;
	wire [3:0] la4;
	wire [3:0] la5;
	wire [3:0] lb2;
	wire [3:0] lb3;
	wire [3:0] lb4;
	wire [3:0] lb5;

	wire cin1;
	wire cin2;
	wire cin3;
	wire cin4;
	wire cin5;
	
	wire [2:0] cout1;
	wire [2:0] cout2;
	wire [2:0] cout3;
	wire [2:0] cout4;
	wire [2:0] cout5;

 	wire P00;
	wire P01;
 	wire P02;
 	wire P03;
 	wire P04;
 	wire P05;
 	wire P06;
 	wire P07;
 	wire P10;
 	wire P11;
 	wire P12;
 	wire P13;
 	wire P14;
 	wire P15;
 	wire P16;
 	wire P17;
 	wire P20;
 	wire P21;
 	wire P22;
 	wire P23;
 	wire P24;
 	wire P25;
 	wire P26;
 	wire P27;
 	wire P30;
 	wire P31;
 	wire P32;
 	wire P33;
 	wire P34;
 	wire P35;
 	wire P36;
	wire P37;
 	wire P40;
 	wire P41;
 	wire P42;
 	wire P43;
 	wire P44;
 	wire P45;
 	wire P46;
 	wire P47;
 	wire P50;
 	wire P51;
 	wire P52;
 	wire P53;
 	wire P54;
 	wire P55;
 	wire P56;
 	wire P57;
 	wire P60;
 	wire P61;
 	wire P62;
 	wire P63;
 	wire P64;
 	wire P65;
 	wire P66;
 	wire P67;
 	wire P70;
 	wire P71;
 	wire P72;
 	wire P73;
 	wire P74;
 	wire P75;
 	wire P76;
 	wire P77;
 
 /************************** AND gate DOT PRODUCT matrix ********************************/ 
	and A00(P00, a[0], b[0]);
	and A01(P01, a[1], b[0]);
	and A02(P02, a[2], b[0]);
	and A03(P03, a[3], b[0]);
	and A04(P04, a[4], b[0]);
	and A05(P05, a[5], b[0]);
	and A06(P06, a[6], b[0]);
	and A07(P07, a[7], b[0]);
	and A10(P10, a[0], b[1]);
	and A11(P11, a[1], b[1]);
	and A12(P12, a[2], b[1]);
	and A13(P13, a[3], b[1]);
	and A14(P14, a[4], b[1]);
	and A15(P15, a[5], b[1]);
	and A16(P16, a[6], b[1]);
	and A17(P17, a[7], b[1]);
	and A20(P20, a[0], b[2]);
	and A21(P21, a[1], b[2]);
	and A22(P22, a[2], b[2]);
	and A23(P23, a[3], b[2]);
	and A24(P24, a[4], b[2]);
	and A25(P25, a[5], b[2]);
	and A26(P26, a[6], b[2]);
	and A27(P27, a[7], b[2]);
	and A30(P30, a[0], b[3]);
	and A31(P31, a[1], b[3]);
	and A32(P32, a[2], b[3]);
	and A33(P33, a[3], b[3]);
	and A34(P34, a[4], b[3]);
	and A35(P35, a[5], b[3]);
	and A36(P36, a[6], b[3]);
	and A37(P37, a[7], b[3]);
	and A40(P40, a[0], b[4]);
	and A41(P41, a[1], b[4]);
	and A42(P42, a[2], b[4]);
	and A43(P43, a[3], b[4]);
	and A44(P44, a[4], b[4]);
	and A45(P45, a[5], b[4]);
	and A46(P46, a[6], b[4]);
	and A47(P47, a[7], b[4]);
	and A50(P50, a[0], b[5]);
	and A51(P51, a[1], b[5]);
	and A52(P52, a[2], b[5]);
	and A53(P53, a[3], b[5]);
	and A54(P54, a[4], b[5]);
	and A55(P55, a[5], b[5]);
	and A56(P56, a[6], b[5]);
	and A57(P57, a[7], b[5]);
	and A60(P60, a[0], b[6]);
	and A61(P61, a[1], b[6]);
	and A62(P62, a[2], b[6]);
	and A63(P63, a[3], b[6]);
	and A64(P64, a[4], b[6]);
	and A65(P65, a[5], b[6]);
	and A66(P66, a[6], b[6]);
	and A67(P67, a[7], b[6]);
	and A70(P70, a[0], b[7]);
	and A71(P71, a[1], b[7]);
	and A72(P72, a[2], b[7]);
	and A73(P73, a[3], b[7]);
	and A74(P74, a[4], b[7]);
	and A75(P75, a[5], b[7]);
	and A76(P76, a[6], b[7]);
	and A77(P77, a[7], b[7]);

/*****************************************************************************/
/****** Carry Lookahead Logic***********************/
	
	// Carry Lookahead//
	//Row 1
	wire [3:0] pin1;
	wire [3:0] pin2;
	wire [3:0] pin4;
	wire [3:0] pin5;
	wire [3:0] gin1;
	wire [3:0] gin2;
	wire [3:0] gin4;
	wire [3:0] gin5;	
	
	lookAheadLogic row1(cout1[2:0], gout1, pout1, pin1[3:0], gin1[3:0], cin1);
	lookAheadLogic row2(cout2[2:0], gout2, pout2, pin2[3:0], gin2[3:0], cin2);
	lookAheadLogic row3(cout3[2:0], gout3, pout3, la3[3:0], lb3[3:0], cin3);
	pgGen pgRow1(pin1[3:0],gin1[3:0],la1,lb1);	
	pgGen pgRow2(pin2[3:0],gin2[3:0],la2,lb2);	
	
	assign la1= {P04,P03,P02,P01};
	assign lb1= {P13,P12,P11,P10};
	assign cin1=0;
	assign la2= {2'b11,P06,P05};
	assign lb2= {2'b0,P15,P14};
	assign cin2=cout3[0];
	assign la3= {2'b11,pout2,pout1};
	assign lb3= {2'b0,gout2,gout1}; //gout1 = final carry
	assign cin3=0;

	//Row 2
	lookAheadLogic row4(cout4[2:0], gout4, pout4, pin4[3:0], gin4[3:0], cin4); //gout4= final carry2
	pgGen pgRow4(pin4[3:0],gin4[3:0],la4,lb4);	
	
	assign la4= {P24,P23,P22,P21};
	assign lb4= {P33,P32,P31,P30};
	assign cin4=0;

	//Row 3
	lookAheadLogic row5(cout5[2:0], gout5, pout5, la5[3:0], lb5[3:0], cin5); //gout5= final carry3
	assign la5= {2'b11,P42,P41};
	assign lb5= {2'b0,P51,P50};
	assign cin5=0;
	
	
	
	
	
 /************************** Height - 0 ********************************/ 
//	wire S006;
//	wire C006;
//	halfAdder HA006(S006, C006, P06, P15);
	wire S007;
	wire C007;
	fullAdder FA007(S007, C007, P07,  P16, P25);
	wire S037;
	wire C037;
	halfAdder HA037(S037, C037, P34, P43);
	wire S018;
	wire C018;
	fullAdder FA018(S018, C018, P17,  P26, P35);
	wire S048;
	wire C048;
	halfAdder HA048(S048, C048, P44, P53);
	wire S029;
	wire C029;
	fullAdder FA029(S029, C029, P27,  P36, P45);
 /************************** Height - 1 ********************************/ 
//	wire S104;
//	wire C104;
//	halfAdder HA104(S104, C104, P04, P13);
//	wire S105;
//	wire C105;
//	fullAdder FA105(S105, C105, P05,  P14, P23);
//	wire S135;
//	wire C135;
//	halfAdder HA135(S135, C135, P32, P41);
//	wire S106;
//	wire C106;
//	fullAdder FA106(S106, C106, S006,  P24, P33);	
//	wire S136;
//	wire C136;
//	fullAdder FA136(S136, C136, P42,  P51, P60);
	wire S107;
	wire C107;
	fullAdder FA107(S107, C107, gout3,  S007, S037);		//remove C006
	wire S137;
	wire C137;
	fullAdder FA137(S137, C137, P52,  P61, P70);
	wire S108;
	wire C108;
	fullAdder FA108(S108, C108, C007,  C037, S018);
	wire S138;
	wire C138;
	fullAdder FA138(S138, C138, S048,  P62, P71);
	wire S109;
	wire C109;
	fullAdder FA109(S109, C109, C018,  C048, S029);
	wire S139;
	wire C139;
	fullAdder FA139(S139, C139, P54,  P63, P72);
	wire S1010;
	wire C1010;
	fullAdder FA1010(S1010, C1010, P37,  P46, P55);
	wire S1310;
	wire C1310;
	fullAdder FA1310(S1310, C1310, P64,  P73, C029);
	wire S1011;
	wire C1011;
	fullAdder FA1011(S1011, C1011, P47,  P56, P65);
 /************************** Height - 2 ********************************/ 
//	wire S203;
//	wire C203;
//	halfAdder HA203(S203, C203, P03, P12);
//	wire S204;
//	wire C204;
//	fullAdder FA204(S204, C204, S104,  P22, P31); 	
//	wire S205;
//	wire C205;
//	fullAdder FA205(S205, C205, C104,  S105, S135);	
//	wire S206;
//	wire C206;
//	fullAdder FA206(S206, C206, C105,  C135, S106);	
	wire S207;
	wire C207;
	fullAdder FA207(S207, C207, gout5, gout4, S107);	//remove C106, C136
	wire S208;
	wire C208;
	fullAdder FA208(S208, C208, C107,  C137, S108);
	wire S209;
	wire C209;
	fullAdder FA209(S209, C209, C108,  C138, S109);
	wire S2010;
	wire C2010;
	fullAdder FA2010(S2010, C2010, C109,  C139, S1010);
	wire S2011;
	wire C2011;
	fullAdder FA2011(S2011, C2011, C1010,  C1310, S1011);
	wire S2012;
	wire C2012;
	fullAdder FA2012(S2012, C2012, P57,  P66, P75);
 /************************** Height - 3 ********************************/ 
//	wire S302;
//	wire C302;
//	halfAdder HA302(S302, C302, P02, P11);
//	wire S303;
//	wire C303;
//	fullAdder FA303(S303, C303, S203,  P21, P30);
//	wire S304;
//	wire C304;
//	fullAdder FA304(S304, C304, C203,  S204, P40);
//	wire S305;
//	wire C305;
//	fullAdder FA305(S305, C305, C204,  S205, P50);
//	wire S306;
//	wire C306;
//	fullAdder FA306(S306, C306, C205,  S206, S136);	
	wire S307;
	wire C307;
	halfAdder HA307(S307, C307, S207, S137);		//remove C206 
	wire S308;
	wire C308;
	fullAdder FA308(S308, C308, C207,  S208, S138);
	wire S309;
	wire C309;
	fullAdder FA309(S309, C309, C208,  S209, S139);
	wire S3010;
	wire C3010;
	fullAdder FA3010(S3010, C3010, C209,  S2010, S1310);
	wire S3011;
	wire C3011;
	fullAdder FA3011(S3011, C3011, C2010,  S2011, P74);
	wire S3012;
	wire C3012;
	fullAdder FA3012(S3012, C3012, C2011,  S2012, C1011);
	wire S3013;
	wire C3013;
	fullAdder FA3013(S3013, C3013, P67,  P76, C2012);
/**************************************************************************/

	wire [7:0] in1	= {P77,S3013,S3012,S3011,S3010,S309,S308};
	wire [7:0] in2	= {C3013,C3012,C3011,C3010,C309,C308,C307};
	assign out	= in1 + in2;
	assign out_end 	= S307;


endmodule
