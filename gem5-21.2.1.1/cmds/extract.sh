
grep "packets_injected::total" m5out/stats.txt | sed 's/system.ruby.network.packets_injected::total\*/packets_injected = /' >> network_stats.txt
grep "packets_received::total" m5out/stats.txt | sed 's/system.ruby.network.packets_received::total\*/packets_received = /' >> network_stats.txt
grep "average_packet_queuing_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_queuing_latency\*/average_packet_queuing_latency = /' >> network_stats.txt
grep "average_packet_network_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_network_latency\*/average_packet_network_latency = /' >> network_stats.txt
grep "average_packet_latency" m5out/stats.txt | sed 's/system.ruby.network.average_packet_latency\*/average_packet_latency = /' >> network_stats.txt
grep "flits_injected::total" m5out/stats.txt | sed 's/system.ruby.network.flits_injected::total\*/flits_injected = /' >> network_stats.txt
grep "flits_received::total" m5out/stats.txt | sed 's/system.ruby.network.flits_received::total\*/flits_received = /' >> network_stats.txt
grep "average_flit_queuing_latency" m5out/stats.txt | sed 's/system.ruby.network.average_flit_queuing_latency\*/average_flit_queuing_latency = /' >> network_stats.txt
grep "average_flit_latency" m5out/stats.txt | sed 's/system.ruby.network.average_flit_latency\*/average_flit_latency = /' >> network_stats.txt
grep "average_hops" m5out/stats.txt | sed 's/system.ruby.network.average_hops\*/average_hops = /' >> network_stats.txt
