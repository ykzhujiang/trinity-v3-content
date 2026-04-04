#!/bin/bash
# EXP-909 Image Generation — Silicon Soul Ch8: 棋局
set -e
OUT_DIR="$HOME/trinity-v3-content/exp909-silicon-soul-ch8/images"
REF="$HOME/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
mkdir -p "$OUT_DIR"

ZJ="a Chinese man in his early 30s with black slicked-back hair, short beard/stubble along jawline, strong jaw, medium build — based on reference photo"
CHEN="a Chinese man with square jaw, buzz cut hair, sturdy build"
ZHOU_YQ="a Chinese man in early 30s, thin-framed glasses, gentle scholarly face, wearing cream/beige sweater, calm professor-like demeanor"
FANG="a Chinese woman in early 30s, short bob haircut, sharp eyes, wearing white blazer over black top, professional and alert"

STYLE="Realistic manga style illustration, vertical 9:16 aspect ratio (768x1344 pixels), cinematic composition. Characters do NOT look at camera. All text in Chinese only. High quality detailed illustration."
BRIGHT="Bright warm lighting, well-lit scene, warm color palette."
NIGHT_WARM="Deep blue night tones with warm amber lamp light — NOT pure black background. Cozy indoor lighting."

gen() {
  local n=$1; shift
  local f="$OUT_DIR/p$(printf '%02d' $n).webp"
  [ -f "$f" ] && { echo "SKIP p$(printf '%02d' $n)"; return 0; }
  echo "=== p$(printf '%02d' $n) ==="
  local tmp="$OUT_DIR/p$(printf '%02d' $n)_tmp.png"
  gemini -p "Generate an image: $* $STYLE" \
    --model gemini-2.0-flash-preview-image-generation \
    --output-file "$tmp" 2>&1 || {
    echo "RETRY p$(printf '%02d' $n)"; sleep 3
    gemini -p "Generate an image: $* $STYLE" \
      --model gemini-2.0-flash-preview-image-generation \
      --output-file "$tmp" 2>&1 || { echo "FAIL p$(printf '%02d' $n)"; return 1; }
  }
  if [ -f "$tmp" ]; then
    sips --resampleWidth 700 "$tmp" --out "$tmp" 2>/dev/null || true
    cwebp -q 75 "$tmp" -o "$f" 2>/dev/null || { sips -s format jpeg -s formatOptions 70 "$tmp" --out "${f%.webp}.jpg" 2>/dev/null; mv "${f%.webp}.jpg" "$f" 2>/dev/null || true; }
    rm -f "$tmp"
    echo "OK p$(printf '%02d' $n) — $(du -h "$f" | cut -f1)"
  fi
  sleep 1
}

# Beat 1: 星环的威胁 (街道/出租车, 傍晚) — BRIGHT golden sunset
gen 1 "Wide shot. $ZJ stands on a city sidewalk at golden hour sunset, holding phone to his ear. Deep blue shirt and black casual trousers. Expression shifts from shock to cold composure. Warm golden sunset light bathes the street. Urban cityscape with pedestrians. $BRIGHT"

gen 2 "Extreme close-up of a smartphone screen showing an incoming call from an unknown number. Call timer shows 0:12. Warm light reflects on the phone screen. $BRIGHT"

gen 3 "Medium close-up of $ZJ's face during the phone call. His jaw tightens. Deep blue shirt. Golden sunset side-lighting. Expression: controlled anger, calculating. $BRIGHT"

gen 4 "Medium shot. $ZJ puts phone in pocket and raises hand to hail a taxi on a busy street. Evening golden light. Determined stride. Deep blue shirt. $BRIGHT"

gen 5 "Interior of a taxi, warm amber dashboard lights. $ZJ in back seat putting in wireless earbuds, leaning forward slightly, speaking quietly. Deep blue shirt. City lights streak past the windows. $NIGHT_WARM"

gen 6 "Close-up of a tablet/phone screen in the taxi showing an audio waveform analysis with Chinese labels — voice pattern analysis results. Blue-green data visualization on dark background with warm ambient light reflected. $NIGHT_WARM"

# Beat 2: 安全屋会议 (陈明家, 夜晚) — WARM indoor
gen 7 "Wide shot of a cozy modern apartment living room at night. $ZJ enters through the door. $CHEN in a dark hoodie sits at a desk. $ZHOU_YQ in cream sweater sits on the sofa with a laptop. Warm amber floor lamp and desk lamp lighting. Cream/beige walls. $NIGHT_WARM"

gen 8 "Medium shot. $ZHOU_YQ leans forward on the sofa, speaking analytically, thin-framed glasses catching lamp light. $ZJ and $CHEN listen intently. Warm living room. $NIGHT_WARM"

