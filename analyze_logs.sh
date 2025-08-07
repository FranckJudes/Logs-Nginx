#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: $0 <nginx_access_log_file>"
    exit 1
fi

LOG_FILE=$1

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' not found."
    exit 1
fi

echo "Analyzing Nginx access log: $LOG_FILE"
echo ""

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%s - %d requests\n", $2, $1}'
echo ""

echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%s - %d requests\n", $2, $1}'
echo ""

echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%s - %d requests\n", $2, $1}'
echo ""


echo "Top 5 user agents:"
awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{count=$1; $1=""; printf "%s - %d requests\n", substr($0,2), count}'
