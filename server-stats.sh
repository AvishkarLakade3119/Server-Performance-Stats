#!/bin/bash

echo "=============================="
echo "     SERVER PERFORMANCE STATS"
echo "=============================="

# OS Version
echo -e "\n OS Version:"
uname -a

# Uptime
echo -e "\n uptime:"
uptime -p

# Load Average
echo -e "\n Load Average:"
uptime | awk -F'load average: ' '{ print $2 }'

# Logged in users
echo -e "\n Logged In Users:"
who

# CPU Usage
echo -e "\n Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{print "Used: " 100 - $8 "% | Idle: " $8 "%"}'

# Memory Usage
echo -e "\nMemory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB / %sMB (%.2f%%)\n", $3, $2, $3*100/$2 }'

# Disk Usage
echo -e "\n Disk Usage (/):"
df -h / | awk 'NR==2{printf "Used: %s / %s (%s)\n", $3, $2, $5}'

# Top 5 CPU consuming processes
echo -e "\n Top 5 CPU Consuming Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# Top 5 Memory consuming processes
echo -e "\n Top 5 Memory Consuming Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

# (Optional) Failed login attempts (requires sudo)
echo -e "\n Failed Login Attempts:"
lastb -n 5 2>/dev/null || echo "No failed login attempt log found."

echo -e "\n Analysis Complete"