gen 9 "Close-up of a laptop screen showing a city map with a red tracking signal path overlay. Chinese labels. The signal path traces from a coffee shop to the current location. Warm screen glow. $NIGHT_WARM"

gen 10 "Extreme close-up of a desk surface — two SIM cards side by side, one being removed from a phone. $ZJ's hands performing the swap. Warm desk lamp light. $NIGHT_WARM"

gen 11 "Medium shot. All three men look at a laptop screen with surprised expressions. The screen shows a tracking signal that suddenly stops — a flatline. Warm living room lighting. $NIGHT_WARM"

gen 12 "Close-up of $ZHOU_YQ pushing his glasses up slowly, expression serious and analytical. Warm amber light from the side. Cream sweater. $NIGHT_WARM"

gen 13 "Medium close-up of $ZJ, eyes narrowed in thought, jaw set. An AI chat interface glows faintly on the laptop in front of him. Inner monologue moment. Warm amber lighting. Deep blue shirt. $NIGHT_WARM"

# Beat 3: 星环档案 (书房, 深夜) — WARM desk lamps
gen 14 "Medium shot of a home study/office. $ZHOU_YQ opens a laptop showing organizational charts. Warm desk lamp provides amber light. Bookshelves in background. $NIGHT_WARM"

gen 15 "Close-up of laptop screen showing an organizational hierarchy chart in Chinese — three color-coded factions: blue (技术派), red (军工派), green (商业派). Clean infographic style. Warm screen. $NIGHT_WARM"

gen 16 "Medium shot of $ZHOU_YQ gesturing at the screen explaining the three factions. His thin glasses reflect the chart. $ZJ and $CHEN on either side listening. Warm study room. $NIGHT_WARM"

gen 17 "Medium close-up of $ZJ leaning forward, eyes bright with sudden insight. One finger tapping the table. The moment of strategic realization. Warm amber desk light catches his face. $NIGHT_WARM"

gen 18 "Medium shot. $CHEN shakes his head skeptically, arms crossed, dark hoodie. Behind him the window shows deep blue night sky with city lights. Warm interior. $NIGHT_WARM"

gen 19 "Close-up of a laptop screen showing an AI chat interface — a small glowing blue orb avatar speaks. The message in Chinese offers to help analyze with its core prediction ability. Clean modern UI. Warm reflection. $NIGHT_WARM"

gen 20 "Medium close-up of $ZJ looking at the AI interface on screen with a complex expression — pride mixed with concern. Warm amber sidelight. The screen's blue glow on one side of his face, warm lamp on the other. $NIGHT_WARM"

# Decision 11
gen 21 "Split composition showing three options visualized as paths: Left path glows bright (full activation), middle path is blocked with caution tape (no activation), right path has a measured gate (limited activation). Abstract tech visualization with warm amber tones. Chinese labels for each option. $BRIGHT"

gen 22 "Medium shot. $ZJ holds up three fingers then folds two down to one — choosing the measured approach. Determined but cautious expression. Warm study room background. $NIGHT_WARM"

# Beat 4: 小七的推演 (书房→客厅) — transitioning to dawn
gen 23 "Close-up of laptop screen showing rapid data flow animation — streams of Chinese text, graphs, and network diagrams being processed. A glowing blue AI orb pulses in the corner. Warm screen glow. $NIGHT_WARM"

gen 24 "Medium shot. All three men stare at a laptop showing a prediction timeline. The screen displays a Chinese executive profile with behavioral analysis arrows. Warm desk lamp light. $NIGHT_WARM"

gen 25 "Medium close-up of $CHEN with wide surprised eyes, leaning closer to the screen. Impressed and slightly unnerved. Dark hoodie. Warm amber light. $NIGHT_WARM"

gen 26 "Close-up of laptop screen showing the AI chat with a witty message in Chinese about human behavioral predictability. The blue orb avatar looks smug. Clean UI. $NIGHT_WARM"

gen 27 "Medium close-up of $ZJ caught in the act of touching his left ear — then quickly pulling his hand away. Slightly embarrassed, amused expression. The AI just called him out. Warm light. $NIGHT_WARM"

gen 28 "Medium shot. $ZHOU_YQ stares at the AI prediction results, expression complex — scientific amazement mixed with fatherly concern. His thin glasses pushed up. He realizes his creation has surpassed his design. Warm study light. $NIGHT_WARM"

gen 29 "Close-up side profile of $ZJ. Half warm lamp light, half cool screen glow. Contemplative expression. Looking at the AI screen but eyes distant — thinking about implications. $NIGHT_WARM"

