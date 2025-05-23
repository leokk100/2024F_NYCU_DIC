* 6T SRAM Cell Array Netlist
* Technology: 32nm, VDD = 0.9V

.option accurate
.option post           
.op
.TEMP 25.0

.lib '/RAID2/COURSE/dic/dic098/HW5/bulk_32nm.l' TT

.param xvdd = 0.9            * Supply voltage
.param xvss = 0
.param LMIN = 32n           * Minimum channel length

vvdd vdd 0 xvdd
vvss vss 0 xvss

* Input signals
VPHI phi 0 PULSE(0 xvdd 100ps 20ps 20ps 0.5ns 1ns)
VIN_W0 W0 0 PULSE(0 xvdd 100ps 20ps 20ps 0.5ns 1ns) * Activate W0 for SRAM0 read operation
VIN_W1 W1 0 DC 0
VIN_W2 W2 0 DC 0
VIN_W3 W3 0 DC 0
VIN_W4 W4 0 DC 0
VIN_W5 W5 0 DC 0
VIN_W6 W6 0 DC 0
VIN_W7 W7 0 DC 0
VIN_W8 W8 0 DC 0
VIN_W9 W9 0 DC 0
VIN_W10 W10 0 DC 0
VIN_W11 W11 0 DC 0
VIN_W12 W12 0 DC 0
VIN_W13 W13 0 DC 0
VIN_W14 W14 0 DC 0
VIN_W15 W15 0 DC 0
VIN_W16 W16 0 DC 0
VIN_W17 W17 0 DC 0
VIN_W18 W18 0 DC 0
VIN_W19 W19 0 DC 0
VIN_W20 W20 0 DC 0
VIN_W21 W21 0 DC 0
VIN_W22 W22 0 DC 0
VIN_W23 W23 0 DC 0
VIN_W24 W24 0 DC 0
VIN_W25 W25 0 DC 0
VIN_W26 W26 0 DC 0
VIN_W27 W27 0 DC 0
VIN_W28 W28 0 DC 0
VIN_W29 W29 0 DC 0
VIN_W30 W30 0 DC 0
VIN_W31 W31 0 DC 0
VIN_W32 W32 0 DC 0
VIN_W33 W33 0 DC 0
VIN_W34 W34 0 DC 0
VIN_W35 W35 0 DC 0
VIN_W36 W36 0 DC 0
VIN_W37 W37 0 DC 0
VIN_W38 W38 0 DC 0
VIN_W39 W39 0 DC 0
VIN_W40 W40 0 DC 0
VIN_W41 W41 0 DC 0
VIN_W42 W42 0 DC 0
VIN_W43 W43 0 DC 0
VIN_W44 W44 0 DC 0
VIN_W45 W45 0 DC 0
VIN_W46 W46 0 DC 0
VIN_W47 W47 0 DC 0
VIN_W48 W48 0 DC 0
VIN_W49 W49 0 DC 0
VIN_W50 W50 0 DC 0
VIN_W51 W51 0 DC 0
VIN_W52 W52 0 DC 0
VIN_W53 W53 0 DC 0
VIN_W54 W54 0 DC 0
VIN_W55 W55 0 DC 0
VIN_W56 W56 0 DC 0
VIN_W57 W57 0 DC 0
VIN_W58 W58 0 DC 0
VIN_W59 W59 0 DC 0
VIN_W60 W60 0 DC 0
VIN_W61 W61 0 DC 0
VIN_W62 W62 0 DC 0
VIN_W63 W63 0 DC 0


