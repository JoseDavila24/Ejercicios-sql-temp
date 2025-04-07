#!/bin/bash

echo "[✔] Limpiando logs..."
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;

echo "[✔] Limpiando caché APT..."
sudo apt-get clean
sudo apt-get autoclean

echo "[✔] Limpiando caché y buffers de RAM..."
sudo sync; echo 3 | sudo tee /proc/sys/vm/drop_caches

echo "[✔] Limpiando archivos temporales..."
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

echo "[✔] Limpieza completada."

