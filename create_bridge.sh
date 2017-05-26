# need a shell script to find addresses of node, and gateway, 
# and append them to /etc/network/interfaces


# Bridge for OpenVPN
auto br0
iface br0 inet static
address 192.168.2.50
netmask 255.255.255.0
gateway 192.168.101.1
bridge_ports eth0

# Ethernet connection for OpenVPN
iface eth0 inet manual
up ifconfig $IFACE 0.0.0.0 up
up ip link set $IFACE promisc on
down ip link set $IFACE promisc off
down ifconfig $IFACE down

