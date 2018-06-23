# /etc/cron.d/tks-config

SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin

# Shutdown clients
30 17,18,19,20,21,22,23,0,1,2,3,4,5,6 * * * root shutdown -h 2

