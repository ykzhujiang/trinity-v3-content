#!/bin/bash
# EXP-768 《无限重启》Frame Generation Script
# All frames 9:16 portrait, semi-realistic manga style
set -e

DIR="$(cd "$(dirname "$0")" && pwd)/images"
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"

gen() {
  local fname="$1"
  local prompt="$2"
  if [ -f "$DIR/$fname" ]; then
    echo "SKIP: $fname exists"
    return
  fi
  echo "GEN: $fname"
  cd "$DIR" && uv run "$SCRIPT" --prompt "$prompt" --filename "$fname" --resolution 1K 2>&1 | tail -2
}

# Common character descriptions
ZJ="A Chinese man early 30s, black hair slicked back, stubble beard, big eyes, athletic-stocky build (172cm 80kg, broad shoulders, narrow waist, muscular arms, NOT overweight, flat stomach)"
ZJ_SUIT="$ZJ, wearing dark blue business casual suit with white shirt no tie"
ZJ_GRAY="$ZJ, wearing gray T-shirt and sweatpants"
ZJ_HOODIE="$ZJ, wearing black hoodie and jeans"
ZJ_BLACK="$ZJ, wearing all-black suit with black shirt, commanding presence"
LINWEI="A Chinese woman early 30s, short neat hair, round face, rimless glasses, slim narrow shoulders"
ZHAO="A Chinese man 50s, salt-and-pepper hair, tall thin, hawk nose, dark suit, intimidating aura"
CHEN="A young Chinese man 25, thin small frame, big black-framed glasses, holding tablet, nervous"
STYLE="Semi-realistic manga style, detailed shading and cinematic lighting, portrait 9:16 aspect ratio"
NOCAM="Characters NOT looking at camera, eyes directed at other characters or objects in scene"

# === LOOP 1: Normal Day (frames 1-6) ===
# Frame 1 already generated

gen "frame-02-mirror-confidence.png" "$STYLE. $ZJ_GRAY looking at himself in bathroom mirror, adjusting his hair, confident smirk. Steam from shower visible. Medium shot from behind showing his reflection. Morning warm light. $NOCAM"

gen "frame-03-car-ride.png" "$STYLE. $ZJ_SUIT sitting in back seat of a car, looking out window at modern city skyline with glass skyscrapers. His face reflected in window glass. Side profile view. Bright daylight, optimistic mood. $NOCAM"

gen "frame-04-meeting-room.png" "$STYLE. Wide establishing shot of a luxurious glass-walled meeting room on high floor. $ZJ_SUIT standing at one end of long table, $ZHAO sitting at other end flanked by two assistants. Tense atmosphere. Cold blue-white fluorescent lighting. City skyline visible through floor-to-ceiling windows. $NOCAM"

gen "frame-05-document-slam.png" "$STYLE. Close-up dramatic shot: $ZHAO sliding a manila folder across the polished conference table toward camera. His hand bony with a gold ring. His expression cold and calculating. Shallow depth of field, the folder in sharp focus. Dark dramatic lighting. $NOCAM"

gen "frame-06-angry-exit.png" "$STYLE. $ZJ_SUIT storming out of glass conference room doors, fists clenched, jaw tight with anger. Shot from inside the room looking out, $ZHAO visible in background with a slight smirk. Dramatic lighting contrast - bright hallway vs dark room. $NOCAM"

# === LOOP 1 DEATH: Car accident + reset ===
gen "frame-07-car-impact.png" "$STYLE. Dramatic low-angle shot: $ZJ_SUIT stepping off curb into street, a car's headlights blazing toward him from the side. Motion blur on the car. His eyes wide with shock, turning to see the car. Urban street, crosswalk. Harsh white headlight glare. $NOCAM"

gen "frame-08-reset-flash.png" "$STYLE. Abstract transition frame: white flash consuming the screen from center, silhouette of a man falling backward dissolving into light. Digital glitch effects at edges. Time fragments - clock faces showing 7:00 scattered in the void. Ethereal and surreal. $NOCAM"

