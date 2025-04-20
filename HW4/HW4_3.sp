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
.include '/RAID2/COURSE/dic/dic098/HW4/7nm_FF_160803.pm'
.unprotect

********************************
**     Power declaration      **
********************************
vvdd       vdd       0    0.8
vvss       vss       0    0

********************************
**      Input setting         **
********************************
VA1 A1 0 pulse(0 0.8 10p 20p 20p 125p 250p)
VA2 A2 0 pulse(0 0.8 155p 20p 20p 250p 500p)
VA3 A3 0 pulse(0 0.8 425p 20p 20p 500p 1n)
VA4 A4 0 pulse(0 0.8 945p 20p 20p 1n 2n)
VB1 B1 0 pulse(0.8 0 10p 20p 20p 125p 250p)
VB2 B2 0 pulse(0.8 0 155p 20p 20p 250p 500p)
VB3 B3 0 pulse(0.8 0 425p 20p 20p 500p 1n)
VB4 B4 0 pulse(0.8 0 945p 20p 20p 1n 2n)
VCIN Cin 0 pulse(0 0.8 10p 20p 20p 125p 250p)
vclk clk 0 pulse(0 0.8 0 20p 20p 10p 60p)

********************************
**     Circuit description    **
********************************
.subckt INVX1 in out
mp1 out in vdd vdd pmos_rvt nfin=2
mp2 out in vss vss nmos_rvt nfin=1
.ends

.subckt INVX8 in out
mp1 out in vdd vdd pmos_rvt nfin=16
mp2 out in vss vss nmos_rvt nfin=8
.ends

.subckt BUFFERX1 in out
XINV1 in temp INVX1
XINV2 temp out INVX1
.ends

.subckt FO4 in
X1 in out1 INVX1
X2 in out2 INVX1
X3 in out3 INVX1
X4 in out4 INVX1
.ends

.subckt FA A B C CB SB pfin1=4 pfin2=4 pfin3=6 nfin1=2 nfin2=2 nfin3=3
* CARRY PART *
mp1 n1 A vdd vdd pmos_rvt nfin=pfin1
mp2 n1 B vdd vdd pmos_rvt nfin=pfin1
mp3 n3 B vdd vdd pmos_rvt nfin=pfin1
mp4 CB C n1 vdd pmos_rvt nfin=pfin1
mp5 CB A n3 vdd pmos_rvt nfin=pfin1

mn1 CB C n2 vss nmos_rvt nfin=nfin1
mn2 CB A n4 vss nmos_rvt nfin=nfin1
mn3 n2 A vss vss nmos_rvt nfin=nfin1
mn4 n2 B vss vss nmos_rvt nfin=nfin1
mn5 n4 B vss vss nmos_rvt nfin=nfin1

* SUM PART *
mp6 n5 A vdd vdd pmos_rvt nfin=pfin2
mp7 n5 B vdd vdd pmos_rvt nfin=pfin2
mp8 n5 C vdd vdd pmos_rvt nfin=pfin2
mp9 SB CB n5 vdd pmos_rvt nfin=pfin2

mp10 n7 C vdd vdd pmos_rvt nfin=pfin3
mp11 n8 B n7 vdd pmos_rvt nfin=pfin3
mp12 SB A n8 vdd pmos_rvt nfin=pfin3

mn6 SB CB n6 vss nmos_rvt nfin=nfin2
mn7 n6 A vss vss nmos_rvt nfin=nfin2
mn8 n6 B vss vss nmos_rvt nfin=nfin2
mn9 n6 C vss vss nmos_rvt nfin=nfin2

mn10 SB A n9 vss nmos_rvt nfin=nfin3
mn11 n9 B n10 vss nmos_rvt nfin=nfin3
mn12 n10 C vss vss nmos_rvt nfin=nfin3
.ends

.subckt DFF clk D OUT
m1 n5 D vdd vdd pmos_rvt nfin = 4
m2 n0 clk n5 vdd pmos_rvt nfin = 4
m3 n0 d vss vss nmos_rvt nfin = 2

