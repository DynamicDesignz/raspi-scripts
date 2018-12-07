#!/bin/sh
. /opt/metasploit/scripts/setenv.sh
/opt/metasploit/ctlscript.sh stop
ruby /opt/metasploit/apps/pro/ui/script/diagnostic_logs.rb $@
