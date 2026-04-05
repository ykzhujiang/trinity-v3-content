#!/bin/bash
# EXP-928 Image Generation Script
# Generates panels in parallel batches using Gemini

OUTDIR="$(dirname "$0")/images"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
mkdir -p "$OUTDIR"

STYLE_BASE="Semi-realistic manga art style, vibrant warm colors, detailed illustration. Vertical 9:16 portrait orientation. Characters never look at camera/viewer. High quality detailed art."

CHAR_ZJ="East Asian man, 172cm stocky build 80kg, black short hair slicked back, short stubble beard, big confident eyes, round face"
CHAR_ZJ_MODERN="$CHAR_ZJ, wearing dark business suit with white shirt"
CHAR_ZJ_ISEKAI="$CHAR_ZJ, wearing worn brown linen merchant robe with rope belt, medieval fantasy clothes"
CHAR_TONGHUA="Middle-aged Chinese woman 40yo, round plump face, messy bun hairstyle, dirty white apron over brown dress, kind tired eyes"
CHAR_ZHAO="Tall thin Chinese man, hawk nose, thin goatee beard, wearing dark purple silk brocade robe, cold calculating eyes"

gen() {
  local num=$1 prompt=$2
  local outfile="$OUTDIR/p$(printf '%02d' "$num").jpg"
  if [ -f "$outfile" ]; then
    echo "SKIP p$num (exists)"
    return
  fi
  echo "GEN p$num..."
  gemini --model gemini-2.0-flash-preview-image-generation \
    --output-file "$outfile" \
    "Generate a single illustration image. $STYLE_BASE $prompt" 2>/dev/null
  if [ -f "$outfile" ]; then
    # Compress: resize to 600px width, JPG quality 65
    sips --resampleWidth 600 -s format jpeg -s formatOptions 65 "$outfile" --out "$outfile" 2>/dev/null
    local sz=$(stat -f%z "$outfile" 2>/dev/null || stat -c%s "$outfile" 2>/dev/null)
    echo "OK p$num (${sz}B)"
  else
    echo "FAIL p$num"
  fi
}

# ACT 1: Modern World
gen 1 "Wide shot of a modern startup office at night. Blue monitor glow illuminates a dark room. $CHAR_ZJ_MODERN hunched over desk alone, working late. Warm desk lamp. City skyline lights through floor-to-ceiling windows. Slight melancholy but determined atmosphere."
gen 2 "Close-up 3/4 angle of $CHAR_ZJ face lit by computer screen blue glow. Tired but determined eyes. Prominent stubble. Empty coffee cup nearby. Looking at screen not at viewer."
gen 3 "Medium shot. $CHAR_ZJ_MODERN reaching for coffee cup, eyes suddenly going wide in shock. Computer screen glitching with white light. Everything starting to glow and dissolve. Dramatic lighting."
gen 4 "Extreme wide shot. Modern office dissolving into golden light particles. Silhouette of man being consumed by brilliant white-gold light. Abstract ethereal transition scene."

wait

# ACT 2: Arrival
gen 5 "Low angle looking up. $CHAR_ZJ_ISEKAI lying in a garbage pile in a medieval fantasy alley, eyes just opening, confused expression. Old stone buildings visible above. Warm golden sunlight streaming down. Steampunk pipes on walls."
gen 6 "First-person POV from ground level looking down a dilapidated medieval market street. Broken wooden carts, dusty cobblestone road. A wooden sign reads in Chinese characters. Warm amber sunlight. Steampunk aesthetic with brass pipes."
gen 7 "Medium shot. $CHAR_ZJ_ISEKAI standing up from garbage pile, looking at his own hands in confusion. Wearing worn brown linen robe. Medieval fantasy town background. Warm golden light."
gen 8 "Close-up dramatic shot. Semi-transparent blue holographic panel appearing in mid-air, glowing with blue light. Text and data visible on the panel. Blue glow reflecting on a man's face. Fantasy medieval background."

wait

