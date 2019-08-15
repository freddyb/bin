tshark -i wlp0s20f3 -T fields -e dns.qry.name -e ssl.handshake.extensions_server_name -Y 'ssl.handshake.extensions_server_name or dns.qry.name'
