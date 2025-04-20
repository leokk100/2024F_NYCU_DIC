********************************
**     Simulator setting      **
********************************
.option accurate
.option post           
.op
.TEMP 25.0

********************************
**     Library setting        **
********************************
.protect
.include '/RAID2/COURSE/dic/dic098/HW3/7nm_FF_160803.pm'
.unprotect

********************************
**     Parameter setting      **
********************************
.param xvdd = 0.8
.param xvss = 0

********************************
**     Circuit description    **
********************************
*m Drain Gate Source Bulk pmos/nmos nfin
m1 vdsp vgsp vdd vdd pmos_rvt nfin = 1
m2 vdsn vgsn vss vss nmos_rvt nfin = 1

********************************
**     Power declaration      **
********************************
vvdd       vdd       0    xvdd
vvss       vss       0    xvss

********************************
**     Input declaration      **
********************************
vdsp      vdsp      vdd      0
vdsn      vdsn      vss      0
vgsp      vgsp      vdd      0
vgsn      vgsn      vss      0

********************************
**     Analysis setting       **
********************************
* test pmos and nmos respectively
.dc vdsp 0 -0.8 -0.01   sweep vgsp -0.35 -0.8 -0.05
.dc vdsn 0  0.8  0.01   sweep vgsn 0.35 0.8 0.05
.probe i(*)
.print i(*)


.end   