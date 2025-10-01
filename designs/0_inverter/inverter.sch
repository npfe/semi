v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 140 -10 140 10 {lab=Vout}
N 80 -10 80 40 {lab=Vin}
N 80 40 100 40 {lab=Vin}
N 140 -30 140 -10 {lab=Vout}
N 140 -10 180 -10 {lab=Vout}
N 80 -60 80 -10 {lab=Vin}
N 80 -60 100 -60 {lab=Vin}
N 40 -10 80 -10 {lab=Vin}
N 140 -90 140 -60 {lab=VDD}
N 140 40 140 70 {lab=GND}
C {vdd.sym} 140 -90 0 0 {name=l1 lab=VDD}
C {gnd.sym} 140 70 0 0 {name=l2 lab=GND}
C {vsource.sym} -80 -70 0 0 {name=V1 value=3 savecurrent=false}
C {vdd.sym} -80 -100 0 0 {name=l3 lab=VDD}
C {gnd.sym} -80 -40 0 0 {name=l4 lab=GND}
C {vsource.sym} -150 -70 0 0 {name=Vin value=0 savecurrent=false}
C {gnd.sym} -150 -40 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -150 -100 2 0 {name=p1 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 40 -10 0 0 {name=p2 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 180 -10 2 0 {name=p3 sig_type=std_logic lab=Vout}
C {netlist.sym} 310 40 0 0 {name=SPICE value="
.dc Vin 0 3.0 0.01
.save all"}
C {pmos4.sym} 120 -60 0 0 {name=M1 model=pmos w=5u l=0.18u del=0 m=1}
C {nmos4.sym} 120 40 0 0 {name=M2 model=nmos w=5u l=0.18u del=0 m=1}
C {netlist_not_shown.sym} 310 -120 0 0 {name=MODELS 
only_toplevel=true 
value="
.model nmos NMOS (VTO=0.7 KP=200u L=0.18u W=5u)
.model pmos PMOS (VTO=-0.7 KP=100u L=0.18u W=5u)
"}
