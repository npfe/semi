### Installing xschem on Ubuntu
Install the following packages:

````bash
sudo apt install -y git build-essential cmake \
libx11-dev libxpm-dev libxft-dev libxext-dev \
tcl-dev tk-dev libx11-dev libxrender-dev \
libxrandr-dev libxinerama-dev libxcursor-dev \
libxfixes-dev \
libgtk2.0-dev pkg-config\
flex bison\
autoconf automake
````

Clone source from github:
````bash
git clone https://github.com/StefanSchippers/xschem.git
````

Configure, build and install xschem (system wide):
````bash
./configure 
make
sudo make install
````

Test xschem is working:
````bash
xschem
````

### Using MobaXterm

MobaXTerm on Windows is the only solution that worked out of the box, it only requires minimal configuration on the Ubuntu machine:

````bash
sudo apt install openssh
````

Update the configuration files for the SSH server to forward X session over SSH. 
````bash
sudo nano /etc/ssh/sshd_config 

X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes
````
On windows side, install [MobaXterm](https://mobaxterm.mobatek.net/download-home-edition.html) and then configure the session to start xschem on launch:

![MobaXtermSession](figures/xschem-session.png)

### Installing on MacOs

There are claims that it can be installed with `brew` but that doesn't seem to work or I do something wrong. Building from source is more succesfull. 

Get Quartz, a X11 server for MacOs, here -> https://github.com/XQuartz/XQuartz 

#### Build and install TCL for X11

**Note**: The installation is done in `/usr/local/opt2`to avoid overriding existing software.

````bash
mkdir tcltk
cd tcltk
wget https://prdownloads.sourceforge.net/tcl/tcl8.6.10-src.tar.gz
gz -xf tcl8.6.10-src.tar.gz
cd tcl8.6.10-src/unix
./configure --prefix=/usr/local/opt2/tcl-tk  
make
sudo make install
````

#### Build and install TK for X11


````bash
cd tcltk
wget https://prdownloads.sourceforge.net/tcl/tk8.6.10-src.tar.gz 
gz -xf tk8.6.10-src.tar.gz
cd tk8.6.10-src/unix
`````

**IMPORTANT**: before building the package, make sure `LIB_RUNTIME_DIR` is set correctly in `unix/Makefile.in`

````bash
LIB_RUNTIME_DIR         = $(libdir)# no character after brackets
````

Configure, build and install the package:

````bash
./configure --prefix=/usr/local/opt2/tcl-tk \
--with-tcl=/usr/local/opt2/tcl-tk/lib --with-x \
--x-includes=/opt/X11/include --x-libraries=/opt/X11/lib  
make
sudo make install
````

#### Build & Install magic

````bash
git clone https://github.com/RTimothyEdwards/magic.git 
cd magic 
./configure --with-tcl=/usr/local/opt2/tcl-tk/lib \
--with-tk=/usr/local/opt2/tcl-tk/lib \
--x-includes=/opt/X11/include \
--x-libraries=/opt/X11/lib \
CFLAGS=-Wno-error=implicit-function-declaration
make
sudo make install
````

#### Build & Install xschem

````bash
git clone https://github.com/StefanSchippers/xschem.git  
cd xschem  
./configure --prefix=/Users/$(whoami)/xschem-macos
````

**IMPORTANT**: Edit `Makefile.conf`, replace `CFLAGS` and `LDFLAGS` with:
````bash
CFLAGS=-I/opt/X11/include -I/opt/X11/include/cairo \
-I/usr/local/opt2/tcl-tk/include -O2
LDFLAGS=-L/opt/X11/lib -L/usr/local/opt2/tcl-tk/lib -lm -lcairo \
-lX11 -lXrender -lxcb -lxcb-render -lX11-xcb -lXpm -ltcl8.6 -ltk8.6
````
Finally, build and install xschem
````bash
make 
sudo make install
```