# === LOOP 2 (frames 9-14) ===
gen "frame-09-wakeup-deja-vu.png" "$STYLE. $ZJ_GRAY sitting bolt upright in bed, sweating, eyes wide with confusion. Same bedroom as frame 1 but now the morning light feels eerie. Phone showing 7:00 AM. His hand touching his chest where the car hit. Unsettling atmosphere. $NOCAM"

gen "frame-10-same-breakfast.png" "$STYLE. Over-the-shoulder shot: $ZJ_SUIT at office elevator, $CHEN approaching with tablet, mouth open mid-sentence. $ZJ looking at him with a disturbed expression - he has heard this exact conversation before. Modern office lobby with marble floors. $NOCAM"

gen "frame-11-prepared-counter.png" "$STYLE. Medium shot in same conference room. $ZJ_SUIT standing confidently, holding up his own set of documents, countering $ZHAO who looks mildly surprised. $ZJ has a determined expression. Tense atmosphere. $NOCAM"

gen "frame-12-linwei-secret.png" "$STYLE. Dramatic close-up reaction shot: $ZJ_SUIT face showing pure shock, eyes wide, mouth slightly open. In the blurred foreground, $ZHAO hand holds a document with visible text. The shock on $ZJ face is the focus. Dark moody lighting with single overhead light. $NOCAM"

gen "frame-13-loop2-death.png" "$STYLE. Overhead bird's-eye shot: $ZJ_SUIT collapsed on the conference room floor, papers scattered around him. Abstract time-distortion visual effect - concentric circles emanating from his body, reality cracking like glass. Transitioning to white. $NOCAM"

# === LOOP 3: Investigation (frames 14-18) ===
gen "frame-14-wakeup-determined.png" "$STYLE. $ZJ_GRAY sitting on bed edge, elbows on knees, intense focused expression. A notebook with scribbled notes visible on the nightstand. Morning light. He is looking down at his hands with determination. The mood is serious, not panicked. $NOCAM"

gen "frame-15-following-linwei.png" "$STYLE. $ZJ_HOODIE lurking behind a pillar in an underground parking garage, watching $LINWEI getting into a silver sedan. He is wearing the hoodie with hood up, partially concealing his face. Film noir lighting - harsh shadows from fluorescent tubes. Spy thriller atmosphere. $NOCAM"

gen "frame-16-cafe-spying.png" "$STYLE. $ZJ_HOODIE sitting at a cafe window table, pretending to look at phone, but eyes directed sideways toward $LINWEI meeting with a man in dark suit (ZHAO's assistant) at another table. Through-the-glass shot, reflections visible. Suspenseful mood. $NOCAM"

gen "frame-17-overheard-shock.png" "$STYLE. Extreme close-up of $ZJ face pressed against a wall, ear turned toward a door crack, eyes wide with the revelation. Sweat on his temple. Harsh shadow cuts across his face diagonally. Dramatic thriller lighting. $NOCAM"

gen "frame-18-stairway-fall.png" "$STYLE. Dynamic action shot: $ZJ_HOODIE falling backward down a stairwell, his body twisting, hand reaching for the railing but missing. Shot from above looking down the spiral staircase. Motion blur. A dark figure visible at the top of stairs. Dramatic perspective. $NOCAM"

# === LOOPS 4-5: Systematic intelligence (frames 19-26) ===
gen "frame-19-planning-wall.png" "$STYLE. $ZJ_GRAY standing in his living room which is now covered with a planning wall - sticky notes, red string connections, photos, timeline. He is marking something on the wall with a marker. Detective-thriller aesthetic. Warm lamp light in otherwise dark room. Wide shot. $NOCAM"

gen "frame-20-multiple-paths.png" "$STYLE. Artistic split-screen composition showing the same Chinese man ($ZJ) in 4 different outfits walking down 4 different hallways, representing different loop paths. Top-left: suit going to meeting. Top-right: hoodie following someone. Bottom-left: casual at a computer. Bottom-right: on the phone urgently. Same face, different directions. Stylized. $NOCAM"

gen "frame-21-server-room.png" "$STYLE. $ZJ_HOODIE crouching in a dim server room, laptop connected to a server rack, screen showing code and file transfer progress. Green LED lights from servers illuminate his focused face. Cyberpunk tech thriller aesthetic. Shot from low angle. $NOCAM"

