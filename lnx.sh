#!/bin/bash

# Function to get Linux version information
get_linux_version() {
    echo "Linux Version Information:"
    lsb_release -a
}

# Function to get network details
get_network_details() {
    echo -e "\nNetwork Details:"
    echo "Private IP Address:"
    hostname -I
    echo "Public IP Address:"
    curl -s https://ifconfig.co/ip
    echo "Default Gateway:"
    ip route | grep default
}

# Function to get disk statistics
get_disk_statistics() {
    echo -e "\nDisk Statistics:"
    df -h
}

# Function to get top 5 largest directories
get_top_largest_directories() {
    echo -e "\nTop 5 Largest Directories:"
    du -ah / 2>/dev/null | sort -rh | head -n 5
}

# Function to monitor CPU usage
monitor_cpu_usage() {
    echo -e "\nCPU Usage Monitoring:"
    while true; do
        top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"% CPU Usage"}'
        sleep 10
    done
}

# Main function
main() {
    get_linux_version
    get_network_details
    get_disk_statistics
    get_top_largest_directories
    monitor_cpu_usage
}

# Call the main function
main
