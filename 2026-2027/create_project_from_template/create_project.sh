#!/usr/bin/bash

function usage() {
	echo "Usage: $0 <name_of_design>"
	echo "  where <name_of_design> is, the name of your new design!"
	echo "  for example:"
	echo "    $ ./create_project and_gate"
	echo ""
	echo "The name of the design cannot exist as a folder here."
       	echo "Good luck."
}

if (( $# != 1)); then
	>&2 echo "ERROR: Illegal number of arguments."
	echo ""
	usage
	exit -1
fi

# Good number of arguments
design=$1

echo "The name of your new design is ${design}."
echo ""

if [[ -e $design ]]; then
	>&2 echo "ERROR: directory $design already exists!"
	echo ""
	usage
	exit -1
fi

mkdir $design
mkdir -p $design/board/ice40-up5k
mkdir $design/hdl
mkdir $design/sim
mkdir $design/work

cp -p template/board/ice40-up5k/template.pcf $design/board/ice40-up5k/$design.pcf
m4 -D template=$design template/hdl/template.m4 > $design/hdl/${design}.vhd
m4 -D template=$design template/sim/template_tb.m4 > $design/sim/${design}_tb.vhd
m4 -D template=$design template/Makefile.m4 > $design/Makefile
m4 -D template=$design template/vhdl_ls.m4 > $design/vhdl_ls.toml
echo "Done creating project ${design}."
