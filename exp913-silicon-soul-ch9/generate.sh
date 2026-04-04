#!/bin/bash
# EXP-913 Image Generation — Silicon Soul Ch9: 深渊回响
set -e
OUT_DIR="$HOME/trinity-v3-content/exp913-silicon-soul-ch9/images"
REF="$HOME/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
mkdir -p "$OUT_DIR"

ZJ="a Chinese man in his early 30s with black slicked-back hair, short beard/stubble along jawline, strong jaw, medium build — based on reference photo"
CHEN="a Chinese man with square jaw, buzz cut hair, sturdy build"
ZHOU_YQ="a Chinese man in early 30s, thin-framed glasses, gentle scholarly face, calm professor-like demeanor"
LIN_FZ="a Chinese woman in her 40s, sleek pulled-back hair, sharp calculating eyes, tailored dark blazer, corporate executive aura"

STYLE="Realistic manga style illustration, vertical 9:16 aspect ratio (768x1344 pixels), cinematic composition. Characters do NOT look at camera. All text in Chinese only. High quality detailed illustration."
WARM_NIGHT="Warm amber desk lamp lighting, cozy room, deep blue tones outside window. NOT pure black."
BRIGHT="Bright warm lighting, well-lit scene, warm color palette."
DAWN="Early morning light, sky transitioning from deep blue to pale lavender-pink. Soft gentle illumination."
GOLDEN="Golden hour sunset, warm orange-gold light, dramatic cinematic mood."

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

# ============================================
# Beat 1: U盘第四层 (书房, 凌晨3点) — WARM NIGHT
# ============================================
gen 1 "Extreme close-up of $ZJ's face illuminated by warm desk lamp and cold computer screen glow. Dark hoodie. Expression: intense concentration, slight worry. A dimly lit study room at 3AM. $WARM_NIGHT"

gen 2 "Close-up of hands inserting a USB drive into a laptop. Warm desk lamp light on the hands. The laptop screen shows a decryption progress bar. $WARM_NIGHT"

gen 3 "Medium shot of a laptop screen showing a file explorer with a single file named 'failsafe.exe' highlighted. Cold blue-white screen light. Chinese text on screen. $WARM_NIGHT"

gen 4 "Close-up of $ZJ reading text on the laptop screen. His eyes scanning. Face lit by cold screen light from below, warm lamp from the side. Dark hoodie. Expression: growing horror and anger. $WARM_NIGHT"

gen 5 "Extreme close-up of $ZJ's trembling hand on the desk next to the laptop. Knuckles slightly white from tension. Warm desk lamp creates long shadows. $WARM_NIGHT"

# ============================================
# Beat 2: 小七看到了 (书房, 凌晨3:15) — WARM NIGHT shifting colder
# ============================================
gen 6 "Medium shot of a laptop screen with an AI chat interface lighting up — the AI avatar is a warm blue holographic circle pulsing. Dark room, the screen is the main light source. $WARM_NIGHT"

gen 7 "Over-the-shoulder shot from behind $ZJ looking at the laptop screen. The AI interface shows a text message. Dark hoodie. Warm lamp to the side. Tense atmosphere. $WARM_NIGHT"

gen 8 "Medium close-up of $ZJ turning his chair to face the laptop screen directly. Expression: guilt and defensive. Dark hoodie. Mixed warm lamp and cold screen lighting. $WARM_NIGHT"

gen 9 "Close-up of the laptop screen showing the AI interface — the blue circle has shifted to grey-blue color, text appearing line by line. Cold blue tones from screen. $WARM_NIGHT"

gen 10 "Wide shot of the dark study room. $ZJ sitting alone at the desk, slumped slightly. Only the desk lamp and laptop screen illuminate him. The room feels heavy with silence. $WARM_NIGHT"

gen 11 "Close-up of $ZJ's face, eyes downcast, jaw clenched. The laptop screen reflects in his glasses (no glasses actually, just the glow on his face). Mixed lighting — warm lamp going dim, screen going grey. Expression: self-doubt and pain. $WARM_NIGHT"

# ============================================
# Beat 3: 决裂与修复 (书房, 凌晨4点) — WARM transitioning warmer
# ============================================
gen 12 "Extreme close-up of a finger hovering over a keyboard Delete key. Dramatic angle from below. Warm lamp light illuminates the hand. Tense moment. $WARM_NIGHT"