* Initial conditions for SRAM cells
.IC V(A0)=0V V(A_b0)=0.9V       * SRAM0: Initial value A=0, A_b=1
* SRAM1 to SRAM63: Initial value A=1, A_b=0
.IC V(A1)=0.9V V(A_b1)=0V V(A2)=0.9V V(A_b2)=0V
.IC V(A3)=0.9V V(A_b3)=0V V(A4)=0.9V V(A_b4)=0V
.IC V(A5)=0.9V V(A_b5)=0V V(A6)=0.9V V(A_b6)=0V
.IC V(A7)=0.9V V(A_b7)=0V V(A8)=0.9V V(A_b8)=0V
.IC V(A9)=0.9V V(A_b9)=0V V(A10)=0.9V V(A_b10)=0V
.IC V(A11)=0.9V V(A_b11)=0V V(A12)=0.9V V(A_b12)=0V
.IC V(A13)=0.9V V(A_b13)=0V V(A14)=0.9V V(A_b14)=0V
.IC V(A15)=0.9V V(A_b15)=0V V(A16)=0.9V V(A_b16)=0V
.IC V(A17)=0.9V V(A_b17)=0V V(A18)=0.9V V(A_b18)=0V
.IC V(A19)=0.9V V(A_b19)=0V V(A20)=0.9V V(A_b20)=0V
.IC V(A21)=0.9V V(A_b21)=0V V(A22)=0.9V V(A_b22)=0V
.IC V(A23)=0.9V V(A_b23)=0V V(A24)=0.9V V(A_b24)=0V
.IC V(A25)=0.9V V(A_b25)=0V V(A26)=0.9V V(A_b26)=0V
.IC V(A27)=0.9V V(A_b27)=0V V(A28)=0.9V V(A_b28)=0V
.IC V(A29)=0.9V V(A_b29)=0V V(A30)=0.9V V(A_b30)=0V
.IC V(A31)=0.9V V(A_b31)=0V V(A32)=0.9V V(A_b32)=0V
.IC V(A33)=0.9V V(A_b33)=0V V(A34)=0.9V V(A_b34)=0V
.IC V(A35)=0.9V V(A_b35)=0V V(A36)=0.9V V(A_b36)=0V
.IC V(A37)=0.9V V(A_b37)=0V V(A38)=0.9V V(A_b38)=0V
.IC V(A39)=0.9V V(A_b39)=0V V(A40)=0.9V V(A_b40)=0V
.IC V(A41)=0.9V V(A_b41)=0V V(A42)=0.9V V(A_b42)=0V
.IC V(A43)=0.9V V(A_b43)=0V V(A44)=0.9V V(A_b44)=0V
.IC V(A45)=0.9V V(A_b45)=0V V(A46)=0.9V V(A_b46)=0V
.IC V(A47)=0.9V V(A_b47)=0V V(A48)=0.9V V(A_b48)=0V
.IC V(A49)=0.9V V(A_b49)=0V V(A50)=0.9V V(A_b50)=0V
.IC V(A51)=0.9V V(A_b51)=0V V(A52)=0.9V V(A_b52)=0V
.IC V(A53)=0.9V V(A_b53)=0V V(A54)=0.9V V(A_b54)=0V
.IC V(A55)=0.9V V(A_b55)=0V V(A56)=0.9V V(A_b56)=0V
.IC V(A57)=0.9V V(A_b57)=0V V(A58)=0.9V V(A_b58)=0V
.IC V(A59)=0.9V V(A_b59)=0V V(A60)=0.9V V(A_b60)=0V
.IC V(A61)=0.9V V(A_b61)=0V V(A62)=0.9V V(A_b62)=0V
.IC V(A63)=0.9V V(A_b63)=0V

* SRAM Cell Definition
.subckt SRAM BL BLB W vdd vss
MN1 A A_b vss vss nmos_svt L=LMIN W=256n
MN2 A W BL vss nmos_svt L=LMIN W=128n
MN3 A_b A vss vss nmos_svt L=LMIN W=256n
MN4 A_b W BLB vss nmos_svt L=LMIN W=128n
MP1 A A_b vdd vdd pmos_svt L=LMIN W=64n
MP2 A_b A vdd vdd pmos_svt L=LMIN W=64n
.ends SRAM

