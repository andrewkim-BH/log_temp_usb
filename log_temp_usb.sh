#!/bin/bash

LOGFILE="/opt/system_monitor/system_monitor.log"
INTERVAL=10  # 측정 주기 (초)

echo "System Monitor Log - Started at $(date)" >> "$LOGFILE"
echo "Interval: ${INTERVAL}s" >> "$LOGFILE"
echo "=========================================" >> "$LOGFILE"

while true; do
    echo "-----------------------------" >> "$LOGFILE"
    echo "Timestamp: $(date)" >> "$LOGFILE"

    echo "[Temperature Data]" >> "$LOGFILE"
    sensors >> "$LOGFILE"

    echo "[Recent USB Events (last 10s)]" >> "$LOGFILE"
    dmesg | tail -n 50 | grep -i usb >> "$LOGFILE"

    echo "" >> "$LOGFILE"
    sleep "$INTERVAL"
done
