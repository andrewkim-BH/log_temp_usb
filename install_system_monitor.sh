#!/bin/bash

BASE_URL="https://raw.githubusercontent.com/andrewkim-BH/log_temp_usb/main"

echo "[1/5] 스크립트 설치 경로 준비..."
sudo mkdir -p /opt/system_monitor

echo "[2/5] 파일 다운로드 중..."
curl -sSL $BASE_URL/log_temp_usb.sh -o /opt/system_monitor/log_temp_usb.sh
chmod +x /opt/system_monitor/log_temp_usb.sh

curl -sSL $BASE_URL/log_temp_usb.service -o /etc/systemd/system/log_temp_usb.service
curl -sSL $BASE_URL/system_monitor.logrotate -o /etc/logrotate.d/system_monitor

echo "[3/5] systemd 서비스 등록..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable log_temp_usb.service
sudo systemctl restart log_temp_usb.service

echo "✅ 설치 완료! 서비스 상태:"
sudo systemctl status log_temp_usb.service
