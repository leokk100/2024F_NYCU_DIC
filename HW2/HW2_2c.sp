.option accurate
.option post           
.op
.TEMP 25.0


.lib '/RAID2/COURSE/dic/dic098/HW2/bulk_32nm.l'TT

********************************
** Parameter setting **
********************************
.param xvdd = 0.8
.param xvss = 0
.param cycle = 2n
.param simtime = 5n

********************************
** Circuit description **
********************************
.SUBCKT nand2 ina inb out vdd vss
MP1 out ina vdd vdd pmos_lvt w=64n L=32n 
MP2 out inb vdd vdd pmos_lvt w=64n L=32n 
MN1 out ina net1 net1 nmos_lvt w=140n L=32n 
MN2 out inb net2 net2 nmos_lvt w=140n L=32n 
MN3 net1 inb vss vss nmos_lvt w=140n L=32n 
MN4 net2 ina vss vss nmos_lvt w=140n L=32n 
.ENDS

xnand1 a b output1 vdd1 vss nand2
xnand2 output1 vdd1 output2 vdd2 vss nand2
xnand3 output1 vdd1 output3 vdd3 vss nand2
********************************
** Power declaration **
********************************
vvdd1 vdd1 0 xvdd
vvdd2 vdd2 0 xvdd
vvdd3 vdd3 0 xvdd
vvss vss 0 xvss

********************************
** Input declaration **
********************************
**vin1 a 0 dc 0.8
**vin2 b 0 pulse(0 0.8 0 0.4n 0.4n 1n 2n)
vin1 a 0 pulse(0 0.8 0 0.4n 0.4n 1n 2n)
vin2 b 0 dc 0.8
********************************
** Analysis setting **
********************************
.tran 0.01n simtime

.meas tran power1 AVG p(xnand1) from=0ns to=5ns
.meas tran power2 AVG p(xnand2) from=0ns to=5ns
.meas tran power3 AVG p(xnand3) from=0ns to=5ns

.meas tran power1 MAX p(xnand1) from=0ns to=5ns
.meas tran power2 MAX p(xnand2) from=0ns to=5ns
.meas tran power3 MAX p(xnand3) from=0ns to=5ns

.meas tran avg_power AVG power from=0ns to=5ns
.meas tran peak_power MAX power from=0ns to=5ns

.end
