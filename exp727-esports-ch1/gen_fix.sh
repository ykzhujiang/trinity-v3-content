#!/bin/bash
# EXP-727 FIX: 形象修复 — stronger beard, bulkier build, silver-white hair
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
OUTDIR="$HOME/trinity-v3-content/exp727-esports-ch1/images"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
mkdir -p "$OUTDIR"

export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"

gen() {
  local N="$1"
  local PROMPT="$2"
  local USE_REF="$3"
  local OUT="$OUTDIR/f${N}.jpg"
  # Force regenerate - remove existing
  rm -f "$OUT"
  echo ">>> f${N} $(date +%H:%M:%S)"
  if [ "$USE_REF" = "ref" ]; then
    uv run "$SCRIPT" --prompt "$PROMPT" --filename "$OUT" --resolution 1K -i "$REF" 2>&1 | tail -3
  else
    uv run "$SCRIPT" --prompt "$PROMPT" --filename "$OUT" --resolution 1K 2>&1 | tail -3
  fi
  if [ -f "$OUT" ]; then
    sips -s format jpeg -s formatOptions 75 -Z 1280 "$OUT" --out "$OUT" 2>/dev/null
    echo "OK f${N} $(du -h "$OUT" | cut -f1)"
  else
    echo "FAIL f${N}"
  fi
}

# Character descriptions
ZJ="Chinese man, 30 years old, 172cm 80kg stocky muscular build, short black hair combed back, FULL THICK BEARD (络腮胡 not just stubble), square jaw, broad shoulders"
XICI="thin tall teenager, 17 years old, bright SILVER-WHITE dyed hair (very distinctly silver-white, NOT dark/brown), wearing black hoodie, large headphones around neck, sharp angular face"

S="Semi-realistic manga illustration, vertical 9:16 portrait orientation, bright vivid lighting with warm tones, cinematic composition. No text on image. Characters look at scene objects or other characters, never at camera/viewer."

# --- ACT 1 ---
gen "01" "${S} ${ZJ}, wearing a rumpled business casual shirt with top button undone, carrying a cardboard box of personal items, walking out of a sleek modern tech office building entrance. Shot from behind at 3/4 angle. Late afternoon golden sunlight. Security guard visible at the glass door behind him. Mood: dejected but dignified." "ref"

gen "02" "${S} Close-up over-the-shoulder shot of ${ZJ}, sitting at a dirty plastic table in a small noisy Chinese internet cafe (wangba). Green-tinted monitor glow illuminates his face. He holds a cheap beer can. On screen: a MOBA game login screen. Neon signs and cigarette haze in background. Moody but warm interior lighting." "ref"

gen "03" "${S} Medium shot from behind the protagonist (${ZJ}) sitting at the internet cafe computer. On screen a MOBA team-fight is happening. His right hand is on the mouse, left hand on keyboard. His posture has shifted from slouched to alert and leaning forward. Other internet cafe patrons visible in peripheral. Warm neon-lit interior." "ref"

gen "04" "${S} Dynamic close-up of the protagonist's eyes (${ZJ}) reflecting the monitor screen glow. His pupils are intensely focused, with a subtle glowing overlay effect suggesting he can see tactical patterns. Expression: sudden realization mixed with excitement. Full thick beard visible. Dramatic rim lighting from monitor." "ref"

gen "05" "${S} Wide shot of the internet cafe. The protagonist (${ZJ}, wearing casual T-shirt) stands up from his chair with both fists raised in victory, headphones around his neck. Other internet cafe regulars stare at him - some annoyed, some amused. One kid in school uniform gives a thumbs up. The protagonist has a huge grin. Warm messy internet cafe atmosphere with neon lights." "ref"

# --- ACT 2 ---
gen "06" "${S} Medium shot of an older Chinese man (50+, bald/shaved head, muscular build, wearing military green tank top) leaning on the internet cafe counter. Behind him shelves of instant noodles and energy drinks. He's talking to a customer on the other side. Warm incandescent light from a bare bulb. The old man has a knowing half-smile." ""

gen "07" "${S} Close-up of a hand-written flyer on crumpled paper being slid across the sticky internet cafe counter. The flyer has crude Chinese characters and a gaming controller icon drawn on it. A thick finger points at it. Shallow depth of field, warm yellow lighting." ""

gen "08" "${S} ${ZJ}, wearing casual T-shirt and jeans, walks down a narrow neon-lit Shenzhen back alley at night. Colorful neon signs for restaurants and shops reflect on wet ground. He's looking at his phone while walking. Shot from ahead at low angle, the alley creating leading lines. Cyberpunk-lite atmosphere but grounded and real." "ref"

# --- ACT 3 ---
gen "09" "${S} ${ZJ} stands at the top of concrete stairs leading down to a run-down esports training room in a basement. A flickering LED sign above the door. Night time, street lamp casting harsh shadows. Gritty urban setting." "ref"

gen "10" "${S} Interior of a messy basement gaming room. Multiple gaming setups but only one is active. A ${XICI}, sullen expression, sits at the active PC, feet up on desk, spinning in his gaming chair. The room is lit by RGB LED strips and monitor glow. Energy drink cans scattered around." ""