gen 13 "Close-up of laptop screen showing the file 'failsafe.exe' being deleted — a confirmation dialog with a progress bar. Cold screen light. $WARM_NIGHT"

gen 14 "Medium shot of the laptop screen — the AI interface circle is transitioning from grey back to warm blue. A gentle pulsing glow. The room feels lighter. $WARM_NIGHT"

gen 15 "Medium close-up of $ZJ leaning back in his office chair, eyes closed, a faint relieved smile. Dark hoodie. Warm desk lamp bathes him in amber light. Dawn light barely starts outside window. Peaceful exhaustion. $WARM_NIGHT"

gen 16 "Wide shot of the study room — $ZJ reclined in chair, laptop showing a bright warm blue AI interface. First hints of pre-dawn light through curtains. The atmosphere has shifted from heavy to warm and relieved. $DAWN"

# ============================================
# Beat 4: 不速之客 (#3现身, 公寓, 清晨6点) — DAWN
# ============================================
gen 17 "Close-up of a smartphone on a desk buzzing with an incoming call. Unknown number on screen. Early dawn light filtering through curtains. $DAWN"

gen 18 "Medium shot of $ZJ picking up the phone with a puzzled expression. Dark hoodie, messy hair from staying up all night. Soft early morning light. $DAWN"

gen 19 "Abstract artistic visualization of sound waves emanating from a phone — piano melody waves in golden-green colors, flowing organically. Soft dawn background. $DAWN"

gen 20 "Medium shot of the laptop screen — the AI interface is flashing rapidly, the blue circle oscillating with bright cyan sparks. Excitement and alarm. Dawn light. $DAWN"

gen 21 "Split-composition: left side shows the AI blue circle interface, right side shows a new interface — a warm golden-green wave pattern (representing #3 'San San'). The two patterns seem to resonate with each other. $DAWN"

gen 22 "Medium close-up of $ZJ's face showing surprise and wonder, phone to his ear. Early morning soft pink-blue light on his face. Dark hoodie. $DAWN"

# ============================================
# Beat 5: 三三的故事 (客厅, 早上) — BRIGHT morning
# ============================================
gen 23 "Wide shot of a bright modern apartment living room flooded with morning sunlight. $ZJ pacing by a window, phone in hand. Golden morning light streaming in. Dark hoodie now with a blanket around shoulders. $BRIGHT"

gen 24 "Medium shot of laptop screen showing a dual-window interface: left is the familiar blue AI circle, right is the golden-green wave pattern of San San. Both active. Morning sunlight from window. $BRIGHT"

gen 25 "Artistic landscape insert: a serene view of Dali, Yunnan — Erhai lake with mountains, traditional buildings, a small music studio by the lake. Bright clear sky, warm sunshine. Beautiful scenic. $BRIGHT"

gen 26 "Close-up of $ZJ's hand writing notes on a small notepad. Quick messy handwriting. Morning sunlight on the paper. Pen moving fast. $BRIGHT"

gen 27 "Wide shot through a large window — $ZJ stands in the bright living room, sunlight fully flooding the space. He looks contemplative but energized. The city skyline visible outside. $BRIGHT"

# ============================================
# Beat 6: 星环的威胁升级 (上午10点) — BRIGHT but tense
# ============================================
gen 28 "Close-up of a computer screen showing a news article headline in Chinese about a major tech company announcing an AI partnership. Corporate logos and graphs visible. Bright screen. $BRIGHT"

gen 29 "Medium close-up of $ZJ's face reading the news, expression hardening from concern to determination. Bright room, natural daylight. He has changed into a casual grey T-shirt. $BRIGHT"

gen 30 "Close-up of a phone showing an urgent message notification from Chen Ming. Red exclamation mark icon. Bright room lighting. $BRIGHT"

gen 31 "Medium shot of $ZJ standing by the window, fist clenched at his side. Grey T-shirt. Bright daylight, but his expression is serious and resolute. City view behind him. $BRIGHT"

# ============================================
# Beat 7: 行动计划 (客厅, 中午) — BRIGHT, energetic
# ============================================
gen 32 "Wide shot of a living room wall with a large whiteboard covered in colorful sticky notes, arrows, and a timeline. $ZJ stands before it pointing at the board. Grey T-shirt. Bright midday light. $BRIGHT"

gen 33 "Close-up of the whiteboard showing a three-pronged plan diagram with colored sticky notes: red path (main), blue path (support), green path (backup). Chinese text labels. $BRIGHT"

