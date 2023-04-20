GHDL ?= ghdl

OBJF = \
../../tool_VHDLToolbox/counter.o\
../../tool_VHDLToolbox/cout.o\
../../tool_VHDLToolbox/fifo.o\
TestBench.o
BINF = TestBench

GHDL_OPTS =
#GHDL_OPTS = --std=93

YOSYS_DATDIR = $(shell yosys-config --datdir)

all: $(BINF)
	- @rm $(BINF).o
#all: $(BINF).ghw

%.o:%.vhd
	$(GHDL) -a $(GHDL_OPTS) $^

$(BINF): $(OBJF)
	$(GHDL) -e $(GHDL_OPTS) $@

$(BINF).ghw: $(BINF)
	$(GHDL) -r $^ --wave=$@

viewer: $(BINF).ghw
	gtkwave -S signals.tcl -f $(BINF).ghw

clean:
	- @rm $(BINF) *.o work-obj??.cf
        
# sample only might not work
verilog:
	ghdl --synth --out=verilog ${BINF} > ${BINF}.v

netlist:
	yosys -m $(YOSYS_DATDIR)/plugins/ghdl.so -p 'ghdl $(BINF); write_json $(BINF).json'
	netlistsvg ${BINF}.json -o ${BINF}.svg