* Instantiate SRAM Cells
MN01 A0 A_b0 vss vss nmos_svt L=LMIN W=256n
MN02 A0 W0 BL vss nmos_svt L=LMIN W=128n
MN03 A_b0 A0 vss vss nmos_svt L=LMIN W=256n
MN04 A_b0 W0 BLB vss nmos_svt L=LMIN W=128n
MP01 A0 A_b0 vdd vdd pmos_svt L=LMIN W=64n
MP02 A_b0 A0 vdd vdd pmos_svt L=LMIN W=64n
MP03 BL phi vdd vdd pmos_svt L=LMIN W=64n
MP04 BLB phi vdd vdd pmos_svt L=LMIN W=64n
XSRAM1 BL BLB W1 vdd vss SRAM
XSRAM2 BL BLB W2 vdd vss SRAM
XSRAM3 BL BLB W3 vdd vss SRAM
XSRAM4 BL BLB W4 vdd vss SRAM
XSRAM5 BL BLB W5 vdd vss SRAM
XSRAM6 BL BLB W6 vdd vss SRAM
XSRAM7 BL BLB W7 vdd vss SRAM
XSRAM8 BL BLB W8 vdd vss SRAM
XSRAM9 BL BLB W9 vdd vss SRAM
XSRAM10 BL BLB W10 vdd vss SRAM
XSRAM11 BL BLB W11 vdd vss SRAM
XSRAM12 BL BLB W12 vdd vss SRAM
XSRAM13 BL BLB W13 vdd vss SRAM
XSRAM14 BL BLB W14 vdd vss SRAM
XSRAM15 BL BLB W15 vdd vss SRAM
XSRAM16 BL BLB W16 vdd vss SRAM
XSRAM17 BL BLB W17 vdd vss SRAM
XSRAM18 BL BLB W18 vdd vss SRAM
XSRAM19 BL BLB W19 vdd vss SRAM
XSRAM20 BL BLB W20 vdd vss SRAM
XSRAM21 BL BLB W21 vdd vss SRAM
XSRAM22 BL BLB W22 vdd vss SRAM
XSRAM23 BL BLB W23 vdd vss SRAM
XSRAM24 BL BLB W24 vdd vss SRAM
XSRAM25 BL BLB W25 vdd vss SRAM
XSRAM26 BL BLB W26 vdd vss SRAM
XSRAM27 BL BLB W27 vdd vss SRAM
XSRAM28 BL BLB W28 vdd vss SRAM
XSRAM29 BL BLB W29 vdd vss SRAM
XSRAM30 BL BLB W30 vdd vss SRAM
XSRAM31 BL BLB W31 vdd vss SRAM
XSRAM32 BL BLB W32 vdd vss SRAM
XSRAM33 BL BLB W33 vdd vss SRAM
XSRAM34 BL BLB W34 vdd vss SRAM
XSRAM35 BL BLB W35 vdd vss SRAM
XSRAM36 BL BLB W36 vdd vss SRAM
XSRAM37 BL BLB W37 vdd vss SRAM
XSRAM38 BL BLB W38 vdd vss SRAM
XSRAM39 BL BLB W39 vdd vss SRAM
XSRAM40 BL BLB W40 vdd vss SRAM
XSRAM41 BL BLB W41 vdd vss SRAM
XSRAM42 BL BLB W42 vdd vss SRAM
XSRAM43 BL BLB W43 vdd vss SRAM
XSRAM44 BL BLB W44 vdd vss SRAM
XSRAM45 BL BLB W45 vdd vss SRAM
XSRAM46 BL BLB W46 vdd vss SRAM
XSRAM47 BL BLB W47 vdd vss SRAM
XSRAM48 BL BLB W48 vdd vss SRAM
XSRAM49 BL BLB W49 vdd vss SRAM
XSRAM50 BL BLB W50 vdd vss SRAM
XSRAM51 BL BLB W51 vdd vss SRAM
XSRAM52 BL BLB W52 vdd vss SRAM
XSRAM53 BL BLB W53 vdd vss SRAM
XSRAM54 BL BLB W54 vdd vss SRAM
XSRAM55 BL BLB W55 vdd vss SRAM
XSRAM56 BL BLB W56 vdd vss SRAM
XSRAM57 BL BLB W57 vdd vss SRAM
XSRAM58 BL BLB W58 vdd vss SRAM
XSRAM59 BL BLB W59 vdd vss SRAM
XSRAM60 BL BLB W60 vdd vss SRAM
XSRAM61 BL BLB W61 vdd vss SRAM
XSRAM62 BL BLB W62 vdd vss SRAM
XSRAM63 BL BLB W63 vdd vss SRAM

* Simulation commands
.tran 10ps 2ns
.end
