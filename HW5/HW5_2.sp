* 6T SRAM Cell Design - Read Operation Butterfly Curve
* Technology: 32nm, VDD = 0.9V

.option accurate
.option post
.op
.TEMP 25.0

.lib '/RAID2/COURSE/dic/dic098/HW5/bulk_32nm.l' TT

.param xvdd = 0.9            * Supply voltage
.param xvss = 0
.param LMIN = 32n            * Minimum channel length

vvdd vdd 0 xvdd
vvss vss 0 xvss

* SRAM Cell
MN1 A A_b vss vss nmos_svt L=LMIN W=256n
MN2 A word bit vss nmos_svt L=LMIN W=128n
MN3 A_b A vss vss nmos_svt L=LMIN W=256n
MN4 A_b word bit_b vss nmos_svt L=LMIN W=128n
MP1 A A_b vdd vdd pmos_svt L=LMIN W=64n
MP2 A_b A vdd vdd pmos_svt L=LMIN W=64n
MP3 bit phi vdd vdd pmos_svt L=LMIN W=64n
MP4 bit_b phi vdd vdd pmos_svt L=LMIN W=64n

* Stabilization capacitors for bitlines
CBIT bit vss 20f
CBITB bit_b vss 20f

* Input Signals
VA_b A_b 0 0
VWORD word 0 0.9
VPHI phi 0 0.9 


.dc VA_b 0 0.9 0.01
.print DC V(A)          
.probe V(*)
.end
