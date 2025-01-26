#!/bin/bash
sudo apt install xmlstarlet -y

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
#----------------------------------------------------------------------------------------------------------------------------
meetings_response=$(curl -s "${API_URL}getMeetings?checksum=$(echo -n "getMeetings${SECRET}" | sha1sum | cut -d' ' -f1)")

recordings_response=$(curl -s "${API_URL}getRecordings?checksum=$(echo -n "getRecordings${SECRET}" | sha1sum | cut -d' ' -f1)")

if echo "$meetings_response" | xmlstarlet fo > /dev/null 2>&1 && echo "$recordings_response" | xmlstarlet fo > /dev/null 2>&1; then
    meetings_count=$(echo "$meetings_response" | xmlstarlet sel -t -v "count(//meetings/meeting)" 2>/dev/null)
    total_users=$(echo "$meetings_response" | xmlstarlet sel -t -v "sum(//meetings/meeting/participantCount)" 2>/dev/null)

    recorded_count=$(echo "$recordings_response" | xmlstarlet sel -t -v "count(//recordings/recording[@state='published'])" 2>/dev/null)
    processing_count=$(echo "$recordings_response" | xmlstarlet sel -t -v "count(//recordings/recording[@state='processing'])" 2>/dev/null)
    total_recordings=$(echo "$recordings_response" | xmlstarlet sel -t -v "count(//recordings/recording)" 2>/dev/null)

    echo "Active Sessions: $meetings_count"
    echo "Active Users: $total_users"
    echo "Active Record: $recorded_count"
    echo "Record in proccesss: $processing_count"
    echo "total Record: $total_recordings"
else
    echo "Error: Server Not Valid."
    echo "Server Response:"
    echo "$meetings_response"
    echo "Response Recorde Server:"
    echo "$recordings_response"
fi

