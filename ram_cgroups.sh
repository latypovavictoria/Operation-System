#!/bin/bash

GROUP_NAME="test_limit_group"
MEMORY_LIMIT="100M"

echo "Создаём cgroup..."
sudo cgcreate -g memory:/$GROUP_NAME

echo "Устанавливаем лимит памяти $MEMORY_LIMIT..."
sudo cgset -r memory.limit_in_bytes=$MEMORY_LIMIT $GROUP_NAME

echo "Запускаем ресурсоёмкий процесс..."
stress --vm 1 --vm-bytes 150M --vm-keep &
PID=$!

echo "Добавляем процесс $PID в группу $GROUP_NAME..."
echo $PID | sudo tee /sys/fs/cgroup/memory/$GROUP_NAME/tasks

echo "Ждём завершения процесса..."
sleep 10

echo "Проверяем системные сообщения о завершении процесса..."
dmesg | grep -i "killed process"

echo "Проверяем статистику памяти:"
echo "Использование памяти:"
cat /sys/fs/cgroup/memory/$GROUP_NAME/memory.usage_in_bytes
echo "Лимит памяти:"
cat /sys/fs/cgroup/memory/$GROUP_NAME/memory.limit_in_bytes

echo "Скрипт завершён."