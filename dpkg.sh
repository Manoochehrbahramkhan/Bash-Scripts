#!/bin/bash

LOCK_FILES=(
  "/var/lib/dpkg/lock"
  "/var/lib/dpkg/lock-frontend"
  "/var/lib/apt/lists/lock"
  "/var/cache/apt/archives/lock"
)

echo "🔍searching for APT/DKPG ..."

for FILE in "${LOCK_FILES[@]}"; do
  if [ -e "$FILE" ]; then
    echo "⚠️  found: $FILE"
    PID=$(lsof "$FILE" 2>/dev/null | awk 'NR==2 {print $2}')
    if [ -n "$PID" ]; then
      echo "⛔used (PID: $PID)."
      exit 1
    fi
  fi
done

echo ""
echo "✅ no proccess lock file! ..."

for FILE in "${LOCK_FILES[@]}"; do
  [ -e "$FILE" ] && sudo rm -f "$FILE" && echo "🗑️  delete: $FILE"
done

echo ""
echo "🔧 run'sudo dpkg --configure -a' reconfigure proccess..."
sudo dpkg --configure -a

echo ""
echo "✅ every things done your system now is healthy."
