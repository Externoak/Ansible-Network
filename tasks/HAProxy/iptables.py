#!/usr/bin7python
import os
import sys
Green= "eth1"
Red= "eth2"
print ('Ejecutamos las IPTables')
#Borramos reglas anteriores
os.system('iptables -F')
os.system('iptables -X')
os.system('iptables -Z')
os.system('iptables -t nat -F')
#Politicas por Defecto
os.system('iptables -P INPUT ACCEPT')
os.system('iptables -P OUTPUT ACCEPT')
os.system('iptables -P FORWARD ACCEPT')
#Permintir paso de Ipv4 entre interfaces
os.system('echo "1" > /proc/sys/net/ipv4/ip_forward')
#LAN  a WAN
os.system('iptables -A FORWARD -i ' + Green + ' -o ' + Red + ' -j ACCEPT')
os.system(' iptables -t nat -A POSTROUTING -o ' + Red + ' -j MASQUERADE ')
os.system('iptables -A FORWARD -i ' + Red + ' -o ' + Green + ' -m state --state ESTABLISHED,RELATED -j ACCEPT')
# WAN A LAN
os.system('iptables -A FORWARD -i ' + Red + ' -o '+ Green +' -j ACCEPT')
os.system('iptables -t nat -A POSTROUTING -o '+ Green +' -j MASQUERADE')
os.system('iptables -A FORWARD -i ' + Green + '  -o '+ Red +'  -m state --state ESTABLISHED,RELATED -j ACCEPT')
#FTP
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 20:21 -j DNAT --to 192.168.80.3:20-21')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 10000:10250 -j DNAT --to 192.168.80.3:10000-10250')
#Openfire
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 9090 -j DNAT --to 192.168.80.3:9090')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 9091 -j DNAT --to 192.168.80.3:9091')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 5222 -j DNAT --to 192.168.80.3:5222')
#LDAP
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 389 -j DNAT --to 192.168.80.6:389')
#ASTERISK
os.system('iptables -t nat -A PREROUTING -i ' + Red + ' -p udp --dport 5060 -m state --state NEW -m statistic --mode random --probability .50 -j DNAT --to 192.168.80.20')
os.system('iptables -t nat -A PREROUTING -i ' + Red + ' -p udp --dport 5060 -m state --state NEW -m statistic --mode random --probability .50 -j DNAT --to 192.168.80.21')
#Netdata
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 19990 -j DNAT --to 192.168.80.10:19999')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 19991 -j DNAT --to 192.168.80.80:19999')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 19992 -j DNAT --to 192.168.80.81:19999')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 19993 -j DNAT --to 192.168.80.20:19999')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 19994 -j DNAT --to 192.168.80.21:19999')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 19995 -j DNAT --to 192.168.80.3:19999')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 19996 -j DNAT --to 192.168.80.4:19999')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 19997 -j DNAT --to 192.168.80.5:19999')
os.system('iptables -t nat -A PREROUTING -i ' + Red +' -p tcp --dport 19998 -j DNAT --to 192.168.80.6:19999')
print('Puedes listar las reglas con: iptables -L -n -v')
print ('')
