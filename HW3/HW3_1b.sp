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
.param cycle = 1n
.param simtime = 5n

********************************
**     Circuit description    **
********************************
.subckt inverter in out vdd vss
*m1 out in vdd vdd pmos_rvt nfin = 1
m1 out in vdd vdd pmos_rvt nfin = 2

m2 out in vss vss nmos_rvt nfin = 1
.ends

xinv in out vdd vss inverter

********************************
**     Power declaration      **
********************************
vvdd       vdd       0    xvdd
vvss       vss       0    xvss

********************************
**     Input declaration      **
********************************
vin        in      vss     0

********************************
**     Analysis setting       **
********************************
.dc vin    0v  0.8v   0.01v
.dc vin  0.8v    0v  -0.01v

.end   