#!/bin/sh

# Disabling SELinux if enabled
if [ -f "/usr/sbin/getenforce" ] && [ `id -u` = 0 ] ; then
    selinux_status=`/usr/sbin/getenforce`
    /usr/sbin/setenforce 0 2> /dev/null
fi

INSTALLDIR=/opt/metasploit

if [ -r "$INSTALLDIR/scripts/setenv.sh" ]; then
. "$INSTALLDIR/scripts/setenv.sh"
fi

ERROR=0

#metasploit_code_start
metasploit_SCRIPT=/opt/metasploit/apps/pro/ui/scripts/ctl.sh
#metasploit_code_end
#RUBY_APPLICATION_SCRIPT

POSTGRESQL_SCRIPT=$INSTALLDIR/postgresql/scripts/ctl.sh
PROSVC_SCRIPT=$INSTALLDIR/apps/pro/engine/scripts/ctl.sh

help() {
	echo "usage: $0 help"
	echo "       $0 (start|stop|restart|status)"

    if test -x $POSTGRESQL_SCRIPT; then	
	    echo "       $0 (start|stop|restart|status) postgresql"
	fi

	if test -x $PROSVC_SCRIPT; then	
	    echo "       $0 (start|stop|restart|status) prosvc"
	fi


#metasploit_code_start
        if test -x $metasploit_SCRIPT; then
            echo "       $0 (start|stop|restart|status) metasploit"
	fi
        #metasploit_code_end
        #RUBY_APPLICATION_HELP

	cat <<EOF

help       - this screen
start      - start the service(s)
stop       - stop  the service(s)
restart    - restart or start the service(s)
status     - show the status of the service(s)

EOF
}


if [ "x$1" = "xhelp" ] || [ "x$1" = "x" ]; then
    help
elif [ "x$1" = "xstart" ]; then

    if [ "x$2" = "xpostgresql" ]; then
        if test -x $POSTGRESQL_SCRIPT; then	
            $POSTGRESQL_SCRIPT start  
            POSTGRESQL_ERROR=$?
        fi
    elif [ "x$2" = "xprosvc" ]; then
        if test -x $PROSVC_SCRIPT; then	
            $PROSVC_SCRIPT start  
            PROSVC_ERROR=$?
        fi        
    #metasploit_code_start
        elif [ "x$2" = "xmetasploit" ]; then
        if test -x $metasploit_SCRIPT; then
            $metasploit_SCRIPT start
            metasploit_ERROR=$?
        fi
        #metasploit_code_end
        #RUBY_APPLICATION_START
    else
        if test -x $POSTGRESQL_SCRIPT; then	
            $POSTGRESQL_SCRIPT start  
            POSTGRESQL_ERROR=$?
            sleep 5
        fi

        if test -x $PROSVC_SCRIPT; then	
            $PROSVC_SCRIPT start  
            PROSVC_ERROR=$?
        fi

        #metasploit_code_start
        if test -x $metasploit_SCRIPT; then
            $metasploit_SCRIPT start
            metasploit_ERROR=$?
        fi
        #metasploit_code_end
        #RUBY_APPLICATION_GENERIC_START

    fi


elif [ "x$1" = "xstop" ]; then

    if [ "x$2" = "xpostgresql" ]; then
        if test -x $POSTGRESQL_SCRIPT; then	
            $POSTGRESQL_SCRIPT stop
            POSTGRESQL_ERROR=$?
            sleep 5
        fi
    elif [ "x$2" = "xprosvc" ]; then
        if test -x $PROSVC_SCRIPT; then
            $PROSVC_SCRIPT stop
            PROSVC_ERROR=$?
        fi        
    #metasploit_code_start
        elif [ "x$2" = "xmetasploit" ]; then
        if test -x $metasploit_SCRIPT; then
            $metasploit_SCRIPT stop
            metasploit_ERROR=$?
        fi
        #metasploit_code_end
        #RUBY_APPLICATION_STOP
    else
        
        #metasploit_code_start
        if test -x $metasploit_SCRIPT; then
            $metasploit_SCRIPT stop
            metasploit_ERROR=$?
        fi
        #metasploit_code_end
        #RUBY_APPLICATION_GENERIC_STOP

        if test -x $PROSVC_SCRIPT; then
            $PROSVC_SCRIPT stop
            PROSVC_ERROR=$?
        fi
  
        if test -x $POSTGRESQL_SCRIPT; then
            $POSTGRESQL_SCRIPT stop
            POSTGRESQL_ERROR=$?
        fi
          
    fi

