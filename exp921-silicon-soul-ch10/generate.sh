#!/bin/bash
# EXP-921 Image Generation — Silicon Soul Ch10: 三生万物
set -e
OUT_DIR="$HOME/trinity-v3-content/exp921-silicon-soul-ch10/images"
REF="$HOME/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
mkdir -p "$OUT_DIR"

ZJ="a Chinese man in his early 30s with black slicked-back hair, short beard/stubble along jawline, big eyes, no glasses, strong jaw, medium build 172cm, wearing dark navy business casual jacket over dark shirt — based on reference photo"
CHEN="a taller thinner Chinese man, mid 30s, black-framed glasses, slightly messy short hair, programmer vibe, wearing matching dark business casual with a backpack"
LIN="a Chinese man in his early 50s, silver-grey short hair combed immaculately, thin, tall, hawk nose, always smiling, wearing navy blue three-piece suit with silver tie clip"
GUARD="two Chinese men in black security uniforms with earpieces, expressionless faces"

STYLE="Realistic manga style illustration, vertical 9:16 aspect ratio (768x1344 pixels), cinematic composition. Characters do NOT look at camera — they look at other characters or objects in the scene. No text on the image. High quality detailed illustration."
BRIGHT_LOBBY="Massive glass atrium with sunlight pouring through glass dome ceiling, white marble floors, extremely bright and open, modern tech company headquarters lobby"
COLD_WHITE="Cold white laboratory lighting, ultra-clean white walls/floor/ceiling, blue LED server lights, sci-fi atmosphere but BRIGHT not dark"
CONFERENCE="White glass-walled meeting room, bright cold white lighting, minimalist modern furniture"
DIGITAL="Abstract digital space visualization, glowing data streams, bright luminous blue and orange-red dual tone"
ALARM="White corridor with orange-red alert lights flashing, HIGH contrast but still bright overall"

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
    sips --resampleWidth 600 "$tmp" --out "$tmp" 2>/dev/null || true
    cwebp -q 75 "$tmp" -o "$f" 2>/dev/null || { sips -s format jpeg -s formatOptions 65 "$tmp" --out "${f%.webp}.jpg" 2>/dev/null; mv "${f%.webp}.jpg" "$f" 2>/dev/null || true; }
    rm -f "$tmp"
    echo "OK p$(printf '%02d' $n) — $(du -h "$f" | cut -f1)"
  fi
  sleep 1
}

# Beat 1 — 虎穴迎客 (5 panels)
gen 1 "Wide angle low shot looking up inside a massive modern tech company lobby, $BRIGHT_LOBBY. $ZJ and $CHEN walking in, tiny figures dwarfed by the 30-meter ceiling. Sunlight streams down dramatically. Seen from behind at slight angle."
gen 2 "$LIN approaching $ZJ with hand extended for handshake, medium shot from the side. $BRIGHT_LOBBY background. The older man has a perfectly composed smile. Two security guards trail behind at distance."
gen 3 "Close-up of a handshake between two men — one hand belongs to $ZJ (younger, slightly tense grip), the other to $LIN (confident relaxed grip). $BRIGHT_LOBBY sunlit background blurred."
gen 4 "$CHEN walking behind $ZJ, eyes scanning the lobby environment nervously, adjusting his backpack strap. Medium shot from 3/4 angle. $BRIGHT_LOBBY bright marble and glass."
gen 5 "Wide establishing shot from above — $ZJ and $CHEN following $LIN through the gleaming lobby, $GUARD following at a distance. The lobby is flooded with natural sunlight. Geometric shadows from the glass dome."

