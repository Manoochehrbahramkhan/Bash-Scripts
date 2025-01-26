#!/bin/bash

API_URL="https://your_domain_name/bigbluebutton/api/"
SECRET="your_secret_key"

response=$(curl -s "${API_URL}getMeetings?checksum=$(echo -n "getMeetings${SECRET}" | sha1sum | cut -d' ' -f1)")

if echo "$response" | jq empty > /dev/null 2>&1; then

    total_users=$(echo "$response" | jq '[.meetings[].participantCount] | add')

    if [[ -z "$total_users" || "$total_users" == "null" ]]; then
        total_users=0
    fi

    echo "Active Users: $total_users"
else
    echo "ERROR Server Response Not Valid."
    echo "Server Response:"
    echo "$response"
fi
