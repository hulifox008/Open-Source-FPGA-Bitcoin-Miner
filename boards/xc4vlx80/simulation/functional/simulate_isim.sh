#!/bin/sh

# compile all of the files
vlogcomp -work work --incremental -d SIM -f board.f

# compile and link source files
fuse work.uart_comm_tb  --incremental   -o demo_tb
#fuse work.uart_comm_tb  --incremental  -L unisims_ver -L secureip -o demo_tb

# set BATCH_MODE=0 to run simulation in GUI mode
BATCH_MODE=0

if [ $BATCH_MODE == 1 ]; then

  # run the simulation in batch mode
  ./demo_tb -wdb wave_isim -tclbatch isim_cmd.tcl  

else

  # run the simulation in batch mode
  ./demo_tb -gui -view wave.wcfg -wdb wave_isim -tclbatch isim_cmd.tcl 

fi