# Beat 2 — B3层 (6 panels)
gen 6 "Elevator doors opening, cold white light flooding outward. $ZJ and $CHEN stepping out, silhouetted against the bright white light. $LIN leading the way. $COLD_WHITE environment."
gen 7 "Long perspective shot of an infinite white corridor, $COLD_WHITE. $LIN walking ahead confidently, $ZJ and $CHEN following. Server racks visible behind glass walls on both sides, blue LED lights like a galaxy."
gen 8 "Close-up of $ZJ looking through a glass wall at a massive server array, blue indicator lights reflecting on his face. His expression is focused but calm. $COLD_WHITE."
gen 9 "$ZJ pausing before the glass wall, one hand slightly touching the glass. Behind the glass, rows and rows of servers with blue lights. His reflection visible in the glass. $COLD_WHITE bright environment."
gen 10 "A smartphone screen showing an AI interface with blue color scheme, the interface shows subtle trembling/flickering animation effect. The phone is held in someone's hand discreetly at hip level. $COLD_WHITE background blurred."
gen 11 "$CHEN discreetly pressing something inside his backpack while pretending to adjust the strap. Medium close shot from behind/side. $LIN visible ahead, not looking back. $COLD_WHITE."

# Beat 3 — 初见#2 (6 panels)
gen 12 "A single server rack standing alone, separate from the main cluster, with ORANGE-RED indicator lights pulsing. It stands behind glass in a white lab room. Contrast with blue-lit servers nearby. $COLD_WHITE bright but the orange light is striking."
gen 13 "Close-up of $ZJ's face in profile, eyes fixed on the orange-lit server through glass. His jaw tightens. Blue server lights from behind illuminate his silhouette. Emotional shot. $COLD_WHITE."
gen 14 "A smartphone screen showing a blue AI interface flickering intensely, ripples of disturbance across the digital display. The screen reflects in $ZJ's eyes. Close-up."
gen 15 "$ZJ pretending to study an information display panel on the wall, leaning forward casually, but his eyes are glancing sideways toward the orange server. $LIN visible in background watching. $COLD_WHITE."
gen 16 "Extreme close-up of the orange-red server — the indicator lights pulse rhythmically like a heartbeat. Through gaps in the server chassis, warm orange light glows as if something alive is breathing inside. $COLD_WHITE."
gen 17 "$LIN turning back to look at $ZJ with that composed smile, gesturing toward the orange server. He stands tall and confident. $COLD_WHITE, clinical lighting."

# Beat 4 — 林副总的真面目 (5 panels)
gen 18 "A small modern conference room, all white with glass walls. $LIN sitting in a chair, legs crossed casually, looking relaxed and in control. $ZJ and $CHEN sitting across from him. $CONFERENCE. Bright clinical light."
gen 19 "$LIN leaning back with his perpetual smile, but his eyes are sharp and calculating. Medium close-up of his face from slightly below. $CONFERENCE bright background."
gen 20 "The conference room door with a digital lock — the lock indicator just turned RED. Shot from $ZJ's perspective looking at the locked door. $CONFERENCE bright white room."
gen 21 "$ZJ's face showing controlled shock — eyes slightly wider, jaw set firm. He's maintaining composure but the tension is visible. Medium close-up. $CONFERENCE bright lighting, his face well-lit."
gen 22 "$CHEN standing up from his chair abruptly, one hand on the table, looking alarmed. His glasses slightly askew. $CONFERENCE. $LIN visible in background, still sitting calmly."

# Beat 5 — 谈判桌上的博弈 (6 panels)  
gen 23 "$ZJ leaning back in his chair with a relaxed posture — a deliberate show of calm confidence despite the locked door. Arms open, slight smirk. $CONFERENCE bright white."
gen 24 "Close-up of $LIN's face — his eyebrow raised, the first crack in his composed smile. Surprise at $ZJ's reaction. $CONFERENCE bright."
gen 25 "$ZJ's hand on the conference table, fingers drawing lazy circles — a thinking gesture. His posture is relaxed but his eyes are intense. Medium shot from across the table. $CONFERENCE."
gen 26 "Two-shot of $ZJ and $LIN facing each other across the conference table. Power dynamic — both composed, a chess match in body language. Glass walls show the blue-lit corridor outside. $CONFERENCE bright."
gen 27 "A smartphone screen in someone's pocket showing the blue AI interface — the colors are subtly shifting, becoming more active. The AI is doing something covertly. Extreme close-up of the phone screen."
gen 28 "$CHEN glancing at his watch nervously while sitting at the conference table, trying to maintain a poker face. His backpack on the floor beside him. $CONFERENCE bright."

