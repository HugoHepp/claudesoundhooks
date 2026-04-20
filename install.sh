#!/usr/bin/env bash
set -euo pipefail

DIR="$(dirname "$(readlink -f "$0")")"

chmod +x "$DIR/.claude/hooks/on-stop.sh"
chmod +x "$DIR/soundswitch.sh"

echo "✓ SoundHook installé."
echo ""
echo "Ajoute tes fichiers audio dans : $DIR/sounds/"
echo "  → 1.wav  (son par défaut)"
echo "  → 2.wav  (son alternatif)"
echo ""
echo "Pour switcher : ./soundswitch.sh"
