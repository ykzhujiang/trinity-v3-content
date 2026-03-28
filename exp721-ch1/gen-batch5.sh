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

# Frame 21 - next morning sunny office
generate "frame-21-sunny-office.png" "Semi-realistic manga style, portrait 9:16. Bright modern tech startup office during daytime. Sunlight streaming through large windows. A lean Chinese man with short black swept-back hair, wearing a dark gray polo shirt and casual pants, walking through the office holding a coffee cup. He smiles warmly at colleagues. Vibrant, clean, modern office with plants and whiteboards. He looks at people in the office, NOT at camera."

# Frame 22 - Chen Hao handing report
generate "frame-22-chenhao-report.png" "Semi-realistic manga style, portrait 9:16. Two Chinese men in a bright modern office. Left: a tall man with a square jaw, clean-shaven, in a sharp navy suit and tie, smiling confidently while handing over a document. Right: a shorter lean man with short black swept-back hair, slight stubble, in dark gray polo, receiving the document with a calm smile. They look at each other (not at camera). The tall man (Chen Hao) looks distinctly different - taller, square jaw, no stubble."

# Frame 23 - Zhu Jiang's steady hand close-up
generate "frame-23-steady-hand.png" "Semi-realistic manga style, portrait 9:16. Extreme close-up of a hand steadily receiving a printed report document. The hand is calm and unwavering. Bright office lighting. Clean, sharp focus. Subtle manga-style detail emphasis on the steadiness of the hand. No trembling."

# Frame 24 - smiling response
generate "frame-24-smile-response.png" "Semi-realistic manga style, portrait 9:16. Medium shot of a lean Chinese man with short black swept-back hair, slight stubble, wearing dark gray polo. He is smiling warmly and gesturing invitingly with one hand while holding a coffee cup in the other. Bright sunny office. His expression is perfectly calm and friendly - no hint of suspicion. He looks at the tall suited man (Chen Hao) who is slightly visible at the edge of frame, NOT at camera."

# Frame 25 - final reveal: monitoring screen
generate "frame-25-monitor-reveal.png" "Semi-realistic manga style, portrait 9:16. A lean Chinese man in dark gray polo walking away from camera into his private office. In the foreground, sharp focus on his laptop screen on the desk showing a custom monitoring dashboard with 50 employee activity feeds in a grid. Green dots pulsing. The man is seen from behind walking toward the window. Bright office. Dramatic reveal composition - the laptop screen is the focal point."

echo "Batch 5 (final) complete!"
