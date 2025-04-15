#!/bin/bash

# Check if a directory was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR="$1"
ARCHIVE_DIR="/var/log_archives"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
LOG_FILE="/var/log/log-archive.log"

# Create archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Archive and compress the logs
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" .

# Log the action
echo "[$(date)] Archived logs from $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_NAME" >> "$LOG_FILE"

echo "Logs archived successfully: $ARCHIVE_DIR/$ARCHIVE_NAME"
