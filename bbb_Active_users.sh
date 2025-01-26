#!/bin/bash

API_URL="https://your-bbb-server.com/bigbluebutton/api/"
SECRET="your_shared_secret"

#Active Sessions
response=$(curl -s "${API_URL}getMeetings?checksum=$(echo -n "getMeetings${SECRET}" | sha1sum | cut -d' ' -f1)")

if echo "$response" | xmlstarlet fo > /dev/null 2>&1; then
    meetings_count=$(echo "$response" | xmlstarlet sel -t -v "count(//meetings/meeting)" 2>/dev/null)

    if [[ "$meetings_count" -eq 0 ]]; then
        echo "Not Active Sessions!."
    else
        
        total_users=$(echo "$response" | xmlstarlet sel -t -v "sum(//meetings/meeting/participantCount)" 2>/dev/null)
        echo "Active Sessions: $meetings_count"
        echo "Acticve Users: $total_users"
    fi
else
    echo "Error Server Not Response."
    echo "Response Server:"
    echo "$response"
fi