gen "11" "${S} Two-shot confrontation. ${ZJ} in T-shirt, standing, arms crossed, slight smile, faces a ${XICI} sitting in gaming chair, arms crossed defensively, scowling up. The teenager's expression is hostile and dismissive. Dramatic lighting from monitors behind the teenager. Tension in the composition." "ref"

gen "12" "${S} Close-up of the teenager's face (${XICI}) turning from hostile scowl to slight surprise. His eyes widen a fraction. He's looking at something off-screen (a phone/tablet being shown to him). Cool blue monitor light on one side, warm overhead light on the other." ""

gen "13" "${S} Over-the-shoulder shot from behind the silver-white-haired teenager looking at ${ZJ}'s tablet screen which shows data charts and match replay analysis. ${ZJ} holds the tablet with one hand, pointing at specific data with the other. His expression is confident and analytical. The teenager's bright silver-white hair visible in foreground." "ref"

gen "14" "${S} Medium shot of the ${XICI} slowly removing his headphones from around his neck and placing them on the desk, a subtle gesture of opening up. His expression has shifted from hostile to cautiously interested. He looks up at someone partially visible at frame edge. Cool basement lighting with warm accent." ""

# --- ACT 4 ---
gen "15" "${S} Wide shot of a cramped internet cafe private room repurposed as a war room. A cheap whiteboard propped against the wall covered in marker diagrams (arrows, circles, gaming map layouts). ${ZJ} stands before it like a CEO giving a presentation, holding a marker. The ${XICI} sits in a gaming chair with arms crossed, one eyebrow raised. The bald cafe owner leans in the doorway watching. Warm overhead fluorescent lighting." "ref"

gen "16" "${S} Close-up of the whiteboard with hand-drawn tactical diagrams - it looks like a startup business plan mixed with gaming strategy. Arrows, team positioning circles, a crude game map. A hand draws a decisive final arrow. Marker ink still wet and shiny." ""

gen "17" "${S} Reaction shot of the ${XICI} leaning forward in his chair despite himself, expression shifting from skeptical to genuinely intrigued. His chin rests on his fist. Bright silver-white hair prominent. Behind him the bald cafe owner has an amused knowing smile. Warm interior lighting." ""

gen "18" "${S} ${ZJ} at a gaming station in the internet cafe, putting on a gaming headset with exaggerated seriousness, like a soldier putting on a helmet. He cracks his knuckles. The ${XICI} sits at the next station, already in position, trying hard not to smirk. Row of glowing monitors in front of them. Dramatic low angle shot." "ref"

# --- ACT 5 ---
gen "19" "${S} Wide establishing shot of an underground esports venue - a converted warehouse with improvised stage, large screens showing the game, audience of maybe 30-40 people crowded around. Neon and LED lighting, haze in the air. Two teams of players sit at long desks on opposite sides. Electric atmosphere." ""

gen "20" "${S} Medium close-up of ${ZJ} at his gaming station in the tournament, intensely focused on screen. His eyes have that subtle tactical-vision glow effect. Sweat on his forehead. Full beard visible. Headset on. Dramatic side lighting from the big screen behind him. The ${XICI} visible at the next station, fingers flying across keyboard." "ref"

gen "21" "${S} Dynamic action composition showing multiple monitors displaying the game. ${ZJ}'s hand on the mouse in foreground. On the big screen above: a dramatic team-fight moment. The small crowd is leaning forward. Split-second decisive moment captured. Blue and red lighting from the game screens." "ref"

gen "22" "${S} Reaction shot of the opposing team. Three players in matching jerseys (black with red logo) show shock and disbelief - one pushes back from his desk, another has hands on head. Their screens show a defeat indicator in red. Dramatic lighting from their monitors." ""

gen "23" "${S} ${ZJ} and the ${XICI} doing an awkward but genuine celebratory fist bump. ${ZJ} has a huge relieved grin, thick beard visible. The teenager's face shows the first real smile - reluctant but authentic. Small crowd cheering in the soft background. Warm victorious lighting." "ref"

gen "24" "${S} Close-up of ${ZJ}'s phone screen showing a social media post he's typing. Next to the phone, his hand still slightly trembling from the match adrenaline. Warm cafe lighting in background. Shallow depth of field." "ref"

# --- ACT 6 ---
gen "25" "${S} ${ZJ} and the ${XICI} walking out of the warehouse venue into cool night air. They're side by side, both looking at a tournament bracket poster on the wall outside. Night scene, street lights and neon signs. Both figures shot from behind at 3/4 angle." "ref"

gen "26" "${S} Extreme close-up of the tournament bracket poster pinned to a concrete wall. A finger points at the next match slot. Harsh street light illuminating the paper. Dramatic and ominous feel." ""

gen "27" "${S} Close-up of ${ZJ}'s face from slight side angle. Full thick beard prominent. His expression transitions from casual confidence to stunned recognition - eyes widening, jaw slightly dropping. Night street lighting creates dramatic shadows on his face. Something he sees off-screen has shocked him." "ref"

gen "28" "${S} Final frame: the tournament bracket poster in full view, but now we see the opposing team name slot for next round has a familiar corporate logo (sleek tech company style). Below the poster, ${ZJ} (stocky, bearded) and the ${XICI} stand small in frame, looking up at it. Night scene, dramatic low angle looking up at the poster. Ominous blue-tinted street lighting. Cliffhanger atmosphere." "ref"

echo "=== ALL 28 DONE ==="
