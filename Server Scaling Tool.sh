#!/bin/bash
echo "Welcome to the DBLeS Server Scaling Tool."
echo "Created by Mohammed Sajid Abdullah"
echo "Please make sure you have doctl installed and initiated with a DigitalOcean token before running this tool"
echo "----------------------------------------"
echo "1. See Current Status"
echo "2. Set \$6 - Lowest"
echo "3. Set \$18 - Average"
echo "4. Set \$42 - High"
echo "5. Exit"

read -p "Enter your choice: " choice

case "$choice" in
    1)
        echo "Reference Values:"
        echo "Memory     VCPUs     Package"
        echo "4096       2         \$42"
        echo "2048       2         \$18"
        echo "1024       1         \$6"
        echo "----------------------------------------"
        echo "Current Server Status:"
        doctl compute droplet get 387628641 --format "ID,Name,Memory,VCPUs"
        ;;
    2)
        echo "Set to \$6 Per Month (Lowest):"
        doctl compute droplet-action resize 387628641 --size s-1vcpu-1gb --resize-disk=false
        doctl compute droplet-action power-on 387628641
        ;;
    3)
        echo "Set to \$18 Per Month (Medium):"
        doctl compute droplet-action resize 387628641 --size s-2vcpu-2gb --resize-disk=false
        doctl compute droplet-action power-on 387628641
        ;;
    4)
        echo "Set to \$42 Per Month (High):"
        doctl compute droplet-action resize 387628641 --size c-2 --resize-disk=false
        doctl compute droplet-action power-on 387628641
        ;;
    5)
        exit 0
        ;;
    *)
        echo "Invalid choice. Please select a valid option."
        ;;
esac