elif [ "x$1" = "xrestart" ]; then

    if [ "x$2" = "xpostgresql" ]; then
        if test -x $POSTGRESQL_SCRIPT; then	
            $POSTGRESQL_SCRIPT stop  
            sleep 5
            $POSTGRESQL_SCRIPT start
            POSTGRESQL_ERROR=$?
        fi
    elif [ "x$2" = "xprosvc" ]; then
        if test -x $PROSVC_SCRIPT; then	
            $PROSVC_SCRIPT stop  
            sleep 2
            $PROSVC_SCRIPT start
            PROSVC_ERROR=$?
        fi        
    #metasploit_code_start
        elif [ "x$2" = "xmetasploit" ]; then
        if test -x $metasploit_SCRIPT; then
            $metasploit_SCRIPT stop
            sleep 2
            $metasploit_SCRIPT start
            metasploit_ERROR=$?
        fi
        #metasploit_code_end
        #RUBY_APPLICATION_RESTART
  
    else
    
        if test -x $PROSVC_SCRIPT; then	
            $PROSVC_SCRIPT stop
            PROSVC_ERROR=$?
        fi

        #metasploit_code_start
        if test -x $metasploit_SCRIPT; then
            $metasploit_SCRIPT stop
            metasploit_ERROR=$?
        fi
        #metasploit_code_end
        #RUBY_APPLICATION_GENERIC_STOP
 
        if test -x $POSTGRESQL_SCRIPT; then
            $POSTGRESQL_SCRIPT stop
            sleep 2
            $POSTGRESQL_SCRIPT start;
            POSTGRESQL_ERROR=$?
            sleep 2
        fi          

        if test -x $PROSVC_SCRIPT; then	
            $PROSVC_SCRIPT start  
            PROSVC_ERROR=$?
        fi
     
        #metasploit_code_start
        if test -x $metasploit_SCRIPT; then
            $metasploit_SCRIPT start
            metasploit_ERROR=$?
        fi
        #metasploit_code_end
        #RUBY_APPLICATION_GENERIC_START
    fi

elif [ "x$1" = "xstatus" ]; then

    if [ "x$2" = "xpostgresql" ]; then
        if test -x $POSTGRESQL_SCRIPT; then	
            $POSTGRESQL_SCRIPT status  
            sleep 2
        fi
    elif [ "x$2" = "xprosvc" ]; then
        if test -x $PROSVC_SCRIPT; then
            $PROSVC_SCRIPT status
        fi
        
    #metasploit_code_start
        elif [ "x$2" = "xmetasploit" ]; then
        if test -x $metasploit_SCRIPT; then
            $metasploit_SCRIPT status
        fi
        #metasploit_code_end
        #RUBY_APPLICATION_STATUS
   
    else
       
        #metasploit_code_start
        if test -x $metasploit_SCRIPT; then
            $metasploit_SCRIPT status
        fi
        #metasploit_code_end
        #RUBY_APPLICATION_GENERIC_STATUS
        
        if test -x $POSTGRESQL_SCRIPT; then
            $POSTGRESQL_SCRIPT status
            sleep 3
        fi

        if test -x $PROSVC_SCRIPT; then
            $PROSVC_SCRIPT status
        fi

    fi
fi

# Checking for errors
for e in $POSTGRESQL_ERROR $PROSVC_ERROR; do
    if [ $e -gt 0 ]; then
        ERROR=$e
    fi
done
# Restoring SELinux
if [ -f "/usr/sbin/getenforce" ] && [ `id -u` = 0 ] ; then
    /usr/sbin/setenforce $selinux_status 2> /dev/null
fi

exit $ERROR
