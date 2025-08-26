#!/bin/bash

frmdate=$(date '+%F %T')
logdir=/var/log/user_monitor.log
exit_code=0

if [ -z "$1" ]; then
        echo "Debes ingresar un valor num entero de umbral para controlar."
        exit 1
fi

if [[ "$1" =~ ^[0-9]+$ ]]; then
        if [ "$1" -ge 0 ] && [ "$1" -le 100 ]; then
                if usrcnt=$(users); then

                        usrs_cnt=$(echo "$usrcnt" | tr ' ' '\n' | sort -u | wc -l )

                        #nam=$(echo $usrcnt | cut -d: -f1)
                        #tty=$(echo $usrcnt | cut -d: -f2)
                        #tmlgn=$(echo $usrcnt | cut -d: -f3)

                        if [ "$usrs_cnt" -gt "$1" ]; then
                                echo "$frmdate | Usuarios conectados: $usrs_cnt | ESTADO: ALERTADO" >> "$logdir"
                                tail -n 1 "$logdir"
                                exit_code=2
                        fi
                        if [ "$usrs_cnt" -le "$1"  ]; then
                                echo "$frmdate | Usuarios conectados: $usrs_cnt | ESTADO: OK" >> "$logdir"
                                tail -n 1 "$logdir"
                        fi
                fi
        else
                echo "El umbral debe ser entre 0 y 100"
                exit 1
        fi
else
        echo "Debes ingresar un valor num entero"
        exit 1
fi

exit $exit_code
