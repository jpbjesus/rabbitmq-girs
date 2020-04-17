#!/bin/sh

trap "graceful_shutdown; exit 0;" SIGTERM SIGINT
graceful_shutdown() {
    # echo "[INFO] SIGTERM caught, terminating <haproxy & keepalived> process..."
    echo "[INFO] SIGTERM caught, terminating <haproxy> process..."
    stop_process
    # echo "[INFO] haproxy-keepalived graceful shutdown successfully."
    echo "[INFO] haproxy graceful shutdown successfully."
}

stop_process() {
    stop_haproxy
    # stop_keepalived
}

KEEPALIVED_LAUNCH="keepalived --dont-fork --dump-conf --log-console --log-detail --log-facility 7 --vrrp -f /etc/keepalived/keepalived.conf"
start_keepalived() {
    echo "[INFO] Keepalived is starting."
    eval ${KEEPALIVED_LAUNCH} &
}

stop_keepalived() {
    count=1

    k_pid=$(pidof keepalived)
    kill -TERM $k_pid > /dev/null 2>&1
    while true; do
        sleep 3
        
        k_pid=$(pidof keepalived)
        if [ ! -n "$k_id" ]; then
            break
        fi
       
        if [ ${count} -gt 5 ]; then
            echo "[ERROR] Keepalived stop failed."
            return
        fi
        kill -TERM $k_pid > /dev/null 2>&1
     done
     echo "[INFO] Keepalived terminated." 
}

# HAPROXY_LAUNCH="/usr/local/sbin/haproxy -p /run/haproxy.pid -db -f /usr/local/etc/haproxy/haproxy.cfg -Ds"
HAPROXY_LAUNCH="haproxy -f /usr/local/etc/haproxy/haproxy.cfg"
start_haproxy() {
    echo "[INFO] HAProxy is starting."
    eval ${HAPROXY_LAUNCH} &
    echo "[INFO] HAProxy started."
}

stop_haproxy() {
    kill -s SIGUSR1 $(pidof haproxy) > /dev/null 2>&1
    echo "[INFO] HAProxy terminated."
}

start_rsyslog() {
    rsyslogd
}

# stop_rsyslog() {
#     kill -s SIGUSR1 $(pidof rsyslogd) > /dev/null 2>&1
#     echo "[INFO] Rsyslogd terminated."
# }

start_rsyslog
start_haproxy
# start_keepalived

sleep 10

while true; do
    h_pid=$(pidof haproxy)
    k_pid=$(pidof keepalived)
    r_pid=$(pidof rsyslogd)

    if [ ! -n "$r_pid" ]; then
        start_rsyslog
    fi

    if [ ! -n "$h_pid" ]; then
        echo "[ERROR] HAProxy crashed, shutdown all process, exit 1"
        stop_process
        break
    fi
    sleep 5

    # if [ ! -n "$k_pid" ]; then
    #     echo "[ERROR] Keepalived crashed, shutdown all process, exit 1"
    #     stop_process
    #     break
    # fi
    # sleep 5
done

exit 1