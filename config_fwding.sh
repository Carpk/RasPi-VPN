# uncomment net.ipv4.ip_forward=1 in /etc/sysctl.conf

sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' test
