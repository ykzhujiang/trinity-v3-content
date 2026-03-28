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

# Frame 16 - scanning empty office
generate "frame-16-empty-office.png" "Semi-realistic manga style, portrait 9:16. Wide shot of a modern tech startup office at night, empty desks with monitors off, only one desk lit. A lean Chinese man with short black hair in black hoodie stands up, slowly scanning the room. Each empty workstation looks suspicious. Moonlight through windows. Atmospheric and tense. He looks across the room, NOT at camera."

# Frame 17 - deleting traces (DECISION POINT)
generate "frame-17-deleting-traces.png" "Semi-realistic manga style, portrait 9:16. Close-up of hands on a keyboard rapidly typing. Terminal screen shows commands being executed - clearing logs, restoring backups. The lean Chinese man's determined face partially visible above the keyboard. Cold blue light. He looks at the screen, NOT at camera. Intense focused expression."

# Frame 18 - standing up, turning off lights
generate "frame-18-lights-off.png" "Semi-realistic manga style, portrait 9:16. A lean Chinese man with short black swept-back hair, wearing black hoodie, standing up from his desk and reaching for the light switch. The monitors are already off. His posture is deliberately casual, relaxed. But there is subtle tension in his shoulders. Dark blue ambient light. He looks at the light switch, NOT at camera."

# Frame 19 - hallway with security guard
generate "frame-19-hallway-guard.png" "Semi-realistic manga style, portrait 9:16. A lean Chinese man with short black hair in black hoodie walking down a modern office corridor at night. An older Chinese security guard in uniform sits at a desk near the exit. The young man waves casually with a warm smile. Fluorescent hallway lights. Both characters look at each other (not at camera). The guard is a different person - older, rounder face, in uniform."

# Frame 20 - elevator cold eyes
generate "frame-20-elevator-cold.png" "Semi-realistic manga style, portrait 9:16. A lean Chinese man with short black swept-back hair, slight stubble, alone in a modern elevator. His reflection visible in the metal doors. His expression has completely transformed - warm smile is gone, replaced by ice-cold calculating eyes. Dramatic contrast. Harsh fluorescent elevator light from above. He looks at his own reflection in the elevator doors, NOT at camera."

echo "Batch 4 complete!"
