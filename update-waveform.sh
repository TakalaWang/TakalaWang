#!/bin/bash
# Update your GitHub profile waveform video
# Usage: ./update-waveform.sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WAVES_BIN="$HOME/code/readme-waves/target/release/readme-waves"
PLAYLIST="https://www.youtube.com/playlist?list=PLqY5-xxyprjvRFtzx5OPeWYIyncPC2JGi"
OUTPUT="$SCRIPT_DIR/assets/waveform.mp4"

# Build if needed
if [ ! -f "$WAVES_BIN" ]; then
  echo "Building readme-waves..."
  cd "$HOME/code/readme-waves"
  cargo build --release
fi

# Generate video
echo "Generating waveform video from playlist..."
"$WAVES_BIN" "$PLAYLIST" --video -o "$OUTPUT" --rows 7 --cols 52 --fps 24

# Show result
echo ""
echo "=== Done! ==="
echo "Video: $OUTPUT"
cat "$SCRIPT_DIR/assets/waveform.json"
echo ""
echo "Next steps:"
echo "  1. Go to https://github.com/TakalaWang/TakalaWang"
echo "  2. Edit README.md"
echo "  3. Delete the old video line"
echo "  4. Drag $OUTPUT into the editor"
echo "  5. Save"
echo ""
echo "Opening GitHub edit page..."
open "https://github.com/TakalaWang/TakalaWang/edit/main/README.md"