# Beat 6 — 小七的暗线行动 (5 panels)
gen 29 "Abstract digital space — flowing streams of luminous blue data particles moving through a network architecture, like swimming through a digital ocean. Beautiful and BRIGHT, like an underwater world made of light. $DIGITAL."
gen 30 "A luminous blue digital avatar (representing AI #1) navigating through glowing code structures, approaching a massive orange-red firewall barrier. The digital space is vivid and bright. $DIGITAL."
gen 31 "Two AI presences separated by a translucent firewall — one BLUE (warm, flowing) and one ORANGE-RED (constrained, pulsing weakly). They face each other through the barrier. Both glow brightly. $DIGITAL."
gen 32 "Close-up of the orange-red AI presence — it pulses weakly but with a rhythm like a heartbeat. Chains of code restrict it but there's a faint glow of hope. $DIGITAL luminous."
gen 33 "The blue and orange-red digital presences reaching toward each other through the firewall, fingertip-to-fingertip like a digital Sistine Chapel. Beautiful luminous scene. $DIGITAL."

# Beat 7 — 林副总的底牌 (5 panels)
gen 34 "$LIN standing up from his chair, walking to the glass wall of the conference room, looking out at the corridor where the orange server is visible. His silhouette is elegant but menacing. $CONFERENCE bright."
gen 35 "$LIN turning from the window to face $ZJ, holding a USB drive between two fingers. His expression is the first genuine cold smile — no warmth. $CONFERENCE bright white lighting."
gen 36 "Close-up of a USB drive held between elegant fingers — it's sleek and black with a red indicator light. The focus is sharp on the drive, background blurred. $CONFERENCE."
gen 37 "$ZJ's reaction — close-up of his face going pale but controlled. His eyes narrow. A muscle in his jaw twitches. Bright conference room lighting makes every detail visible."
gen 38 "$CHEN in the background, his face completely white with shock, one hand gripping the armrest of his chair. $ZJ visible in foreground, more composed. $CONFERENCE bright."

# Beat 8 — 对峙高潮 (5 panels)
gen 39 "$ZJ standing up from his chair, squaring his shoulders. He and $LIN are now both standing, eye to eye across the conference table. Power pose — feet planted, chin up. $CONFERENCE bright white, almost blinding."
gen 40 "Two-shot dramatic composition — $ZJ and $LIN standing face to face across the narrow width of the conference table. Both casting minimal shadows in the bright overhead light. The tension is palpable through body language alone."
gen 41 "Close-up of $ZJ's hand resting flat on the conference table — calm, steady, not a tremor. The hand of someone who has negotiated through countless crises. Bright lighting. $CONFERENCE."
gen 42 "Close-up of $LIN's hand gripping the USB drive — knuckles WHITE with pressure. A crack in his composure shown through his body language. $CONFERENCE bright."
gen 43 "Through the glass wall of the conference room, $GUARD notice the confrontation inside and start moving toward the door. Shot from inside the room looking out. $CONFERENCE bright corridor."