gen 9 "Over-shoulder shot of $CHAR_ZJ_ISEKAI looking at a floating semi-transparent blue holographic panel showing stats and numbers. His shoulders slumped in defeat. Medieval town street background. Warm afternoon light."
gen 10 "Wide establishing shot of a medieval fantasy market town with steampunk elements. Brass pipes on buildings, wooden market stalls, people in medieval clothes haggling. Warm golden hour sunlight. Vibrant and lively atmosphere."
gen 11 "Fantasy scene with semi-transparent blue holographic overlay scanning a medieval marketplace. Red warning indicators floating over market stalls. Data visualization showing price manipulation. Warm ambient lighting with blue tech overlay."
gen 12 "Medium shot from behind of $CHAR_ZHAO standing proudly in front of his large ornate merchant shop. Two muscular guards flanking the entrance. Townspeople walking by avoiding eye contact. Rich warm afternoon sunlight."

wait

# ACT 3: Meeting 铜花
gen 13 "Interior of a tiny cramped medieval shop. Half-empty wooden shelves. $CHAR_TONGHUA counting copper coins behind a wooden counter. Warm candlelight. Cozy but poor atmosphere. Medieval fantasy setting."
gen 14 "Close-up portrait of $CHAR_TONGHUA: round plump face, messy bun hair, dirty white apron, kind tired eyes with faint smile. Warm candlelight on her face. Looking slightly to the side, not at viewer. Medieval fantasy."
gen 15 "Two-shot inside small shop. $CHAR_ZJ_ISEKAI animatedly gesturing with hands across counter, explaining something. $CHAR_TONGHUA on other side listening with tilted head, confused but interested. Warm candlelight. Medieval fantasy."
gen 16 "Close-up reaction shot of $CHAR_TONGHUA with bewildered and amused expression. One eyebrow raised, slight smirk. Warm light. Medieval setting. Not looking at viewer."

wait

gen 17 "Close-up of a semi-transparent blue holographic panel floating in air displaying Chinese text and financial data. Blue glow. Medieval room background slightly blurred. Technology meets fantasy aesthetic."
gen 18 "Medium shot. $CHAR_TONGHUA reluctantly handing over copper coins to $CHAR_ZJ_ISEKAI across counter. She is shaking her head but smiling. Warm candlelight illumination. Cozy medieval shop interior."
gen 19 "Dynamic wide shot. $CHAR_ZJ_ISEKAI running energetically on a dirt road between medieval fantasy towns. Carrying a cloth bag. Blue holographic panel floating beside him showing a route map. Bright daylight, green rolling hills, blue sky."
gen 20 "Action shot. $CHAR_ZJ_ISEKAI loading bundles of dried herbs onto a wooden cart in a busy medieval marketplace. Determined expression, sweat on brow. Warm bright sunlight. Busy market vendors in background."

wait

# ACT 4: First Trade
gen 21 "Close-up of a semi-transparent blue holographic panel showing profit calculations with Chinese text, green numbers, bar graphs. Blue glow. Medieval market scene blurred in background."
gen 22 "Wide cinematic shot. $CHAR_ZJ_ISEKAI returning to medieval town gate pulling a loaded wooden cart. Triumphant confident expression. Golden sunset behind him, silhouette-lit. Dramatic warm lighting."
gen 23 "Bird's eye view looking down at a wooden counter covered with dozens of gleaming copper coins spread out. Two pairs of hands visible at edges of frame. Warm candlelight reflecting off coins."
gen 24 "Close-up of $CHAR_TONGHUA with jaw dropped, eyes wide as saucers, hand over mouth in shock. Copper coin reflections in her eyes. Warm candlelight. Medieval shop. Not looking at viewer."

wait

