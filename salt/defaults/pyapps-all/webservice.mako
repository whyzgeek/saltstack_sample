###
# chkconfig: 235 98 55
# description: Service wrapper for pyapps
###

target="${pillar['pyapps']}"

function pyapps {
        for full_path in $(/bin/ls -d $target/*/); do
            app=$(echo $full_path | awk -F/ '{print $(NF-1)}')
            if [ -e "$full_path/eggs" -a ! -f "$full_path/disable" ]; then
                    # We see if any
                if [ -e "$full_path/bin/run_app" -o $(find "$full_path/etc" -perm -111 -type f | wc -l) -gt 0 ]; then
                    if [[ $1 == 'start' ]]; then
                        echo "Starting $app."
                    elif [[ $1 == 'stop' ]]; then
                        echo "Stopping $app."
                    fi
                    cd $full_path
                    ## Find the services and do whatever needed
                    [ -e "$full_path/bin/run_app" ] && "$full_path/bin/run_app" $1
                    for web in $(find "$full_path""etc" -perm -111 -type f); do
                        #/bin/su - root -c '/opt/share/webapp/etc/paster.ini start'
                        "$web" $1;
                    done
                fi
            fi
        done
}

case "$1" in
  start)
        pyapps start
        ;;
  stop)
        pyapps stop
        ;;

  *)
        echo "Usage: /sbin/service webservices {start|stop}"
        exit 1
esac

exit 0
