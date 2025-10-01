#### Schematics

In xschem the models are stored on the schematic directly. With a symbol named `netlist_not_shown.sym` models can be defined in spice. 

**Example**: 
````spice 
name=MODELS 
only_toplevel=true 
value="
.model nmos NMOS (VTO=0.7 KP=200u L=0.18u W=5u)
.model pmos PMOS (VTO=-0.7 KP=100u L=0.18u W=5u)
"
````

The model syntax comes from the `spice` documentation see [references](references/ngspice-manual.pdf). 

What is important is to specify the model of the device in its attributes: 

![attributes](figures/xschem-pmos-attributes.png)

and this model attribute must be specified in the schematic's netlist:

![netlist](figures/xschem-models.png)
