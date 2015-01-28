#!/bin/bash
# Das Skript testet, ob es Prozesse im System gibt, die ein
# Signal annehmen, aber nicht in /proc aufgelistet werden.
for PID in `seq 1 65535`; do
 if kill -0 ${PID} 2>/dev/null
 then
   if ls /proc/*/task/*/cmdline | grep "/${PID}/cmdline" >/dev/null
   then
     true
   else
     CMD=`cat /proc/${PID}/cmdline`
     echo "PID ${PID} versteckt?! cmdline: '${CMD}'"
   fi
 fi
done