gen 25 "Two-shot comedic scene. $CHAR_ZJ_ISEKAI trying to look cool and nonchalant, slight smirk. $CHAR_TONGHUA grabbing his arm excitedly, mouth open asking questions. Warm medieval shop interior. Both looking at each other not at viewer."
gen 26 "Semi-transparent blue holographic panel floating in air showing investment returns data, percentage numbers, ranking changes. Green glowing text. Medieval background. Tech meets fantasy aesthetic."
gen 27 "Medium shot. $CHAR_ZHAO sitting in an ornate merchant office. A servant whispering in his ear. His face darkening with anger, crushing a porcelain teacup in his hand. Tea spilling. Dark rich interior with warm lamp light."

wait

# ACT 5: Confrontation
gen 28 "Low angle dramatic shot. $CHAR_ZHAO striding forward menacingly with two muscular thugs behind him. Purple silk robes billowing. Afternoon sun behind creating silhouette effect. Medieval town street."
gen 29 "Extreme close-up of $CHAR_ZHAO face showing fury. Hawk nose, thin goatee, thin lips twisted in contempt. Cold calculating eyes. Veins visible on temple. Warm light from side. Not looking at viewer."
gen 30 "Medium shot. $CHAR_ZJ_ISEKAI stepping out of a doorway calmly, arms crossed, slight confident smile. Warm sunlight on his face. Medieval town square. Facing sideways, not at viewer. Brown linen robe."
gen 31 "Dynamic action shot. $CHAR_ZJ_ISEKAI drawing on a large white cloth with charcoal in a medieval town square. Price charts and numbers visible on cloth. Small crowd starting to gather. Bright warm afternoon sunlight."

wait

gen 32 "Wide shot of medieval town square. Large crowd of merchants and townspeople surrounding a price chart on cloth. People pointing, gasping, whispering to each other. Bright warm afternoon. Vibrant atmosphere."
gen 33 "Extreme close-up of $CHAR_ZHAO face contorted with fury. Veins bulging on temple. Goatee quivering. Red flush on face. Side lighting. Dramatic. Not looking at viewer."
gen 34 "Over-shoulder from $CHAR_ZHAO looking at hostile crowd. Merchants shaking fists. $CHAR_ZJ_ISEKAI standing confidently by price chart in background. Warm afternoon light. Medieval fantasy setting."

wait

# ACT 6: Counter-Attack + Cliffhanger
gen 35 "Night scene with warm orange lantern light. Three thugs sneaking through a medieval alley toward a shop. Carrying wooden clubs. Paper lanterns casting warm orange glow on cobblestones. Not too dark."
gen 36 "Medium shot. $CHAR_ZJ_ISEKAI crouching on a rooftop above an alley at night. Blue holographic panel floating showing predicted movement paths. Blue glow on his face. Calm analytical expression. Warm lantern light below."
gen 37 "Wide shot. Thugs having kicked open a wooden shop door, finding it completely empty. Bare shelves. Confused expressions. Dust in warm lantern light. Medieval fantasy interior."
gen 38 "Comedic action shot. A ceiling trapdoor opening with an avalanche of hundreds of gleaming copper coins pouring down on surprised thugs below. Coins flying everywhere with golden sparkle. Warm light. Dramatic and funny."

wait

gen 39 "Wide comedic shot. Three thugs buried waist-deep in pile of copper coins inside a medieval shop. One trying to swim through coins. Another spitting out coins. Warm lantern light. Funny scene."
gen 40 "Medium shot. $CHAR_ZJ_ISEKAI brushing off hands with satisfied smirk. $CHAR_TONGHUA next to him covering mouth laughing. Night market with warm lantern lights in background. Both looking at the shop not at viewer."
gen 41 "Dramatic shot. A semi-transparent holographic panel flashing red with warning symbols. Emergency alert visual. Red glow in a medieval night setting with warm lanterns. Ominous atmosphere but not too dark."
gen 42 "Close-up of $CHAR_ZJ_ISEKAI face showing expression changing from confident smirk to concern. Half-smile frozen. Blue and red holographic glow on his face. Night sky with ominous clouds above. Not looking at viewer."

wait

echo "=== ALL DONE ==="
ls -la "$OUTDIR"/*.jpg 2>/dev/null | wc -l
du -sh "$OUTDIR"
