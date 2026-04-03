#!/bin/bash
# EXP-887 Image Generation — 重启日 Ch1 (Time Loop × Startup)
set -e
OUT_DIR="$HOME/trinity-v3-content/exp887-time-loop-restart-ch1/images"
REF_PHOTO="$HOME/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
mkdir -p "$OUT_DIR"

# Character constants
ZJ="a Chinese man in his early 30s with black slicked-back hair, short stubble beard along jawline, strong jaw, medium build, big expressive eyes — based on the reference photo"
ZHAO="a Chinese woman in her mid-40s, short bob haircut, no smile, sharp cold eyes, wearing grey professional suit, intimidating presence"
XIAOWANG="a young Chinese woman in her early 20s, ponytail hair, round face, cheerful, wearing office uniform with company lanyard"
CHENMING="a Chinese man in his mid-30s, square jaw, buzz cut, wearing casual button-up shirt, dependable look"
XIAOQI="a phone screen showing a cute AI assistant interface with chat bubbles"

STYLE="Realistic manga style illustration, vertical 9:16 aspect ratio (768x1344 pixels), cinematic composition with dramatic lighting. Characters do NOT look at camera — eyes look at other characters or objects within the scene. All text in image must be in Chinese only. High quality detailed illustration."

generate() {
  local panel=$1
  local prompt=$2
  local outfile="$OUT_DIR/panel-$(printf '%02d' $panel).jpg"
  
  if [ -f "$outfile" ]; then
    echo "SKIP panel-$(printf '%02d' $panel) (exists)"
    return 0
  fi
  
  echo "=== Generating panel $panel ==="
  
  gemini --model gemini-2.0-flash-preview-image-generation \
    --output-file "$outfile" \
    "Generate a vertical (9:16 ratio, 768x1344 pixels) illustration. $prompt $STYLE" \
    2>&1 || {
    echo "FAILED panel $panel, retrying..."
    sleep 3
    gemini --model gemini-2.0-flash-preview-image-generation \
      --output-file "$outfile" \
      "Generate a vertical (9:16 ratio, 768x1344 pixels) illustration. $prompt $STYLE" \
      2>&1 || echo "FAILED panel $panel after retry"
  }
  
  if [ -f "$outfile" ]; then
    sips -s format jpeg -s formatOptions 75 --resampleWidth 800 "$outfile" --out "$outfile" 2>/dev/null || true
    echo "OK panel-$(printf '%02d' $panel) — $(du -h "$outfile" | cut -f1)"
  fi
  
  sleep 1
}

# === BEAT 1: 闹钟 7:00 (3 panels) ===
# Normal color temperature for Loop 1

generate 1 "Close-up overhead shot of a phone screen showing alarm clock at 7:00 with date 2026年4月15日, on a messy bedside table with an empty coffee mug and crumpled notes. Morning light filtering through curtains. The phone screen is the brightest element."

generate 2 "Medium shot from bathroom mirror angle. $ZJ standing in front of bathroom mirror in a white T-shirt, brushing teeth sleepily, extreme dark circles under his eyes. His reflection shows messy bed hair. Morning sunlight through a small window. Expression: exhausted, eyes half-closed."

generate 3 "Full body shot from hallway angle. $ZJ walking toward apartment door, now wearing a sharp deep blue suit with white dress shirt, adjusting his tie. Phone in other hand showing a notification bubble. His apartment behind him — small but neat. Expression: determined but tired."

# === BEAT 2: 前台小王的咖啡 (3 panels) ===

generate 4 "Wide shot of modern startup company lobby. $ZJ walking in through glass doors in deep blue suit. $XIAOWANG walking across the lobby carrying a cup of coffee. Motion blur suggests she is turning around. Clean modern office with plants and company logo wall. Morning bustle."

generate 5 "Dynamic action shot — close-up of coffee cup mid-air, liquid splashing onto a deep blue suit jacket. $XIAOWANG's hands reaching out in panic. Coffee drops frozen in time like slow motion. Dramatic angle from below. The coffee stain spreading on the suit fabric."

generate 6 "Medium two-shot. $ZJ looking down at coffee stain on his suit with a forced smile, one hand raised saying 'it's fine'. $XIAOWANG bowing apologetically, face red with embarrassment. Office workers in blurred background glancing over."

# === BEAT 3: 陈明的电话 (2 panels) ===

generate 7 "Medium shot of $ZJ at his desk, now wearing a grey business shirt (changed from ruined suit), holding phone to ear with pinched expression. Computer screen shows a PPT presentation with charts. Clock on wall shows 9:47. Expression: guilty — he forgot to update the data."

generate 8 "Close-up of computer screen showing PPT page 12 with a financial chart, $ZJ's fingers frantically typing on keyboard. His phone lies face-up on desk showing caller 'CHENMING' with call timer running. Sweat drops on his forehead — rushing to fix data."

