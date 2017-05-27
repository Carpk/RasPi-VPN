# need a shell script to find addresses of node, and gateway, 
# and append them to /etc/network/interfaces

LOCAL_ADDR="$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"
SUB_MASK="$(ifconfig | grep -E '(Mask:)?([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -Eo '(255.)[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}')"
GATEWAY="$(ip route show default | awk '/default/ {print $3}')"

echo "
# Bridge for OpenVPN
auto br0
iface br0 inet static
address ${LOCAL_ADDR}
netmask ${SUB_MASK}
gateway ${GATEWAY}
bridge_ports eth0
" >> test

echo '
# Ethernet connection for OpenVPN
iface eth0 inet manual
up ifconfig $IFACE 0.0.0.0 up
up ip link set $IFACE promisc on
down ip link set $IFACE promisc off
down ifconfig $IFACE down
' >> test
