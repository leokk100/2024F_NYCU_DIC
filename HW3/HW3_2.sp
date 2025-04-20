********************************
**     Simulator setting      **
********************************
.option accurate
.option post           
.op
.TEMP 25.0

********************************
**      Library setting       **
********************************
.protect
.include '/RAID2/COURSE/dic/dic098/HW3/7nm_FF_160803.pm'
.unprotect

********************************
**          Measure           **
********************************
.meas pavg AVG POWER
.meas pmax MAX POWER
.meas TRAN PERIOD TRIG V(input) VAL=0.413 RISE=1
+                 TARG V(input) VAL=0.413 RISE=2

********************************
**     Parameter setting      **
********************************
.param xvdd = 0.8
.param xvss = 0
.param simtime = 100p

********************************
**     Circuit description    **
********************************
.subckt inverter in out vdd vss
m1 out in vdd vdd pmos_rvt nfin = 2
m2 out in vss vss nmos_rvt nfin = 1
.ends

xinv1 input out1  vdd vss inverter
xinv2 out1  out2  vdd vss inverter
xinv3 out2  input vdd vss inverter

********************************
**     Power declaration      **
********************************
vvdd       vdd       0    xvdd
vvss       vss       0    xvss

********************************
**     Analysis setting       **
********************************
*initial condition
.ic v(input) = 0
.ic v(out1) = 0.8
.ic v(out2) = 0


.tran 1p simtime

.print FREQ = 1/PERIOD

.end