m4 n1 clk vdd vdd pmos_rvt nfin = 1
m5 n1 n0 n2 vss nmos_rvt nfin = 4
m6 n2 clk vss vss nmos_rvt nfin = 4

m7 n3 n1 vdd vdd pmos_rvt nfin = 2
m8 n3 clk n4 vss nmos_rvt nfin = 4
m9 n4 n1 vss vss nmos_rvt nfin = 4

XINV n3 out INVX8
.ends

*   main circuit

*   input provide by the unit size inverter/buffer
XFFA1 clk A1 A1FFOUT DFF
XFFA2 clk A2 A2FFOUT DFF
XFFA3 clk A3 A3FFOUT DFF
XFFA4 clk A4 A4FFOUT DFF
XFFB1 clk B1 B1FFOUT DFF
XFFB2 clk B2 B2FFOUT DFF
XFFB3 clk B3 B3FFOUT DFF
XFFB4 clk B4 B4FFOUT DFF
XFFCIN clk Cin CinFFOUT DFF

XBUFFA1 A1FFOUT A1BUFFOUT BUFFERX1
XBUFFB1 B1FFOUT B1BUFFOUT BUFFERX1
XINVA2 A2FFOUT A2INVOUT INVX1
XINVB2 B2FFOUT B2INVOUT INVX1
XBUFFA3 A3FFOUT A3BUFFOUT BUFFERX1
XBUFFB3 B3FFOUT B3BUFFOUT BUFFERX1
XINVA4 A4FFOUT A4INVOUT INVX1
XINVB4 B4FFOUT B4INVOUT INVX1
XBUFFCIN CinFFOUT CINBUFFOUT BUFFERX1

*   Logic effort version
* XFA1 A1BUFFOUT B1BUFFOUT CINBUFFOUT c1b s1b FA pfin1=5 pfin2=5 pfin3=7 nfin1=2 nfin2=2 nfin3=3
* XFA2 A2INVOUT B2INVOUT c1b c2 s2 FA pfin1=6 pfin2=6 pfin3=9 nfin1=3 nfin2=3 nfin3=5
* XFA3 A3BUFFOUT B3BUFFOUT c2 c3b s3b FA pfin1=7 pfin2=7 pfin3=11 nfin1=3 nfin2=3 nfin3=5
* XFA4 A4INVOUT B4INVOUT c3b cout s4 FA pfin1=8 pfin2=8 pfin3=12 nfin1=4 nfin2=4 nfin3=6

*   Optimization version
XFA1 A1BUFFOUT B1BUFFOUT CINBUFFOUT c1b s1b FA pfin1=15 pfin2=2 pfin3=3 nfin1=10 nfin2=1 nfin3=2
XFA2 A2INVOUT B2INVOUT c1b c2 s2 FA pfin1=25 pfin2=4 pfin3=4 nfin1=15 nfin2=2 nfin3=3
XFA3 A3BUFFOUT B3BUFFOUT c2 c3b s3b FA pfin1=35 pfin2=5 pfin3=6 nfin1=20 nfin2=3 nfin3=4
XFA4 A4INVOUT B4INVOUT c3b cout s4 FA pfin1=45 pfin2=7 pfin3=8 nfin1=25 nfin2=5 nfin3=6

XINV14 s1b s1 INVX1
XINV15 s3b s3 INVX1

XDFFS1 clk s1 s1DFFOUT DFF 
XDFFS2 clk s2 s2DFFOUT DFF 
XDFFS3 clk s3 s3DFFOUT DFF 
XDFFS4 clk s4 s4DFFOUT DFF
XDFFcout clk cout coutDFFOUT DFF

XLoad1 s1 FO4
XLoad2 s2 FO4
XLoad3 s3 FO4
XLoad4 s4 FO4
XLoad5 cout FO4
********************************
**     Analysis setting       **
********************************
.tran 0.01n 5n
.meas tran AvgPower  avg  power
.meas tran PeakPower MAX  power
.end