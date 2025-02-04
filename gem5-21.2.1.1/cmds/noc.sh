    : > debug_log.txt
    ../build/NULL/gem5.opt --debug-flag=RubyNetwork  ../configs/example/garnet_synth_traffic.py  \
        --num-cpus=16 \
        --num-dirs=16 \
        --network=garnet \
        --topology=Mesh_XY \
        --mesh-rows=4  \
        --sim-cycles=20000 \
        --synthetic=uniform_random \
        --injectionrate=0.15\
        --vcs-per-vnet=4 \
        --routing-algorithm=2 \
        --router-latency=2 \
        --inj-vnet=0 \
	>> "debug_log.txt" 2>&1
        ##--num-packets-max=1\
        ##--single-sender-id=0 \
	#--single-dest-id=63\
       
	##--routing-algorithm=1 \
        ##--link-width-bits=32 \