gen "frame-22-linwei-hospital.png" "$STYLE. Through a hospital window from outside, $LINWEI is visible sitting beside a bed holding an elderly woman's hand, her expression pained and worried. $ZJ_HOODIE watches from across the street, partially hidden. The hospital has a corporate logo on it. Melancholy mood, soft defused light inside vs cold blue outside. $NOCAM"

gen "frame-23-comedy-predict.png" "$STYLE. Comedic medium shot in the office: $ZJ_SUIT casually leaning against a desk, smirking, while $CHEN stands frozen mid-sentence with tablet, mouth open and eyes bulging in shock. $ZJ appears to have just finished CHEN's sentence for him. Other office workers in background also looking surprised. Bright office lighting, humorous tone. $NOCAM"

gen "frame-24-comedy-predict2.png" "$STYLE. Close-up two-shot: $CHEN looking terrified, clutching his tablet to his chest, staring at $ZJ_SUIT who is grinning mischievously. Comedic exaggerated expressions. Manga-style shock lines around CHEN. Bright colorful mood compared to other darker frames. $NOCAM"

gen "frame-25-montage-intel.png" "$STYLE. Dynamic montage composition: Multiple overlapping panels showing $ZJ in different scenarios - reading documents at night, taking photos of evidence, making a phone call on a rooftop at sunset, reviewing security footage on laptop. All connected by digital clock displays showing 7:00. Energetic, mission-impossible vibe. $NOCAM"

gen "frame-26-stock-joke.png" "$STYLE. Comedic shot: $ZJ_SUIT sitting at his computer looking at a stock market chart with a wry, self-deprecating smile. The chart shows a massive spike but a tooltip says 'tomorrow' - and he realizes the loop only lasts one day. His expression is a mix of disappointment and amused self-mockery. Warm funny lighting. $NOCAM"

# === LOOPS 6-7: Confrontation (frames 27-35) ===
gen "frame-27-confident-entrance.png" "$STYLE. $ZJ_SUIT walking into the same conference room but this time with supreme confidence. Low-angle hero shot, his stride powerful. He is carrying a leather briefcase. $ZHAO visible in background looking up from his seat. Dramatic lighting from windows behind ZJ creating a backlit silhouette effect. $NOCAM"

gen "frame-28-evidence-reveal.png" "$STYLE. Dramatic medium shot: $ZJ_SUIT standing, placing photographs one by one on the conference table in front of a visibly uncomfortable $ZHAO. Each photo shows different incriminating evidence. $ZJ expression is calm and controlled. Power shift visible in body language. Dark dramatic lighting. $NOCAM"

gen "frame-29-zhao-counter.png" "$STYLE. Close-up of $ZHAO who has regained composure, leaning back in his chair with fingers steepled, a cold dangerous smile on his face. Behind him through the glass wall, two large bodyguards are visible standing. Ominous dark lighting. His eyes are directed at someone across the table. $NOCAM"

gen "frame-30-bigger-conspiracy.png" "$STYLE. Over-the-shoulder of $ZJ looking at a large screen $ZHAO has revealed - showing an organizational chart of a massive tech conglomerate, with ZJ's small company highlighted as an acquisition target. The scale of the conspiracy revealed. Blue screen light illuminating shocked faces. $NOCAM"

gen "frame-31-bodyguard-escort.png" "$STYLE. $ZJ_SUIT being firmly escorted out by two large bodyguards, each holding one of his arms. He looks back over his shoulder with a calm expression at $ZHAO. Hallway setting, harsh overhead lighting. $NOCAM"

gen "frame-32-tomorrow-quip.png" "$STYLE. Close-up of $ZJ face as he is being escorted away, looking back with a cool smirk. His expression says 'I know something you don't.' Dark humor moment. Cinematic shallow depth of field, bodyguard hands blurred in foreground. $NOCAM"

gen "frame-33-zhao-confused.png" "$STYLE. Reaction shot of $ZHAO standing in the conference room doorway, watching ZJ being taken away, his expression shifting from triumph to confused unease. His brow furrowed, sensing something is off. Cold blue conference room lighting. $NOCAM"