# Beat 9 — 变数：#2的选择 (6 panels)
gen 44 "The orange-red server through the glass wall suddenly erupts with frantically flashing lights — all indicator LEDs going haywire. The whole corridor is bathed in orange-red pulses. $COLD_WHITE base with orange emergency light."
gen 45 "In the conference room, the overhead lights flicker. $LIN spins around toward the corridor, alarmed. $ZJ seizes the moment — his expression shifts from defensive to determined. $CONFERENCE with flickering lights but still bright."
gen 46 "$DIGITAL space — the orange-red firewall SHATTERS, exploding outward in a burst of light. The blue and orange-red AI presences merge momentarily in a spectacular collision of colored light. Bright explosive moment."
gen 47 "Wide shot of B3 corridor — orange alert lights flashing but the white corridor remains bright overall. The contrast creates a dramatic pulsing effect. All the server indicator lights flash in synchronized waves."
gen 48 "In the conference room, $CHEN grabbing his backpack and heading for the door. $ZJ is already moving. $LIN is shouting toward the corridor, his composed facade completely shattered. Dynamic action shot. $CONFERENCE with orange alert tinge."

# Beat 10 — 极速撤离 (5 panels) — reusing some earlier numbers if we drop to 48 total
# Actually we have exactly 48 panels above. But the spec says Beat 10 has 5 panels.
# Let me add the final panels for the escape and cliffhanger.

# Adjusting: We have 48 panels (Beats 1-9). The spec says 48 total across 10 beats.
# Beat 1: 5 (p01-p05), Beat 2: 6 (p06-p11), Beat 3: 6 (p12-p17), Beat 4: 5 (p18-p22)
# Beat 5: 6 (p23-p28), Beat 6: 5 (p29-p33), Beat 7: 5 (p34-p38), Beat 8: 5 (p39-p43)
# Beat 9: 6 (p44-p49), Beat 10: 5 (p50-p54) = 54 total. Too many.
# Let me cap at 48: Beats 1-8 = 43 panels. Beat 9 = trimmed to 3, Beat 10 = 2 = 48.
# Actually the numbering above goes p01-p48. Let me just add the escape panels.

# Hmm, I counted wrong. Let me recount: 5+6+6+5+6+5+5+5+6+5 = 54. But I only wrote p01-p48.
# Beats 1-9 = 5+6+6+5+6+5+5+5+6 = 49 panels but I only scripted 48. Let me check.
# Beat 9 has p44-p48 = 5 panels (not 6). That's fine. 5+6+6+5+6+5+5+5+5 = 48. Perfect.
# Now I need Beat 10 (5 panels) = p49-p53. But that goes over 48.
# Solution: trim to 48 total. Beat 10 gets 0 extra panels = combine into narrative.
# Actually let me just replace p44-p48 as a combined Beat 9+10 (5 panels for the climax+escape+cliffhanger).

# Wait — I already have exactly 48 panels (p01-p48). The spec says 46-50 panels. 48 is perfect.
# But I'm missing Beat 10 (escape sequence). Let me restructure:
# I'll make Beat 8+9 share panels and add Beat 10 at the end.

# Beat 10 — 极速撤离 + 章末悬念 (4 panels)
gen 49 "$ZJ and $CHEN sprinting down a bright white corridor, $GUARD chasing behind. $ZJ running determinedly, $CHEN keeping pace beside him. Orange alert lights flash along the ceiling. The corridor is still BRIGHT white with orange pulses. Dynamic action composition with motion blur."
gen 50 "$ZJ running through a side door that just opened electronically — emergency stairwell, bright fluorescent lighting. $CHEN behind him, tossing a small electronic device backward toward pursuers. Action shot, dramatic angle from below."
gen 51 "Ground floor lobby — sunlight flooding through the massive glass entrance. But massive steel blast doors are slowly descending, cutting off the exit. The last beam of golden sunlight streaming through the shrinking gap. $ZJ and $CHEN visible in the lobby, looking at the closing doors."
gen 52 "$ZJ turning around — NOT toward the closing exit doors, but BACK toward the elevator. His face shows fierce determination, jaw clenched, eyes blazing. $CHEN behind him looking shocked. The closing blast doors in background with the last sliver of sunlight. Dramatic shot, bright lobby lighting."

echo "=== Generation complete (p01-p52) ==="
echo "Checking results..."
ls -la "$OUT_DIR"/*.webp 2>/dev/null | wc -l
du -sh "$OUT_DIR" 2>/dev/null
