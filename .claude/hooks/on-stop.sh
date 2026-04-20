#!/usr/bin/env bash
set -euo pipefail

SOUNDS_DIR="${CLAUDE_PROJECT_DIR}/sounds"
ACTIVE_FILE="${SOUNDS_DIR}/active.txt"

INPUT=$(cat)

HOOK_ACTIVE=$(echo "$INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('stop_hook_active', False))" 2>/dev/null || echo "False")
if [[ "$HOOK_ACTIVE" == "True" ]]; then
  exit 0
fi

SOUND_NAME=$(cat "$ACTIVE_FILE" 2>/dev/null || echo "1.wav")
SOUND_FILE="${SOUNDS_DIR}/${SOUND_NAME}"

if [[ ! -f "$SOUND_FILE" ]]; then
  exit 0
fi

WIN_PATH=$(wslpath -w "$SOUND_FILE")
powershell.exe -WindowStyle Hidden -Command "(New-Object Media.SoundPlayer '$WIN_PATH').PlaySync()" &

exit 0
