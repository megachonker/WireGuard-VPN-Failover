#!/bin/bash
network="10.0.0.0/23"

check_packet_loss() {
    packet_loss=$(ping -c 10 -I "$1" -i 0.2 -w 2 "$2" | grep "packet loss" | awk '{print $6}')
    if [[ "$packet_loss" == "0%" ]]; then
        echo "No packet loss on $1"
        return 0
    else
        echo "Packet loss detected on $1: $packet_loss"
        return 1
    fi
}

add_route(){
    echo "adding route to $1"
    ip route add $2 dev $1 metric $3
} 
delet_route(){
    echo "removing route for$1"
    ip route del $2 dev $1
}

interface=$1
ipaddress=$2
prio=$3

#we need to delet default route
delet_route $interface $network

while [ true ]
do
    if check_packet_loss $interface $ipaddress; then
        add_route $interface $network $prio
    else
        delet_route $interface $network
    fi
done

