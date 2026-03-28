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

# Frame 06 - terminal scrolling code
generate "frame-06-terminal-code.png" "Semi-realistic manga style, portrait 9:16. A lean Chinese man with short black swept-back hair, wearing black hoodie, sitting at desk. He stares at a terminal screen with green scrolling code. His expression changes from confusion to shock - eyes widening, mouth slightly open. Blue-green screen glow. Dark office. He looks at the screen, NOT at camera. Dynamic angle from slightly below."

# Frame 07 - close-up of backdoor code on screen
generate "frame-07-backdoor-code.png" "Semi-realistic manga style, portrait 9:16. Extreme close-up of a dark terminal screen showing lines of code. Several lines are highlighted in red/orange, representing a hidden data exfiltration module disguised within a log cleanup script. Technical hacker aesthetic. Green and red code on black background. No human in frame."

# Frame 08 - Zhu Jiang leaning back in shock
generate "frame-08-leaning-back.png" "Semi-realistic manga style, portrait 9:16. A lean Chinese man with short black swept-back hair, slight stubble, wearing black hoodie, leaning back in his office chair with a deep breath. His hand runs through his hair. Expression of disbelief and gravity. Blue monitor glow from the side. Dark office. He looks up at ceiling, NOT at camera. Low angle dramatic shot."

# Frame 09 - git commit history on screen
generate "frame-09-git-history.png" "Semi-realistic manga style, portrait 9:16. Over-shoulder view of a lean Chinese man with short black hair looking at a monitor showing git commit logs. The screen shows a suspicious commit by 'devops-bot' username highlighted. Dark office, blue screen light. The man is viewed from behind/side, NOT facing camera."

# Frame 10 - bitter smile close-up
generate "frame-10-bitter-smile.png" "Semi-realistic manga style, portrait 9:16. Close-up of a lean Chinese man's face with short black swept-back hair, slight stubble. He has a bitter knowing smirk - one corner of his mouth raised, eyes sharp and confident. Blue light from one side. Expression reads 'amateur work'. He looks slightly to the side, NOT at camera. Dramatic side lighting."

echo "Batch 2 complete!"