# === BEAT 4: 路演 (5 panels) ===

generate 9 "Wide establishing shot of a sleek meeting room with glass walls. $ZJ standing at one end next to a large screen showing his presentation. Across the long table sits $ZHAO with arms crossed, poker-faced. Two other investors sit beside her taking notes. Dramatic lighting from overhead. Tension in the air."

generate 10 "Medium shot of $ZJ presenting confidently, gesturing at the screen behind him showing growth charts. His grey shirt looks professional. Expression: animated, engaging, in his element. The screen shows page 8 of the presentation."

generate 11 "Close-up of $ZHAO raising one hand to interrupt. Her expression is completely neutral — cold, calculating. The gesture is minimal but commanding. Everyone else in the room freezes. Dramatic side-lighting emphasizes her sharp features."

generate 12 "Extreme close-up of $ZHAO's lips and chin as she speaks. Her mouth forms words. Background blurred. The focus is entirely on the weight of her question. Cinematic shallow depth of field."

generate 13 "Medium shot of $ZJ frozen mid-gesture, mouth slightly open, eyes wide. The presentation screen behind him is blurred. His hands hover in the air — he had an answer ready but it won't come out. A visible swallow. Long dramatic pause captured in one frame. Expression: stunned, vulnerable."

# === BEAT 5: 失败回家 (2 panels) ===

generate 14 "Wide overhead shot of $ZJ lying on his back on a bed in a small apartment, still in grey shirt but loosened, staring at ceiling. Room is dim with only phone screen glow. Empty instant noodle cup on bedside table. His body language: defeated, spread-eagled. Evening city lights through window."

generate 15 "Close-up of phone screen in $ZJ's hand, showing an AI chat interface. Message from 小七: '今日复盘：路演失败。关键断点：第8页后赵姐的提问。建议：准备真实答案。精力值：23/100'. The energy bar is nearly depleted, showing red."

# === BEAT 6: 闹钟7:00...又来了 (5 panels) ===
# Slightly warmer color tone for Loop 2

generate 16 "Close-up of phone screen alarm going off at 7:00 — same date 2026年4月15日. But this time shot from $ZJ's POV as his hand reaches for the phone. Morning light identical to panel 1. Eerie déjà vu atmosphere with a subtle warm color shift."

generate 17 "Medium shot of $ZJ sitting up in bed, same white T-shirt, same messy hair, same dark circles — looking at his phone with a confused frown. He's rubbing his eyes. Expression: puzzled, something feels wrong but he can't place it. Warm morning light."

generate 18 "Dynamic shot — same lobby, same angle as panel 5. $XIAOWANG turns with coffee, but this time we see it from $ZJ's perspective — he's watching the cup arc toward him in slow-motion horror. His face shows recognition — 'this happened before'. Coffee about to hit the EXACT same spot on his deep blue suit."

generate 19 "Close-up of $ZJ's face, eyes widening in shock as coffee hits his suit again. His expression transitions from surprise to a creepy realization. Background blurred. His pupils dilated. Goosebumps visible. Expression: spine-tingling déjà vu."

generate 20 "Split composition — left side: $ZJ holding phone to ear, same grey shirt, same desk, clock shows 9:47. Right side: the caller ID showing '陈明' with the exact same call. $ZJ's expression: terrified recognition. His hand gripping the phone tightly, knuckles white."

# === BEAT 7: 确认循环 (4 panels) ===

generate 21 "Same meeting room as panel 9, same setup, same people in same positions. $ZHAO in the same pose with arms crossed. But $ZJ's expression is completely different — instead of confident presenter, he looks like a man who's seen a ghost. He KNOWS what she's about to say."

generate 22 "Close-up profile shot of $ZJ's face as $ZHAO speaks off-screen. His eye twitches. A thin smile forms on his lips — not happy, but the smile of a programmer who just found the bug. Background: the meeting room walls seem to ripple slightly. Expression: the shift from fear to curiosity."

generate 23 "Medium shot of $ZJ walking out of the meeting room into an empty hallway, loosening his shirt collar. He's leaning against the wall, looking up at the ceiling. His face shows the transformation: from panic to the excitement of a problem to solve. One hand on chin, thinking pose."

generate 24 "Creative visualization shot: $ZJ's silhouette against a dark background with lines of code floating around him like Matrix-style rain, but in Chinese. Center text element shows: while True: live_same_day(). The code is green against dark blue. His posture is confident now, hands in pockets."

# === BEAT 8: Loop 3-4 蒙太奇 (6 panels, fast cuts) ===

