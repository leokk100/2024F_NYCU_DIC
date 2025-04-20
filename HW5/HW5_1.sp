* 6T SRAM Cell Design
* Technology: 32nm, VDD = 0.9V

.option accurate
.option post           
.op
.TEMP 25.0



.lib '/RAID2/COURSE/dic/dic098/HW5/bulk_32nm.l'TT



.param xvdd = 0.9            * Supply voltage
.param xvss = 0
.param LMIN = 32n           * Minimum channel length


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

CBIT bit vss 20f   * Stabilization capacitor for bit
CBITB bit_b vss 20f   * Stabilization capacitor for bit_b


* Input signals
VIN_WORD word 0 PULSE(0 xvdd 100ps 20ps 20ps 0.5ns 1ns)  * Word line
*VIN_BIT bit 0 PULSE(xvdd 0 100ps 20ps 20ps 0.5ns 1ns)    * Bit line
*VIN_BIT_B bit_b 0 PULSE(0 xvdd 100ps 20ps 20ps 0.5ns 1ns) * Complementary bit line
VPHI phi 0 PULSE(0 xvdd 100ps 20ps 20ps 0.5ns 1ns)

.IC V(A)=0.9V V(A_b)=0V *V(bit)=0.9V *V(bit_b)=0.9V

* Simulation control
.TRAN 1ps 5ns                     * Transient analysis for 10ns
.end
