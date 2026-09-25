WORK_DIR = work
HDL_DIR  = hdl
SIM_DIR  = sim

SRCS = $(wildcard $(HDL_DIR)/*.vhd)
OBJS = $(patsubst $(HDL_DIR)/%.vhd,$(WORK_DIR)/%.o,$(SRCS))

SIM_SRCS = $(wildcard $(SIM_DIR)/*.vhd)
SIM_OBJS = $(patsubst $(SIM_DIR)/%.vhd,$(WORK_DIR)/%.o,$(SIM_SRCS))

BOARD_FAMILY  = ice40
BOARD_MODEL   = up5k
BOARD_PACKAGE = sg48
BOARD_DIR     = board/$(BOARD_FAMILY)-$(BOARD_MODEL)

BOND_SERIAL_DEV = /dev/ttyACM0

DESIGN = opdracht124
TESTBENCH = $(DESIGN)_tb

CONSTRAINTS = $(BOARD_DIR)/$(DESIGN).pcf

SYN_JSON = $(WORK_DIR)/$(DESIGN).json
RTL_DOT  = $(WORK_DIR)/$(DESIGN).dot
RTL_JSON = $(WORK_DIR)/$(DESIGN)_rtl.json
RTL_SVG  = $(WORK_DIR)/$(DESIGN).svg
PNR_ASC  = $(WORK_DIR)/$(DESIGN).asc
BIT_BIN  = $(WORK_DIR)/$(DESIGN).bin

WAVEFORM = $(SIM_DIR)/$(TESTBENCH).fst

SIMULATION_TIME = 400us

.PHONY: compile testbench sim syn pnr bit prog clean

usage:
	@echo "USAGE:"
	@echo "\tmake compile"
	@echo "\tmake testbench"
	@echo "\tmake sim"
	@echo "\tmake syn"
	@echo "\tmake rtl"
	@echo "\tmake pnr"
	@echo "\tmake bit"
	@echo "\tmake prog"
	@echo "\tmake clean"

compile: $(OBJS) $(SIM_OBJS)

$(WORK_DIR)/%.o: $(HDL_DIR)/%.vhd
	ghdl -a --workdir=$(WORK_DIR) $<

$(WORK_DIR)/%_tb.o: $(SIM_DIR)/%_tb.vhd $(OBJS)
	ghdl -a --workdir=$(WORK_DIR) $<

testbench: $(TESTBENCH)
$(TESTBENCH): $(OBJS) $(SIM_OBJS)
	ghdl -e --workdir=$(WORK_DIR) $@

sim: $(WAVEFORM)
$(WAVEFORM): $(TESTBENCH)
	ghdl -r --workdir=$(WORK_DIR) $< --stop-time=$(SIMULATION_TIME) --wave=$@

syn: $(SYN_JSON)
$(SYN_JSON): $(OBJS) $(CONSTRAINTS)
	yosys -m ghdl.so -p 'ghdl --workdir=$(WORK_DIR) $(DESIGN); synth_ice40 -top $(DESIGN) -json $(SYN_JSON)'

rtl: $(RTL_DOT) $(RTL_SVG)
$(RTL_DOT): $(OBJS)
	yosys -m ghdl.so -p 'ghdl --workdir=$(WORK_DIR) $(DESIGN); hierarchy -check -top $(DESIGN); prep -flatten -top $(DESIGN); proc; opt; fsm; opt; show -format dot -prefix $(WORK_DIR)/$(DESIGN)'

$(RTL_SVG): $(OBJS)
	yosys -m ghdl.so -p 'ghdl --workdir=$(WORK_DIR) $(DESIGN); prep -flatten -top $(DESIGN); write_json $(RTL_JSON)'
	netlistsvg $(RTL_JSON) -o $(RTL_SVG)

pnr: $(PNR_ASC)
$(PNR_ASC): $(SYN_JSON) $(CONSTRAINTS)
	nextpnr-ice40 --$(BOARD_MODEL) --package $(BOARD_PACKAGE) --pcf $(CONSTRAINTS) --json $(SYN_JSON) --asc $(PNR_ASC)

bit: $(BIT_BIN)
$(BIT_BIN): $(PNR_ASC) $(CONSTRAINTS)
	yosys -m ghdl.so -p 'ghdl --workdir=$(WORK_DIR) $(DESIGN); synth_ice40 -top $(DESIGN) -json $(SYN_JSON)'
	nextpnr-ice40 --$(BOARD_MODEL) --package $(BOARD_PACKAGE) --pcf $(CONSTRAINTS) --json $(SYN_JSON) --asc $(PNR_ASC)
	icepack $(PNR_ASC) $@

prog: $(BIT_BIN)
	bond $(BOND_SERIAL_DEV) $<

clean:
	@rm -rf $(WORK_DIR)/*
	@rm -f *_tb
	@rm -f e~*_tb.o
	@rm -f sim/*.fst
