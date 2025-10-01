v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 520 -220 {}
N 470 -340 470 -320 {lab=Vout}
N 410 -340 410 -290 {lab=Vin}
N 410 -290 430 -290 {lab=Vin}
N 470 -360 470 -340 {lab=Vout}
N 470 -340 510 -340 {lab=Vout}
N 410 -390 410 -340 {lab=Vin}
N 410 -390 430 -390 {lab=Vin}
N 370 -340 410 -340 {lab=Vin}
N 470 -420 470 -390 {lab=VDD}
N 470 -290 470 -260 {lab=GND}
C {vdd.sym} 470 -420 0 0 {name=l1 lab=VDD}
C {gnd.sym} 470 -260 0 0 {name=l2 lab=GND}
C {vsource.sym} 160 -430 0 0 {name=V1 value=3 savecurrent=false}
C {vdd.sym} 160 -460 0 0 {name=l3 lab=VDD}
C {gnd.sym} 160 -400 0 0 {name=l4 lab=GND}
C {vsource.sym} 160 -270 0 0 {name=Vin value=0 savecurrent=false}
C {gnd.sym} 160 -240 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 160 -300 2 0 {name=p1 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 370 -340 0 0 {name=p2 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 510 -340 2 0 {name=p3 sig_type=std_logic lab=Vout}
C {netlist.sym} 720 -300 0 0 {name=SPICE value="
.dc Vin 0 3.0 0.01
.save all"}
C {pmos4.sym} 450 -390 0 0 {name=M1 model=pmos w=5u l=0.18u del=0 m=1}
C {nmos4.sym} 450 -290 0 0 {name=M2 model=nmos w=5u l=0.18u del=0 m=1}
C {netlist_not_shown.sym} 710 -460 0 0 {name=MODELS 
only_toplevel=true 
value="
.model nmos NMOS (VTO=0.7 KP=200u L=0.18u W=5u)
.model pmos PMOS (VTO=-0.7 KP=100u L=0.18u W=5u)
"}
C {title.sym} 160 0 0 0 {name=l6 author="Nicolas Pfefferle"}
