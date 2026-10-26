#!bin/bash

disk_usage=$(df _hT | grep -v Filesystem)
usage_threshold=20
server_ip=$(curl http://172.31.30.118/latest/meta-data/local-ipv4)

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6}' | cut -d '%' -f1)
    partition=$(echo $line | awk '{print $7}')
    if [$usage -ge $usage_threshold]; then
        message+= "High disk usage on $partition: $usage <br>"
    fi    
done <<< $disk_usage

sh mail.sh "DevOps Team" "$server_ip" "High Disk Usage" "$message" "viweksai@gmail.com" "WARNING: High Disk Usage Alert"