#!/usr/bin/env bash
set -euo pipefail

SOUNDS_DIR="$(dirname "$(readlink -f "$0")")/sounds"
ACTIVE_FILE="${SOUNDS_DIR}/active.txt"
AVAILABLE=(1.wav 2.wav)

if [[ $# -eq 1 ]]; then
  echo "$1" > "$ACTIVE_FILE"
  echo "Son actif : $1"
  exit 0
fi

CURRENT=$(cat "$ACTIVE_FILE" 2>/dev/null || echo "1.wav")
for i in "${!AVAILABLE[@]}"; do
  if [[ "${AVAILABLE[$i]}" == "$CURRENT" ]]; then
    NEXT="${AVAILABLE[$(( (i + 1) % ${#AVAILABLE[@]} ))]}"
    echo "$NEXT" > "$ACTIVE_FILE"
    echo "Basculé : $CURRENT → $NEXT"
    exit 0
  fi
done

echo "${AVAILABLE[0]}" > "$ACTIVE_FILE"
echo "Son actif : ${AVAILABLE[0]}"
