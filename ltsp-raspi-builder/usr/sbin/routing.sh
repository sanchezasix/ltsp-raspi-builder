#!/bin/bash


if [ "${INTERNAL_IP}" != "" ]; then
      
    IP=`ipcalc ${INTERNAL_IP} | grep Network | tr -s " " | cut -f 2 -d" "`

    sudo iptables -t nat -A POSTROUTING -s ${IP} -o ${EXTERNAL_INTERFACE} -j MASQUERADE
    echo 1 > /proc/sys/net/ipv4/ip_forward
fi

