#!/bin/sh

trap "graceful_shutdown; exit 0;" SIGTERM SIGINT
graceful_shutdown() {
    echo "[INFO] SIGTERM caught, terminating <haproxy> process..."
    stop_process
    echo "[INFO] haproxy graceful shutdown successfully."
}

stop_process() {
    stop_haproxy
}

HAPROXY_LAUNCH="/usr/local/sbin/haproxy -p /run/haproxy.pid -db -f /usr/local/etc/haproxy/haproxy.cfg -Ds"
# HAPROXY_LAUNCH="haproxy -f /usr/local/etc/haproxy/haproxy.cfg"
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

stop_rsyslog() {
    kill -s SIGUSR1 $(pidof rsyslogd) > /dev/null 2>&1
    echo "[INFO] Rsyslogd terminated."
}

start_rsyslog
start_haproxy

sleep 10

while true; do
    h_pid=$(pidof haproxy)
    r_pid=$(pidof rsyslogd)

    if [ ! -n "$r_pid" ]; then
        start_rsyslog
    fi

    tail -f /var/log/haproxy*.log &

    if [ ! -n "$h_pid" ]; then
        echo "[ERROR] HAProxy crashed, shutdown all process, exit 1"
        stop_process
        break
    fi
    sleep 5
    
done

exit 1
