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
.param cycle = 1n
.param simtime = 5n

********************************
** Circuit description **
********************************
.SUBCKT nand2 in out vdd vss
MP1 out in vdd vdd pmos_lvt w=64n L=32n 
MP2 out in vdd vdd pmos_lvt w=64n L=32n 
MN1 out in net1 net1 nmos_lvt w=wn L=32n 
MN2 out in net2 net2 nmos_lvt w=wn L=32n 
MN3 net1 in vss vss nmos_lvt w=wn L=32n 
MN4 net2 in vss vss nmos_lvt w=wn L=32n 
.ENDS

xnand1 input output vdd vss nand2
********************************
** Power declaration **
********************************
vvdd vdd 0 xvdd
vvss vss 0 xvss

********************************
** Input declaration **
********************************
vin input 0 pulse(xvdd 0 1n 0.1n 0.1n 'cycle*0.45' cycle)


********************************
** Analysis setting **
********************************
.dc vin 0 0.8 0.01 sweep wn 136n 144n 4n **final result:wn=140n


.end
