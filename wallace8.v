module wallace8(out, a, b);

	input [7:0]a;
	input [7:0]b;
	output [8:0]out;
	wire S0101;
	wire C0101;

	wire S0102;
	wire C0102;

	wire S0103;
	wire C0103;

	wire S0104;
	wire C0104;

	wire S0105;
	wire C0105;

	wire S0106;
	wire C0106;

	wire S0107;
	wire C0107;

	wire S0108;
	wire C0108;

	wire S0234;
	wire C0234;

	wire S0235;
	wire C0235;

	wire S0236;
	wire C0236;

	wire S0237;
	wire C0237;

	wire S0238;
	wire C0238;

	wire S0239;
	wire C0239;

	wire S02310;
	wire C02310;

	wire S02311;
	wire C02311;

	wire S0367;
	wire C0367;

	wire S0368;
	wire C0368;

	wire S0369;
	wire C0369;

	wire S03610;
	wire C03610;

	wire S03611;
	wire C03611;

	wire S03612;
	wire C03612;

	wire S03613;
	wire C03613;

	 /************************** Height - 1 ********************************/ 
	wire S1102;
	wire C1102;

	wire S1103;
	wire C1103;

	wire S1104;
	wire C1104;

	wire S1105;
	wire C1105;

	wire S1106;
	wire C1106;

	wire S1107;
	wire C1107;

	wire S1108;
	wire C1108;

	wire S1109;
	wire C1109;

	wire S1236;
	wire C1236;

	wire S1237;
	wire C1237;

	wire S1238;
	wire C1238;

	wire S1239;
	wire C1239;

	wire S12310;
	wire C12310;

	wire S12311;
	wire C12311;

	wire S12312;
	wire C12312;

	wire S12313;
	wire C12313;

	wire S12314;
	wire C12314;

	 /************************** Height - 2 ********************************/ 
	wire S2103;
	wire C2103;

	wire S2104;
	wire C2104;

	wire S2105;
	wire C2105;

	wire S2106;
	wire C2106;

	wire S2107;
	wire C2107;

	wire S2108;
	wire C2108;

	wire S2109;
	wire C2109;

	wire S21010;
	wire C21010;

	wire S21011;
	wire C21011;

	wire S21012;
	wire C21012;

	 /************************** Height - 3 ********************************/ 
	wire S3104;
	wire C3104;

	wire S3105;
	wire C3105;

	wire S3106;
	wire C3106;

	wire S3107;
	wire C3107;

	wire S3108;
	wire C3108;

	wire S3109;
	wire C3109;

	wire S31010;
	wire C31010;

	wire S31011;
	wire C31011;

	wire S31012;
	wire C31012;

	wire S31013;
	wire C31013;

	wire S31014;
	wire C31014;
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
	wire [2:0] cout1;
	wire [2:0] cout2;
	wire [2:0] cout3;
	wire [2:0] cout4;
	wire [2:0] cout5;

	wire gout1;
	wire gout2;
	wire gout3;
	wire gout4;
	wire gout5;

	wire Pout1;
	wire pout2;
	wire pout3;
	wire pout4;
	wire pout5;

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

	//Row 1
	lookAheadLogic row1(cout1[2:0], gout1, pout1, la1[3:0], lb1[3:0], cin1);
	lookAheadLogic row2(cout2[2:0], gout2, pout2, la2[3:0], lb2[3:0], cin2);
	lookAheadLogic row3(cout3[2:0], gout3, pout3, la3[3:0], lb3[3:0], cin3);
	assign la1= {P04,P03,P02,P01};
	assign lb1= {P13,P12,P11,P10};
	assign cin1=0;
	assign la2= {2'b0,P05,P06};
	assign lb2= {2'b0,P15,P14};
	assign cin2=cout3[0];
	assign la3= {2'b0,pout2,pout1};
	assign lb3= {2'b0,gout2,gout1}; //gout1 = final carry1
	assign cin3=0;

	//Row 2
	lookAheadLogic row4(cout4[2:0], gout4, pout4, la4[3:0], lb4[3:0], cin4); //gout4= final carry2
	assign la4= {P24,P23,P22,P21};
	assign lb1= {P33,P32,P31,P30};
	assign cin1=0;

	//Row 3
	lookAheadLogic row5(cout5[2:0], gout5, pout5, la5[3:0], lb5[3:0], cin5); //gout5= final carry3
	assign la4= {2'b0,P42,P41};
	assign lb1= {2'b0,P51,P50};
	assign cin1=0;
	
	 /************************** and gate DOT PRODUCT matrix ********************************/ 
	and A00(P00, a[0], b[0]);
	and A01(P01, a[0], b[1]);
	and A02(P02, a[0], b[2]);
	and A03(P03, a[0], b[3]);
	and A04(P04, a[0], b[4]);
	and A05(P05, a[0], b[5]);
	and A06(P06, a[0], b[6]);
	and A07(P07, a[0], b[7]);
	and A10(P10, a[1], b[0]);
	and A11(P11, a[1], b[1]);
	and A12(P12, a[1], b[2]);
	and A13(P13, a[1], b[3]);
	and A14(P14, a[1], b[4]);
	and A15(P15, a[1], b[5]);
	and A16(P16, a[1], b[6]);
	and A17(P17, a[1], b[7]);
	and A20(P20, a[2], b[0]);
	and A21(P21, a[2], b[1]);
	and A22(P22, a[2], b[2]);
	and A23(P23, a[2], b[3]);
	and A24(P24, a[2], b[4]);
	and A25(P25, a[2], b[5]);
	and A26(P26, a[2], b[6]);
	and A27(P27, a[2], b[7]);
	and A30(P30, a[3], b[0]);
	and A31(P31, a[3], b[1]);
	and A32(P32, a[3], b[2]);
	and A33(P33, a[3], b[3]);
	and A34(P34, a[3], b[4]);
	and A35(P35, a[3], b[5]);
	and A36(P36, a[3], b[6]);
	and A37(P37, a[3], b[7]);
	and A40(P40, a[4], b[0]);
	and A41(P41, a[4], b[1]);
	and A42(P42, a[4], b[2]);
	and A43(P43, a[4], b[3]);
	and A44(P44, a[4], b[4]);
	and A45(P45, a[4], b[5]);
	and A46(P46, a[4], b[6]);
	and A47(P47, a[4], b[7]);
	and A50(P50, a[5], b[0]);
	and A51(P51, a[5], b[1]);
	and A52(P52, a[5], b[2]);
	and A53(P53, a[5], b[3]);
	and A54(P54, a[5], b[4]);
	and A55(P55, a[5], b[5]);
	and A56(P56, a[5], b[6]);
	and A57(P57, a[5], b[7]);
	and A60(P60, a[6], b[0]);
	and A61(P61, a[6], b[1]);
	and A62(P62, a[6], b[2]);
	and A63(P63, a[6], b[3]);
	and A64(P64, a[6], b[4]);
	and A65(P65, a[6], b[5]);
	and A66(P66, a[6], b[6]);
	and A67(P67, a[6], b[7]);
	and A70(P70, a[7], b[0]);
	and A71(P71, a[7], b[1]);
	and A72(P72, a[7], b[2]);
	and A73(P73, a[7], b[3]);
	and A74(P74, a[7], b[4]);
	and A75(P75, a[7], b[5]);
	and A76(P76, a[7], b[6]);
	and A77(P77, a[7], b[7]);
	
	 /************************** Height - 0 ********************************/ 
	//halfAdder HA0101(S0101, C0101, P01, P10);
	//fullAdder FA0102(S0102, C0102, P02, P11, P20);
	//fullAdder FA0103(S0103, C0103, P03, P12, P21);
	//fullAdder FA0104(S0104, C0104, P04, P13, P22);
	//fullAdder FA0105(S0105, C0105, P05, P14, P23);
	//fullAdder FA0106(S0106, C0106, P06, P15, P24);
	fullAdder FA0107(S0107, C0107, P07, P16, P25);
	halfAdder HA0108(S0108, C0108, P17, P26);
	//halfAdder HA0234(S0234, C0234, P31, P40);
	//fullAdder FA0235(S0235, C0235, P32, P41, P50);
	//fullAdder FA0236(S0236, C0236, P33, P42, P51);
	fullAdder FA0237(S0237, C0237, P34, P43, P52);
	fullAdder FA0238(S0238, C0238, P35, P44, P53);
	fullAdder FA0239(S0239, C0239, P36, P45, P54);
	fullAdder FA02310(S02310, C02310, P37, P46, P55);
	halfAdder HA02311(S02311, C02311, P47, P56);
	halfAdder HA0367(S0367, C0367, P61, P70);
	halfAdder HA0368(S0368, C0368, P62, P71);
	halfAdder HA0369(S0369, C0369, P63, P72);
	halfAdder HA03610(S03610, C03610, P64, P73);
	halfAdder HA03611(S03611, C03611, P65, P74);
	halfAdder HA03612(S03612, C03612, P66, P75);
	halfAdder HA03613(S03613, C03613, P67, P76);
	
	 /************************** Height - 1 ********************************/ 
	//halfAdder HA1102(S1102, C1102, S0102, C0101);
	//fullAdder FA1103(S1103, C1103, S0103, C0102, P30);
	//fullAdder FA1104(S1104, C1104, S0104, C0103, S0234);
	//fullAdder FA1105(S1105, C1105, S0105, C0104, S0235);
	//fullAdder FA1106(S1106, C1106, S0106, C0105, S0236);
	fullAdder FA1107(S1107, C1107, S0107, gout1, S0237);    //remove C0106, add
	fullAdder FA1108(S1108, C1108, S0108, C0107, S0238);
	fullAdder FA1109(S1109, C1109, P27, C0108, S0239);
	//halfAdder HA1236(S1236, C1236, C0235, P60);
	halfAdder HA1237(S1237, C1237, gout4, S0367);   // remove C0236, add gout4
	fullAdder FA1238(S1238, C1238, C0237, S0368, C0367);
	fullAdder FA1239(S1239, C1239, C0238, S0369, C0368);
	fullAdder FA12310(S12310, C12310, C0239, S03610, C0369);
	fullAdder FA12311(S12311, C12311, C02310, S03611, C03610);
	fullAdder FA12312(S12312, C12312, C02311, S03612, C03611);
	halfAdder HA12313(S12313, C12313, S03613, C03612);
	halfAdder HA12314(S12314, C12314, P77, C03613);
	
	 /************************** Height - 2 ********************************/ 
	//halfAdder HA2103(S2103, C2103, S1103, C1102);
	//halfAdder HA2104(S2104, C2104, S1104, C1103);
	//fullAdder FA2105(S2105, C2105, S1105, C1104, C0234);
	//fullAdder FA2106(S2106, C2106, S1106, C1105, S1236);
	fullAdder FA2107(S2107, C2107, S1107, gout5, S1237);   //remove C1106, add gout5
	fullAdder FA2108(S2108, C2108, S1108, C1107, S1238);
	fullAdder FA2109(S2109, C2109, S1109, C1108, S1239);
	fullAdder FA21010(S21010, C21010, S02310, C1109, S12310);
	halfAdder HA21011(S21011, C21011, S02311, S12311);
	halfAdder HA21012(S21012, C21012, P57, S12312);
	
	 /************************** Height - 3 ********************************/ 
	//halfAdder HA3104(S3104, C3104, S2104, C2103);
	//halfAdder HA3105(S3105, C3105, S2105, C2104);
	//halfAdder HA3106(S3106, C3106, S2106, C2105);
	halfAdder HA3107(S3107, C3107, S2107, 0);    //remove C1236, C2106, Convert to HA
	fullAdder FA3108(S3108, C3108, S2108, C2107, C1237);
	fullAdder FA3109(S3109, C3109, S2109, C2108, C1238);
	fullAdder FA31010(S31010, C31010, S21010, C2109, C1239);
	fullAdder FA31011(S31011, C31011, S21011, C21010, C12310);
	fullAdder FA31012(S31012, C31012, S21012, C21011, C12311);
	fullAdder FA31013(S31013, C31013, S12313, C21012, C12312);
	halfAdder HA31014(S31014, C31014, S12314, C12313);
	
	
	assign out[0]= S3107;
	assign out[1]=S3108+C3107;
	assign out[2]=S3109+C3108;
	assign out[3]=S31010+C3109;
	assign out[4]=S31011+C31010;
	assign out[5]=S31012+C31011;
	assign out[6]=S31013+C31012;
	assign out[7]=S31014+C31013;
	assign out[8]=C31014+C12314;
	
	endmodule 
