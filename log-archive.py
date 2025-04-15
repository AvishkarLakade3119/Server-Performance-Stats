#!/usr/bin/env python3

import os
import sys
import tarfile
import time

def archive_logs(log_dir, output_dir="/tmp"):
    if not os.path.isdir(log_dir):
        print(f"Error: '{log_dir}' is not a valid directory.")
        sys.exit(1)

    timestamp = time.strftime("%Y%m%d-%H%M%S")
    archive_name = f"log-archive-{timestamp}.tar.gz"
    archive_path = os.path.join(output_dir, archive_name)

    try:
        with tarfile.open(archive_path, "w:gz") as tar:
            tar.add(log_dir, arcname=os.path.basename(log_dir))
        print(f"Logs archived to: {archive_path}")
    except Exception as e:
        print(f"Failed to archive logs: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 log_archive.py <log_directory> [output_directory]")
        sys.exit(1)

    log_directory = sys.argv[1]
    output_directory = sys.argv[2] if len(sys.argv) > 2 else "/tmp"
    archive_logs(log_directory, output_directory)

