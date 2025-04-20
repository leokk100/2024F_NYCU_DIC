********************************
**     Simulator setting      **
********************************
.option accurate
.option post           
.op
.TEMP 25.0
.global vdd vss

********************************
**      Library setting       **
********************************
.protect
.include '/RAID2/COURSE/dic/dic098/HW3/7nm_FF_160803.pm'
.unprotect

********************************
**      Input setting         **
********************************
vclk clk vss pulse(0 0.8 0n 0.1n 0.1n 0.8n 2n)
vin D vss pulse(0 0.8 0n 0.1n 0.1n 1.4n 3.2n)

********************************
**     Parameter setting      **
********************************
.param xvdd = 0.8
.param xvss = 0

********************************
**     Circuit description    **
********************************
.subckt INVX1 in out
mp1 out in vdd vdd pmos_rvt nfin=1
mp2 out in vss vss nmos_rvt nfin=1
.ends

.subckt INVX4 in out
mp out in vdd vdd pmos_rvt nfin=4
mn out in vss vss nmos_rvt nfin=4
.ends

.subckt TXGX4 in out pin nin
mp in pin out vdd pmos_rvt nfin=4
mn in nin out vss nmos_rvt nfin=4
.ends

.subckt TRI_STATE_INVERTERX1 in out en enbar
mp1 mp1_D in vdd vdd pmos_rvt nfin=1
mp2 out enbar mp1_D vdd pmos_rvt nfin=1
mn1 out en mn1_S vss nmos_rvt nfin=1
mn2 mn1_S in vss vss nmos_rvt nfin=1
.ends

.subckt DFF clk D Q Q_bar
X1 D in INVX4
X2 in n1 clk clk_bar TXGX4
X3 n1 n2 INVX4
X4 n2 n1 clk clk_bar TRI_STATE_INVERTERX1
X5 n2 n3 clk_bar clk TXGX4
X6 n3 n4 INVX4
X7 n4 n3 clk_bar clk TRI_STATE_INVERTERX1
X8 n4 Q INVX4
X9 n3 Q_bar INVX4
X10 clk clk_bar INVX4
.ends

*   main circuit with FO4 loading
X1 clk D Q Q_bar DFF

*   Add loading
XQinvLoad1 Q QinvLoad1 INVX1
XQinvLoad2 Q QinvLoad2 INVX1
XQinvLoad3 Q QinvLoad3 INVX1
XQinvLoad4 Q QinvLoad4 INVX1

XQbarinvLoad1 Q_bar Q_barinvLoad1 INVX1
XQbarinvLoad2 Q_bar Q_barinvLoad2 INVX1
XQbarinvLoad3 Q_bar Q_barinvLoad3 INVX1
XQbarinvLoad4 Q_bar Q_barinvLoad4 INVX1

********************************
**     Power declaration      **
********************************
vvdd       vdd       0    xvdd
vvss       vss       0    xvss

********************************
**     Analysis setting       **
********************************
.tran 0.01n 16n
.end