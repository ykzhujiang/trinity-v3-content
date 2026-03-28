#!/bin/bash
# EXP-724 Ch1: 《重启之日》— 时间循环×AI创业
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
OUTDIR="$HOME/trinity-v3-content/exp724-ch1/images"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
mkdir -p "$OUTDIR"

export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"

gen() {
  local N="$1"
  local PROMPT="$2"
  local USE_REF="$3"
  local OUT="$OUTDIR/f${N}.jpg"
  [ -f "$OUT" ] && echo "SKIP f${N}" && return
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

S="Semi-realistic manga illustration, vertical 9:16 portrait orientation, bright warm vivid lighting, cinematic composition. No text on image. Characters look at scene objects or other characters, never at camera/viewer."

# --- Loop 1: Opening ---
gen "01" "${S} A Chinese man (172cm, 80kg, short black hair combed back, stubble beard, wearing dark polo shirt) reaching for alarm clock on bedside table showing 7:30, morning golden sunlight streaming through curtains into a modern Shenzhen apartment bedroom. Low angle from bedside. Warm cozy atmosphere." "ref"

gen "02" "${S} Same Chinese man (172cm, 80kg, short black hair combed back, stubble, dark polo shirt and dark dress pants) adjusting collar in front of bathroom mirror, seen from over his shoulder showing his reflection. Modern apartment bathroom, bright morning light." "ref"

gen "03" "${S} Wide establishing shot of a gleaming modern Shenzhen office tower lobby. The same Chinese man walking through revolving glass doors carrying a laptop bag, shot from behind at 3/4 angle. Glass curtain walls reflecting morning sunlight, busy lobby with other office workers." "ref"

gen "04" "${S} Modern conference room, bright daylight through floor-to-ceiling windows. A man in dark polo (our protagonist, 172cm 80kg stubble short black hair) stands at a presentation screen showing charts. Across the long table sits an older man (50+, silver-white short hair, round face, expensive three-piece suit, gold watch on wrist). Shot from side angle showing both figures and the tension between them." "ref"

gen "05" "${S} Close-up of the older investor's hand tapping the conference table impatiently, gold watch prominent. His expression is arrogant and dismissive. Behind him, the presenter (our protagonist) is blurred, looking stunned with mouth slightly open. Dramatic side lighting from windows." "ref"

# --- Loop 1 End + Loop 2 Start ---
gen "06" "${S} Night scene but with warm indoor lighting. Small Shenzhen apartment, the Chinese man (polo shirt sleeves rolled up, tired) sits at a cluttered desk covered with documents and empty coffee cups. He holds a glowing USB drive that emits bright blue-white light illuminating his face from below. Moody but not dark - city lights visible through window." "ref"

gen "07" "${S} Morning alarm clock showing 7:30, identical golden sunlight angle as morning scene. The Chinese man sitting bolt upright in bed, eyes wide with shock and confusion, same bedroom, same morning light. Dramatic medium shot from the foot of the bed." "ref"

gen "08" "${S} Office elevator interior, bright fluorescent lighting. The Chinese man (dark polo, dress pants) stands among several coworkers who are chatting. He looks confused and disturbed, staring at nothing while others talk around him. Shot from corner of elevator showing group dynamics." "ref"

gen "09" "${S} Outside conference room glass door. A slick-looking young man (35, Asian-American, gel-slicked hair, fitted suit, constant smile) gestures while speaking to our protagonist. Our protagonist (3/4 back to viewer) reacts with subtle alarm recognizing the scene. Bright office corridor lighting." "ref"

gen "10" "${S} Conference room interior. Our protagonist rushing through the door late, slightly disheveled. At the long table, the silver-haired investor checks his gold watch with displeasure. Two other suited people already seated look up. Dramatic perspective from inside the room toward the door." "ref"

# --- Loop 3: Intelligence Gathering ---
gen "11" "${S} Office hallway corner. Our protagonist (dark polo) pressing his back against the wall, leaning to eavesdrop around the corner. Down the hallway near the pantry area, the silver-haired investor talks with a young female assistant. Bright office lighting, slight comedic composition with protagonist in spy pose." "ref"

gen "12" "${S} Close-up over-the-shoulder of the protagonist looking at his smartphone screen (screen content not readable). His expression shows sudden realization - eyes widening, mouth forming an 'oh'. Warm lighting from a cafe window in background." "ref"

gen "13" "${S} Open-plan office workspace. A young woman (28, ponytail, black-framed glasses, oversized grey hoodie, slim and tall) sits at her desk with multiple monitors, rolling her eyes dramatically while speaking to the protagonist who stands next to her desk. Bright office with tech company vibes, colorful sticky notes on monitors." ""

gen "14" "${S} Cafe window seat, bright afternoon sunlight streaming in. The protagonist sits hunched over an open notebook filled with hand-drawn timelines, arrows, and circled notes. A half-drunk coffee beside him. His expression is intensely focused, pen in hand. Shot from outside the window looking in." "ref"

gen "15" "${S} Office reception area, bright and modern. A young female receptionist in the process of knocking over a coffee cup - the liquid mid-spill. The protagonist appears from the side, smoothly extending a handful of napkins with a knowing smile. The receptionist looks up in complete surprise. Comedic timing captured in still frame." "ref"

# --- Loop 4-5: Speedrun ---
gen "16" "${S} Office elevator, bright lighting. The protagonist casually finishes a sentence while looking forward nonchalantly. Behind him, a random office worker (different face from all other characters) turns to stare at him with a mixture of shock and slight horror. Comedic reaction shot, slight dutch angle for comedy." "ref"

gen "17" "${S} Conference room doorway. The slick Asian-American man (gel hair, fitted suit, constant smile now replaced by surprise) pushes open the glass door to find the protagonist already seated confidently at the head of the table, arms crossed, with a smug grin. Role reversal composition - protagonist in power position. Bright room, morning light." "ref"

gen "18" "${S} Dynamic medium shot of the protagonist mid-presentation, standing confidently with one hand gesturing toward a projection screen showing business data charts. His posture is commanding, expression passionate. The silver-haired investor in foreground is slightly nodding with grudging respect. Bright conference room, golden hour light through windows." "ref"

gen "19" "${S} Two-shot in office corridor. The young woman with ponytail and glasses (hoodie, slim) opens her mouth to speak. The protagonist, walking beside her, holds up one finger and mouths her words simultaneously. Her eyes are comically wide, jaw dropped mid-sentence. Bright corridor lighting, comedic timing." "ref"

gen "20" "${S} Conference room, dramatic moment. The silver-haired investor leans back in his leather chair, fingers steepled, serious expression. He looks directly at the protagonist across the table (seen from behind, 3/4 angle). The mood is tense - bright but dramatic side lighting from windows creates strong shadows on the investor's face." "ref"

# --- DECISION-1 + Emotional Core ---
gen "21" "${S} Extreme close-up of the protagonist's hands clasped together on the conference table, knuckles slightly white. Conference room lights creating rim lighting from the side. Shallow depth of field, everything behind hands is soft bokeh. Tense contemplative moment." "ref"

gen "22" "${S} Medium close-up of the protagonist from slight low angle. He lifts his head, jaw set with determination, eyes steady and sincere. A slight warm smile forming at the corner of his mouth. Conference room background softly blurred. Golden warm light from windows gives him a hero glow." "ref"

gen "23" "${S} Flashback scene - warm nostalgic color palette. A small modest living room. An elderly Chinese woman (70s, gentle face, grey hair in bun) sits on a simple sofa holding a smartphone, looking confused and helpless. A younger version of the protagonist sits beside her patiently pointing at the screen. Warm domestic lighting, deeply emotional composition." "ref"

gen "24" "${S} The silver-haired investor (50+, three-piece suit) has removed his glasses and is polishing them slowly. His expression has softened - stern facade cracked, eyes slightly glistening. The conference room is quiet, other attendees in soft focus background showing moved expressions. Warm golden light." ""

# --- DECISION-2 + Climax ---
gen "25" "${S} Conference room door bursting open. The slick Asian-American man (gel hair, expensive suit) strides in confidently holding a document folder, his smile is calculating and sharp. Everyone at the table turns to look. Dynamic composition with door as frame, bright hallway light behind him creating silhouette edge." ""

gen "26" "${S} Extreme close-up of the protagonist's face from slight side angle. His eyes are focused on something off-screen (the document), showing a rapid sequence of emotions - surprise transitioning to resolve. One eyebrow slightly raised, jaw muscles tight. Dramatic rim lighting." "ref"

gen "27" "${S} Triumphant wide shot. The protagonist stands up from his chair, extending his hand across the conference table toward the silver-haired investor who is breaking into a genuine laugh, reaching to shake hands. Brilliant golden sunlight floods through the floor-to-ceiling windows behind them, creating a warm glowing atmosphere. Other attendees in background showing relieved/happy expressions." "ref"

gen "28" "${S} Morning bedroom scene. Alarm clock on bedside table showing 7:30, identical to opening frame. The USB drive on the bedside table glows with an eerie but beautiful blue light. The protagonist's hand reaches into frame from the bed toward the USB. Mysterious, intriguing atmosphere. Dawn light mixing with blue USB glow." "ref"

echo "=== ALL DONE ==="