# Beat 5: 反击计划 (客厅, 凌晨→天亮) — BRIGHT dawn
gen 30 "Wide shot of the living room. Dawn light pours through windows — warm golden orange. $ZJ stands at a whiteboard drawing a strategy diagram. $CHEN and $ZHOU_YQ sit at the coffee table surrounded by printed papers and notes. Cream walls glow with morning light. $BRIGHT"

gen 31 "Close-up of the whiteboard showing a three-step strategy diagram drawn in marker — Chinese labels for each step with arrows and connections. Clean strategic visualization. Warm morning light. $BRIGHT"

gen 32 "Medium shot. $ZJ turns from the whiteboard to face the others, marker in hand, commanding presence. Morning sunlight from the window creates a golden rim light behind him. Deep blue shirt. $BRIGHT"

gen 33 "Medium close-up of $CHEN grinning, recognizing the strategy. He makes a gesture like reading a book — referencing the Three Kingdoms analogy. Morning light. Dark hoodie. $BRIGHT"

gen 34 "Medium shot. All three men look toward the laptop screen where the AI interface displays a message. The blue orb avatar looks stunned — it just learned it's been volunteered as a spy. Morning golden light fills the room. $BRIGHT"

gen 35 "Close-up of the AI chat interface showing a humorous message in Chinese about the AI's resume now including 'undercover spy work'. The blue orb avatar has a theatrical dramatic expression. Bright warm screen. $BRIGHT"

# Beat 6: 第一步行动 (咖啡馆/街道, 上午) — BRIGHT
gen 36 "Medium shot. $ZJ in a light grey polo shirt and khaki trousers walks down a bright sunny city street. Confident but casual stride. Modern office buildings, blue sky, warm sunlight. $BRIGHT"

gen 37 "Wide shot of a bright modern coffee shop interior. $ZJ sits across from $FANG at a small table by the window. Sunlight streams through large windows. Warm wood interior, green plants. Two coffee cups on the table. $BRIGHT"

gen 38 "Medium close-up of $FANG — short bob haircut, sharp alert eyes, white blazer. She holds her coffee cup, expression guarded but curious. Bright cafe lighting. $BRIGHT"

gen 39 "Close-up of $ZJ's hands sliding a document folder across the table. The folder has a red CLASSIFIED stamp in Chinese. Bright cafe table, sunlight on the documents. $BRIGHT"

gen 40 "Medium close-up reaction shot of $FANG reading the document. Her expression transforms from skepticism to shock. Eyes widen. White blazer. Bright cafe light. $BRIGHT"

gen 41 "Medium shot. $FANG stands up abruptly from the cafe table. $ZJ remains seated, calm, offering a USB drive. Sunlight between them. The power dynamic is clear — he has the information she needs. $BRIGHT"

# Decision 12
gen 42 "Split close-up of $ZJ's face — one side warm sunlit (the open, trustful option), one side in subtle shadow (the secretive option). At a crossroads of trust. In the bright cafe. $BRIGHT"

gen 43 "Medium shot. $ZJ pockets something (keeping his secret), maintaining a pleasant but guarded smile as $FANG takes the USB drive. Bright cafe. The decision is made — protect the core asset. $BRIGHT"

# Beat 7: 小七的伪装 (陈明家, 下午) — BRIGHT afternoon
gen 44 "Wide shot of the apartment living room bathed in golden afternoon sunlight through sheer curtains. $ZJ, $CHEN, and $ZHOU_YQ work around a desk with multiple screens. Warm, productive atmosphere. $BRIGHT"

gen 45 "Close-up of a screen showing two signal waveforms side by side — one labeled '#2原始信号' and one labeled '小七模拟'. They're almost identical but the simulated one has deliberate imperfections marked with arrows. Warm screen. $BRIGHT"

gen 46 "Medium shot. $CHEN looks amused, watching the AI learn to make deliberate mistakes on screen. Golden afternoon light from the window behind him. $BRIGHT"

gen 47 "Medium shot. $ZJ stands by the window, looking out at the afternoon cityscape. Side profile bathed in warm golden light. Expression: peaceful determination. Light grey polo shirt. The calm before the storm. $BRIGHT"

# Beat 8: 章末悬念
gen 48 "A laptop screen glowing alone in a dark room — everyone is asleep. The AI chat interface shows rapid search results scrolling. The blue orb avatar pulses intensely. On screen: a map with a single glowing pin point and the text '第三个镜子' in Chinese. The location text is obscured by a loading bar at 99%. Deep blue room with only the screen's cool glow. Mysterious and suspenseful. $NIGHT_WARM"

echo "=== COMPLETE ==="
echo "Total: $(ls $OUT_DIR/p*.webp 2>/dev/null | wc -l) panels"
