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

# Frame 02 - phone message from Lin Wei
generate "frame-02-phone-msg.png" "Semi-realistic manga style, portrait 9:16. Close-up of a smartphone screen in a dark office, a chat message visible on screen. A lean Chinese man's hand holding the phone. Blue monitor glow in background. The man has short black swept-back hair, wearing black hoodie. He is looking down at phone, NOT at camera. Warm small emoji visible on chat."

# Frame 03 - spotting anomaly on monitor
generate "frame-03-anomaly-spotted.png" "Semi-realistic manga style, portrait 9:16. A lean Chinese man with short black swept-back hair, slight stubble, wearing black hoodie, about to stand up but freezes mid-motion looking at one of three monitors. His expression shifts to alert surprise. Blue screen light. Dark office at night. He is looking at the screen, NOT at camera. Over-shoulder shot showing both his profile and the monitor with a graph showing a suspicious spike."

# Frame 04 - close-up monitor anomaly  
generate "frame-04-monitor-closeup.png" "Semi-realistic manga style, portrait 9:16. Extreme close-up of a computer monitor screen showing a server monitoring dashboard with network traffic graph. One dramatic spike highlighted in red at 3:17 AM timestamp. Dark background, blue-green monitor glow. Technical UI with graphs and numbers. No human face in this shot, just the screen."

# Frame 05 - Zhu Jiang frowning, digging into logs
generate "frame-05-frown-digging.png" "Semi-realistic manga style, portrait 9:16. Medium close-up of a lean Chinese man with short black swept-back hair, slight stubble, wearing black hoodie. He is frowning deeply, leaning forward toward a monitor, fingers on keyboard. His expression is focused and suspicious. Blue screen light illuminates his face from below. Dark office. He is looking at the keyboard/screen area, NOT at camera."

echo "Batch 1 complete!"
