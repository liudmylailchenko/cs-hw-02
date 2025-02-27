#!/bin/bash

websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    "https://example.com"
    "https://taaaaaaaaaaaaaaaaaaaaa.com/"
)

log_file="website_status.log"

> "$log_file"

echo "Checking website availability..."

for site in "${websites[@]}"; do
    status_code=$(curl -o /dev/null -s -w "%{http_code}" -L "$site")
    if [ "$status_code" -eq 200 ]; then
        echo "$site is UP" | tee -a "$log_file"
    else
        echo "$site is DOWN" | tee -a "$log_file"
    fi
done

echo "Results saved to $log_file"