generate 25 "Split panel montage style — 4 small frames in one image. Top-left: $ZJ in casual sporty outfit (blue hoodie + jeans) presenting with exaggerated gestures. Top-right: $ZHAO with identical poker face. Bottom-left: PPT showing different first slide. Bottom-right: clock showing different times. Quick-cut feeling with speed lines between frames."

generate 26 "Comic action shot of $ZJ standing on the meeting room table singing dramatically, arms spread wide, mouth open. He's wearing a vintage leather jacket and ripped jeans (testing different approach). $ZHAO's eyebrow is slightly raised — ONE TINY CHANGE in her expression. The other investors look shocked."

generate 27 "Close-up of $ZHAO's face compared between loops. Left half: her usual poker face (normal). Right half: a microscopic frown/wrinkle between her eyebrows (reaction to singing). The difference is subtle but $ZJ caught it. Split-screen comparison style."

generate 28 "Dynamic action shot in the lobby. $ZJ sidestepping $XIAOWANG's coffee with Matrix-style lean-back move. Coffee flying past his suit in slow motion. $XIAOWANG's face: pure shock. $ZJ's face: confident smirk. Speed lines and motion blur emphasize the dodge."

generate 29 "Next loop lobby scene. $ZJ casually reaching out one hand to CATCH the coffee cup mid-air before it spills. $XIAOWANG's jaw drops. He takes a sip from the caught cup with a smooth expression. Comedy moment captured perfectly."

generate 30 "Creative panel: A notebook page filling the frame, showing handwritten debug log in Chinese. Title: '循环DEBUG日志'. Entries: '[Loop 3] 穿休闲装+用段子开场 = 失败 @ 第8页', '[Loop 4] 唱歌 = 赵姐皱眉 (新变量!)'. Arrows and circles connecting the entries. $ZJ's hand holding a pen, coffee cup ring stains on paper."

# === BEAT 9: Loop 5 程序员思维全开 (5 panels) ===
# Cooler color tone — analysis mode

generate 31 "Wide shot of $ZJ sitting cross-legged on his bed in white T-shirt and shorts, surrounded by notebooks, sticky notes, and his laptop. He's in full analysis mode — papers spread everywhere with diagrams and arrows. Cool blue lighting from laptop. Expression: intense focus, programmer in the zone."

generate 32 "Close-up of a hand-drawn flowchart on paper. The chart shows: '7:00起床' → '小王咖啡' → '9:47陈明电话' → '路演第8页' → '赵姐提问' (circled in red multiple times) → '失败' → '回家' → '闹钟' → loops back. The breakpoint at '赵姐提问' is highlighted with arrows. $ZJ's finger pointing at it."

generate 33 "Medium shot of $ZJ's phone showing chat with 小七. The AI message reads: '经过5次循环数据分析，断点(breakpoint)在赵姐的问题。但这个问题测试的不是你的商业计划——是你自己。' $ZJ's face reflected in the phone screen, expression: revelation dawning."

generate 34 "Close-up of $ZJ looking up from his phone, eyes wide with understanding. His face is half-lit by phone glow, half in shadow. The realization hits: the answer isn't in the data or the pitch — it's in himself. Expression: vulnerability mixed with courage."

# === DECISION-1 panel ===

generate 35 "Creative composition: $ZJ in the meeting room for the 5th time, standing at the presentation screen. Three ghost-like afterimages of himself behind him represent previous loops. $ZHAO across the table asking her question. $ZJ's current expression is calm and resolute — different from all previous loops. The air between them crackles with tension. Cool-to-warm color transition."

# === BEAT 10: 悬念结尾 (4 panels) ===

generate 36 "Medium shot across the table. $ZJ speaks from the heart — no slides, no gestures, just raw honesty. His body language is open, palms up. $ZHAO leans forward slightly for the first time in any loop. Her expression: genuinely shocked, eyes widened. This is THE moment."

generate 37 "Extreme close-up of $ZHAO's face. For the first time, her poker face CRACKS. Her eyes widen, lips part slightly as if about to speak. Something has changed. This is the most dramatic single panel — pure emotion on a face we've only seen cold."

generate 38 "Dramatic close-up of phone alarm going off again — but the time reads 7:01 (one minute later than every other loop). The date still shows 2026年4月15日. The extra minute is circled/highlighted with a glow effect. $ZJ's fingers holding the phone, visible excitement."

generate 39 "Final panel — close-up of $ZJ lying in bed, looking at his phone showing 7:01. A slow smile spreads across his face. His eyes are bright and alive — no more exhaustion. The energy bar on screen shows glitching numbers ??/100 with digital artifacts. Morning light is slightly warmer/brighter than every previous loop. Expression: hope, the thrill of cracking the code."

echo ""
echo "=== Generation complete! ==="
echo "Total panels: $(ls -1 "$OUT_DIR"/panel-*.jpg 2>/dev/null | wc -l)/39"
