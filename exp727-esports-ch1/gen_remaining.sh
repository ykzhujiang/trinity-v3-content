#!/bin/bash
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
OUTDIR="$HOME/trinity-v3-content/exp727-esports-ch1/images"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"

gen() {
  local N="$1"; local PROMPT="$2"; local USE_REF="$3"
  local OUT="$OUTDIR/f${N}.jpg"
  rm -f "$OUT"
  echo ">>> f${N} $(date +%H:%M:%S)"
  if [ "$USE_REF" = "ref" ]; then
    uv run "$SCRIPT" --prompt "$PROMPT" --filename "$OUT" --resolution 1K -i "$REF" 2>&1 | tail -3
  else
    uv run "$SCRIPT" --prompt "$PROMPT" --filename "$OUT" --resolution 1K 2>&1 | tail -3
  fi
  [ -f "$OUT" ] && sips -s format jpeg -s formatOptions 75 -Z 1280 "$OUT" --out "$OUT" 2>/dev/null && echo "OK f${N} $(du -h "$OUT" | cut -f1)" || echo "FAIL f${N}"
}

ZJ="Chinese man, 30 years old, 172cm 80kg stocky muscular build, short black hair combed back, FULL THICK BEARD (络腮胡 not just stubble), square jaw, broad shoulders"
XICI="thin tall teenager, 17 years old, bright SILVER-WHITE dyed hair (very distinctly silver-white, NOT dark/brown), wearing black hoodie, large headphones around neck, sharp angular face"
S="Semi-realistic manga illustration, vertical 9:16 portrait orientation, bright vivid lighting with warm tones, cinematic composition. No text on image. Characters look at scene objects or other characters, never at camera/viewer."

gen "23" "${S} ${ZJ} and the ${XICI} doing an awkward but genuine celebratory fist bump. ${ZJ} has a huge relieved grin, thick beard visible. The teenager's face shows the first real smile - reluctant but authentic. Small crowd cheering in the soft background. Warm victorious lighting." "ref"

gen "24" "${S} Close-up of ${ZJ}'s phone screen showing a social media post he's typing. Next to the phone, his hand still slightly trembling from the match adrenaline. Warm cafe lighting in background. Shallow depth of field." "ref"

gen "25" "${S} ${ZJ} and the ${XICI} walking out of the warehouse venue into cool night air. They're side by side, both looking at a tournament bracket poster on the wall outside. Night scene, street lights and neon signs. Both figures shot from behind at 3/4 angle." "ref"

gen "26" "${S} Extreme close-up of the tournament bracket poster pinned to a concrete wall. A finger points at the next match slot. Harsh street light illuminating the paper. Dramatic and ominous feel." ""

gen "27" "${S} Close-up of ${ZJ}'s face from slight side angle. Full thick beard prominent. His expression transitions from casual confidence to stunned recognition - eyes widening, jaw slightly dropping. Night street lighting creates dramatic shadows on his face. Something he sees off-screen has shocked him." "ref"

gen "28" "${S} Final frame: the tournament bracket poster in full view, but now we see the opposing team name slot for next round has a familiar corporate logo (sleek tech company style). Below the poster, ${ZJ} (stocky, bearded) and the ${XICI} stand small in frame, looking up at it. Night scene, dramatic low angle looking up at the poster. Ominous blue-tinted street lighting. Cliffhanger atmosphere." "ref"

echo "=== REMAINING DONE ==="