# === LOOPS 8-10: Perfect Plan (frames 34-42) ===
gen "frame-34-mastermind-plan.png" "$STYLE. Wide shot of $ZJ_GRAY in his apartment at night, surrounded by multiple screens, whiteboards, and documents. He stands in the center like a commander, orchestrating his plan. Blueprints, timelines, photos. Blue-white screen glow in dark room. Epic strategist aesthetic. $NOCAM"

gen "frame-35-code-transfer.png" "$STYLE. Close-up of a laptop screen showing a secure file transfer at 100% - AI source code successfully backed up to an encrypted cloud. $ZJ hands on keyboard, his face reflected in screen. Green 'COMPLETE' status. Dark room, tech thriller atmosphere. $NOCAM"

gen "frame-36-rival-investor.png" "$STYLE. $ZJ_SUIT meeting a different investor - a sharp-looking Chinese woman in her 40s with silver-streaked hair - at a upscale restaurant. They are shaking hands across the table, both with strategic smiles. Warm elegant restaurant lighting, wine glasses on table. $NOCAM"

gen "frame-37-rescue-plan.png" "$STYLE. Night scene: $ZJ_HOODIE crouched on a rooftop, looking down at the hospital building through binoculars. City lights in background. He is talking into a phone earpiece, planning the extraction of LINWEI's family. Action movie aesthetic, teal-orange color grade. $NOCAM"

gen "frame-38-evidence-compile.png" "$STYLE. Artistic shot of $ZJ hand placing the final piece of evidence into a folder marked with a red seal. Stack of documents, USB drives, photos. The folder is on a desk next to a coffee cup and phone showing 5:30 AM. Early dawn light. Meticulous preparation feel. $NOCAM"

gen "frame-39-final-morning.png" "$STYLE. $ZJ standing before a floor-length mirror, adjusting the collar of his all-black suit and black shirt. His reflection shows a determined, focused expression. This is his final loop. Dramatic morning light cutting across the room. Hero suiting-up moment. $NOCAM"

gen "frame-40-walk-to-destiny.png" "$STYLE. Low-angle tracking shot: $ZJ_BLACK walking through the modern office lobby, his stride confident and purposeful. Other workers stepping aside. He carries a thin briefcase. Cinematic slow-motion feel with depth of field. Natural light from glass atrium. $NOCAM"

gen "frame-41-final-entrance.png" "$STYLE. Dramatic wide shot: $ZJ_BLACK pushing open the conference room double doors. $ZHAO and his team visible at the far end of the table, all looking up. The morning light through windows creates dramatic lens flare. Power pose, epic entrance. $NOCAM"

gen "frame-42-checkmate-line.png" "$STYLE. Close-up two-shot across the conference table: $ZJ_BLACK leaning forward with a confident smile, making eye contact with $ZHAO whose face is frozen in realization. The power dynamic has completely reversed. Dramatic side lighting, dark background. $NOCAM"

# === CLIMAX + CLIFFHANGER (frames 43-46) ===
gen "frame-43-zhao-face-drops.png" "$STYLE. Extreme close-up of $ZHAO face - his composure cracking, eyes widening, the hawk nose casting a sharp shadow. Beads of sweat on his temple. His carefully maintained mask of control is breaking. Dramatic single-source lighting from below. $NOCAM"

gen "frame-44-control-moment.png" "$STYLE. Wide overhead shot of the conference table: $ZJ_BLACK standing at the head, arms spread resting on the table, in total command. Around the table, ZHAO's team members are looking between ZHAO and ZJ with uncertainty. Documents and evidence spread on the table. Cinematic top-down perspective. $NOCAM"

gen "frame-45-phone-buzz.png" "$STYLE. Close-up of $ZJ hand as his phone on the conference table vibrates with a message notification. The screen shows an anonymous message (text not readable). His other hand is mid-gesture, frozen. Shallow depth of field - phone in focus, conference room blurred. Dramatic pause moment. $NOCAM"

gen "frame-46-smile-freezes.png" "$STYLE. Dramatic close-up portrait of $ZJ_BLACK face in profile - his confident smile literally freezing, eyes shifting down to the phone. A chill running through him visible in his expression. The warm confidence draining from his face. Half his face in light, half in shadow. Cinematic. $NOCAM"

echo "=== ALL FRAMES GENERATED ==="
