#!/bin/bash
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
OUTDIR="/Users/ahzhu_agent/trinity-v3-content/exp721-ch1/images"
cd "$OUTDIR"

generate() {
  local fname="$1"
  local prompt="$2"
  echo ">>> Generating $fname ..."
  uv run "$SCRIPT" --prompt "$prompt" -i "$REF" --filename "$fname" --resolution 1K 2>&1 | tail -2
  echo "<<< Done $fname"
}

# Frame 11 - writing counter-tracking script
generate "frame-11-counter-script.png" "Semi-realistic manga style, portrait 9:16. A lean Chinese man with short black swept-back hair, wearing black hoodie, typing rapidly on keyboard with intense focus. Multiple terminal windows open. His fingers blur with speed. Green code reflections in his eyes. Dark office, dramatic blue-green lighting. He looks at keyboard/screen, NOT at camera. Medium shot from side angle."

# Frame 12 - IP trace result: Titan Tech
generate "frame-12-titan-reveal.png" "Semi-realistic manga style, portrait 9:16. Split composition: top half shows a monitor screen with an IP trace diagram - arrows going through AWS relay nodes to a final destination highlighted in red. Bottom half shows the lean Chinese man's face in profile, eyes narrowed dangerously. Blue-red tech lighting. He looks at the screen, NOT at camera."

# Frame 13 - frozen expression
generate "frame-13-frozen.png" "Semi-realistic manga style, portrait 9:16. Close-up front-side view of a lean Chinese man with short black swept-back hair, slight stubble. His expression is completely frozen - jaw tight, eyes intense and unblinking. Blue screen light creates sharp shadows on his face. Dramatic manga-style impact lines subtly in background. He stares forward at the screen (slightly off to the side), NOT directly at camera."

# Frame 14 - internal realization (dark mood)
generate "frame-14-internal-mole.png" "Semi-realistic manga style, portrait 9:16. A lean Chinese man with short black swept-back hair, wearing black hoodie, sitting still at his desk. The three monitors glow behind him. His posture is rigid, hands flat on desk. The atmosphere is heavy and tense. Low-angle shot making him look determined. Dark office. He stares down at his hands, NOT at camera."

# Frame 15 - VPN login logs on screen
generate "frame-15-vpn-logs.png" "Semi-realistic manga style, portrait 9:16. Close-up of a monitor showing VPN login records in a table format. All entries show 'internal network' as source. Technical cybersecurity aesthetic. Green text on dark background. No human in frame."

echo "Batch 3 complete!"