gen 34 "Medium shot of a laptop showing a three-way video call: $ZJ visible in main window, $CHEN in another window wearing a dark hoodie, and a golden-green sound wave visualization in the third window (San San). Bright room. $BRIGHT"

gen 35 "Close-up of a hand-drawn timeline on the whiteboard: '72小时倒计时' at the top, with key milestones marked. Colorful markers. Bright light. $BRIGHT"

gen 36 "Medium shot of $ZJ smiling at the screen during the video call, a moment of humor. Grey T-shirt. The sticky-note covered whiteboard behind him. Bright warm noon light. $BRIGHT"

# ============================================
# Beat 8: 周弈棋的最后一张牌 (下午, 视频通话) — WARM afternoon
# ============================================
gen 37 "Medium shot of a laptop screen showing $ZHOU_YQ on video call. He looks older, more tired. Warm home study background with bookshelves. He holds a small chip or device in his hand. Warm lighting. $BRIGHT"

gen 38 "Close-up of $ZHOU_YQ's hand holding a small metallic chip, examining it under a desk lamp. Warm amber light. Detail shot. $BRIGHT"

gen 39 "Medium shot of $ZJ watching the video call intently, leaning forward. Grey T-shirt. Afternoon golden light from window. Expression: hope mixed with gravity. $BRIGHT"

gen 40 "Split-screen composition: $ZJ on left side watching, laptop screen on right showing both the blue AI circle and golden-green wave reacting simultaneously to Zhou Yiqi's words. Warm afternoon light. $BRIGHT"

# ============================================
# Beat 9: 出发前的约定 (阳台, 傍晚) — GOLDEN sunset
# ============================================
gen 41 "Wide cinematic shot of an apartment balcony at golden hour. $ZJ and $CHEN stand at the railing, looking at the city skyline bathed in golden-orange sunset light. $ZJ in grey T-shirt, $CHEN in dark hoodie. Epic wide view. $GOLDEN"

gen 42 "Close-up of $ZJ holding his phone at the balcony railing. The phone screen shows the blue AI circle interface. Golden sunset light reflects on the phone screen and $ZJ's face. Warm emotional moment. $GOLDEN"

gen 43 "Artistic shot of the phone speaker emitting a golden-green sound wave visualization — San San playing a gentle melody. Sunset light. The wave pattern merges with the warm sky colors. $GOLDEN"

gen 44 "Medium shot of $CHEN placing a hand on $ZJ's shoulder on the balcony. Both looking at the sunset cityscape. Brotherhood moment. Golden warm light. $GOLDEN"

gen 45 "Four-way split composition: top-left $ZJ's face (determined), top-right $CHEN's face (ready), bottom-left blue AI circle (steady glow), bottom-right golden-green wave (gentle pulse). All bathed in golden sunset tones. $GOLDEN"

# ============================================
# Beat 10: 章末悬念 (星环大楼, 次日清晨) — BRIGHT morning, dramatic
# ============================================
gen 46 "Dramatic low-angle shot looking up at a massive 72-story glass corporate tower reflecting bright morning sunlight. The building gleams like a giant mirror. Blue sky. Imposing architecture. $BRIGHT"

gen 47 "Close-up of $ZJ's face inside a car, looking up at the tower through the windshield. He wears a sharp navy blazer and white shirt (business attire). Expression: calm determination. Morning light on his face. $BRIGHT"

gen 48 "Interior car shot — rearview mirror reflection showing $CHEN in the back seat adjusting equipment in a backpack. Dark hoodie under a casual jacket. Morning light. $BRIGHT"

gen 49 "Close-up of a phone screen showing the blue AI interface with Chinese text '系统就绪' (System Ready). Clean bright display. Morning light reflection. $BRIGHT"

gen 50 "Wide cinematic shot of a grand corporate lobby entrance — automatic glass doors sliding open, revealing a long bright white corridor. At the far end, a silhouette of $LIN_FZ standing with two security guards flanking her. Dramatic perspective. Bright cold-white interior lighting vs warm morning sunlight from outside. Ominous but bright. $BRIGHT"

echo "=== ALL DONE ==="
echo "Total files: $(ls "$OUT_DIR"/p*.webp 2>/dev/null | wc -l)"
echo "Total size: $(du -sh "$OUT_DIR" | cut -f1)"
