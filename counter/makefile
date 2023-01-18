GHDL ?= ghdl
GHDL_OPTS ?= --std=08

OBJF = counter.o counter_sim.o
BINF = counter_sim

all: $(BINF).ghw

%.o:%.vhd
	$(GHDL) -a $(GHDL_OPTS) $^

$(BINF): $(OBJF)
	$(GHDL) -e $(GHDL_OPTS) $@

$(BINF).ghw: $(BINF)
	$(GHDL) -r $(GHDL_OPTS) $^ --wave=$@ --stop-time=30ns

viewer: $(BINF).ghw
	gtkwave -S signals.tcl -f $(BINF).ghw

clean:
	- @rm $(BINF) $(BINF).ghw *.o *.cf
        

