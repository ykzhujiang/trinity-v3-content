#!/bin/bash
set -e
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
OUT="/Users/ahzhu_agent/trinity-v3-content/exp-734-reborn2014-ch2"
cd "$OUT"

gen() {
  local fname="$1"
  local prompt="$2"
  if [ -f "$fname" ]; then
    echo "SKIP: $fname exists"
    return
  fi
  echo "GEN: $fname ..."
  uv run "$SCRIPT" --prompt "$prompt" -i "$REF" --filename "$fname" --resolution 1K 2>&1 | tail -3
  echo "DONE: $fname"
}

# === SCENE 1: Corridor Standoff — Continuing Ch1 ending (f01-f02) ===

gen "f01-corridor-standoff.jpg" \
"Realistic manga style, 9:16 vertical portrait. Two Chinese men face each other in a modern office corridor, 2014 era. Left: stocky man with slicked-back black hair, stubble, wearing casual T-shirt and jeans (based on reference photo). Right: tall thin man with angular face, sharp eyebrows, side-parted short hair, wearing dark navy business casual blazer. Both seen from 3/4 angle from behind the stocky man's shoulder. Fluorescent office lighting, slightly tense atmosphere. Neither looks at camera. No text on image."

gen "f02-rival-closeup.jpg" \
"Realistic manga style, 9:16 vertical portrait. Close-up 3/4 profile of a tall thin Chinese man with angular face, sharp defined eyebrows, side-parted short hair, wearing dark navy business casual blazer over black turtleneck. He has a calculated subtle smile. 2014 office corridor background blurred. Cold lighting. He is looking slightly to his left at someone off-screen. No text on image."

# === SCENE 2: Probing Conversation (f03-f06) ===

gen "f03-handshake-intro.jpg" \
"Realistic manga style, 9:16 vertical portrait. Two Chinese men shaking hands in office corridor. Left: stocky man, slicked-back black hair, stubble, T-shirt jeans, casual but alert expression. Right: tall thin angular-faced man, sharp eyebrows, side-parted hair, dark blazer, polished confident smile. Shot from low angle looking up, emphasizing the tall man's height advantage. 2014 office interior. No text on image."

gen "f04-coffee-chat.jpg" \
"Realistic manga style, 9:16 vertical portrait. Two Chinese men sitting in a 2014-era office waiting room with plastic chairs. Stocky man with slicked-back black hair and stubble in T-shirt leans forward, studying the other man carefully. Tall thin angular-faced man in dark blazer holds a paper coffee cup, speaking casually. Shot from side angle showing both in profile. Fluorescent lighting. No text on image."

gen "f05-voice-interaction-hint.jpg" \
"Realistic manga style, 9:16 vertical portrait. Close-up of the tall thin angular-faced Chinese man with sharp eyebrows and side-parted hair, gesturing with one hand while speaking. His expression is knowing, slightly mysterious. Behind him, out of focus, the stocky man with stubble watches intently with narrowed eyes. 2014 office waiting room. Warm artificial light. No text on image."

gen "f06-zhujiang-suspicious.jpg" \
"Realistic manga style, 9:16 vertical portrait. Close-up of a stocky Chinese man with slicked-back black hair and stubble (based on reference photo), 3/4 angle, eyes narrowed suspiciously, one eyebrow slightly raised. He's pretending to be casual but his jaw is tight. Blurred office background. Dramatic side lighting creating shadows on his face. No text on image."

# === SCENE 3: DECISION-3 — The Bitcoin Test (f07-f11) ===

gen "f07-waiting-room.jpg" \
"Realistic manga style, 9:16 vertical portrait. Two Chinese men sitting across from each other in a small 2014 meeting room with a round table. Stocky man with slicked-back black hair, stubble, T-shirt, leaning back casually in chair. Tall thin man with angular face, sharp eyebrows, dark blazer, sitting upright with coffee. Both looking at each other with carefully neutral expressions. Old-style fluorescent ceiling lights, cheap office furniture. No text on image."

gen "f08-bitcoin-mention.jpg" \
"Realistic manga style, 9:16 vertical portrait. Medium close-up of a stocky Chinese man with slicked-back black hair and stubble (based on reference photo), 3/4 angle, with a deliberately casual expression, one hand gesturing as if making small talk. His eyes are sharp and watchful despite the relaxed posture. 2014 meeting room background. Warm tungsten lighting. No text on image."

gen "f09-coffee-pause.jpg" \
"Realistic manga style, 9:16 vertical portrait. Extreme close-up of a tall thin Chinese man's hand holding a paper coffee cup, frozen mid-sip. The hand shows a subtle tremor of hesitation. Above the cup, his angular chin and thin lips are visible, expression momentarily frozen. Dramatic shallow depth of field. No text on image."

gen "f10-short-video-counter.jpg" \
"Realistic manga style, 9:16 vertical portrait. The tall thin Chinese man with angular face, sharp eyebrows, side-parted hair, dark blazer — now smiling knowingly, leaning forward slightly. His eyes are sharp and amused. Shot from slightly below, giving him a commanding presence. 2014 meeting room. The stocky man visible in the blurred background, frozen. No text on image."

gen "f11-eyes-lock.jpg" \
"Realistic manga style, 9:16 vertical portrait. Split composition — left side shows the stocky Chinese man with slicked-back hair and stubble in intense close-up, eyes wide with realization. Right side shows the tall thin angular-faced man with a calm calculated smile. They are staring at each other. The air between them seems to crackle. Dramatic lighting with strong contrast. No text on image."

# === SCENE 4: Client Pitch Battle (f12-f16) ===

gen "f12-client-arrives.jpg" \
"Realistic manga style, 9:16 vertical portrait. A 2014 Chinese office meeting room. Three people: a middle-aged Chinese businessman in ill-fitting suit (the client) entering through a glass door, while two younger men stand to greet him. The stocky man with slicked-back hair and stubble on the left, the tall thin angular-faced man on the right. Both wearing professional smiles. 2014 era office with old-model desktop computers visible. No text on image."

gen "f13-rival-pitch.jpg" \
"Realistic manga style, 9:16 vertical portrait. The tall thin Chinese man with angular face and sharp eyebrows standing at a whiteboard, presenting confidently. He's drawn neat diagrams on the whiteboard. The middle-aged client watches impressed, nodding. In the corner, the stocky man with stubble sits watching with a tense jaw, arms crossed. 2014 meeting room. Shot from the stocky man's POV angle. No text on image."

gen "f14-zhujiang-pitch.jpg" \
"Realistic manga style, 9:16 vertical portrait. The stocky Chinese man with slicked-back black hair and stubble (based on reference photo) standing at the whiteboard, gesturing passionately about AI technology. His pitch is more technical and raw. The client looks interested but slightly confused. 2014 meeting room. Shot from 3/4 angle. No text on image."

gen "f15-client-leaning-rival.jpg" \
"Realistic manga style, 9:16 vertical portrait. Over-the-shoulder shot from behind the stocky man with stubble. Across the table, the middle-aged client is leaning toward the tall thin angular-faced man, discussing details with him. The tall man looks satisfied. Focus on the stocky man's clenched fist under the table in the foreground. 2014 meeting room. No text on image."

gen "f16-zhujiang-realization.jpg" \
"Realistic manga style, 9:16 vertical portrait. Close-up of the stocky Chinese man with slicked-back hair and stubble (based on reference photo), 3/4 angle, face showing a complex mix of frustration and sudden inspiration. His eyes light up as an idea strikes. A slight smirk begins to form. Dramatic lighting with one side bright. Meeting room background blurred. No text on image."

# === SCENE 5: DECISION-4 — Strategic Pivot (f17-f20) ===

gen "f17-walking-away.jpg" \
"Realistic manga style, 9:16 vertical portrait. The stocky Chinese man with slicked-back black hair and stubble walking away from a 2014 office building, seen from behind at 3/4 angle. He's walking with purpose, hands in jeans pockets. The building's glass entrance reflects his figure. Late afternoon golden light. 2014 street with old taxis visible. No text on image."

gen "f18-rental-room.jpg" \
"Realistic manga style, 9:16 vertical portrait. A tiny cramped rental apartment. The stocky Chinese man with slicked-back hair and stubble bursts through the door energetically. A round-faced Chinese man with thick black-framed glasses and slightly overweight build in a plaid shirt (old ma) is sitting at a cheap desk with a ThinkPad laptop, looking up startled. 2014 decor: bare walls, cheap furniture, instant noodle cups. Evening warm light from a desk lamp. No text on image."

gen "f19-oldma-dejected.jpg" \
"Realistic manga style, 9:16 vertical portrait. Close-up of a round-faced Chinese man with thick black-framed glasses and slightly chubby cheeks, wearing a plaid shirt. His expression is dejected and exasperated, one hand pushing up his glasses. He looks tired and disappointed. Cheap desk lamp lighting from the side. Small rental apartment background. No text on image."

gen "f20-zhujiang-excited.jpg" \
"Realistic manga style, 9:16 vertical portrait. The stocky Chinese man with slicked-back hair and stubble (based on reference photo), 3/4 angle, standing in a tiny rental apartment, both fists clenched with excitement, eyes blazing with determination and a wide grin. His energy fills the small room. Evening light. The round-faced man with glasses visible behind him looking bewildered. No text on image."

gen "f21-oldma-chuanxiao.jpg" \
"Realistic manga style, 9:16 vertical portrait. Close-up of the round-faced Chinese man with thick black-framed glasses, staring deadpan at someone off-screen with a deeply skeptical flat expression — the classic 'are you running a MLM scheme' look. One eyebrow slightly raised. Plaid shirt. Warm desk lamp lighting. Small apartment. Comedic timing frozen in this expression. No text on image."

gen "f22-argument.jpg" \
"Realistic manga style, 9:16 vertical portrait. Two Chinese men in a tiny rental apartment arguing animatedly. The stocky man with slicked-back hair and stubble is counting on his fingers, explaining something passionately. The round-faced man with glasses and plaid shirt has his arms crossed, shaking his head but starting to look interested despite himself. ThinkPad laptop on desk between them. Beer cans on the desk. Evening. Comedic energy. No text on image."

gen "f23-oldma-logic.jpg" \
"Realistic manga style, 9:16 vertical portrait. The round-faced Chinese man with thick black-framed glasses, pointing an accusing finger at someone off-screen, mouth open mid-argument. His expression says 'you said the same thing last time and it didn't work'. Plaid shirt rumpled. Close-up 3/4 angle. Warm apartment lighting. No text on image."

gen "f24-zhujiang-serious.jpg" \
"Realistic manga style, 9:16 vertical portrait. The stocky Chinese man with slicked-back hair and stubble (based on reference photo), sitting on a cheap chair in the rental apartment, leaning forward with elbows on knees. His expression is now dead serious — the excitement replaced by a grim acknowledgment. He's looking down and to the side. Single desk lamp casting dramatic shadows. Evening. No text on image."

# === SCENE 6: Shocking Discovery (f25-f28) ===

gen "f25-insomnia-laptop.jpg" \
"Realistic manga style, 9:16 vertical portrait. Night scene. The stocky Chinese man with slicked-back hair and stubble sitting alone in the dark rental apartment, illuminated only by a laptop screen glow. He's hunched over the ThinkPad, face tense with concentration. The round-faced man is asleep on a camp bed in the background. Moonlight through thin curtains. 3AM feeling. No text on image."

gen "f26-company-search.jpg" \
"Realistic manga style, 9:16 vertical portrait. Extreme close-up of a ThinkPad laptop screen showing a Chinese company registration page. The screen glow reflects on the stocky man's face partially visible above the screen — his eyes are wide with shock, mouth slightly open. Only the top half of his face visible. Blue laptop glow in dark room. No text on image."

gen "f27-cold-sweat.jpg" \
"Realistic manga style, 9:16 vertical portrait. Close-up of the stocky Chinese man with slicked-back hair and stubble (based on reference photo), face glistening with cold sweat in laptop blue glow. His expression is pure shock mixed with dread — eyebrows raised, eyes wide but calculating. One hand gripping the edge of the desk tightly. Dark room. Cinematic horror-thriller lighting. No text on image."

gen "f28-shareholder-name.jpg" \
"Realistic manga style, 9:16 vertical portrait. Over-shoulder shot of the stocky man with stubble staring at the laptop screen. The screen shows a list/table (Chinese company shareholder info). His finger is pointing at one entry on the screen. His hand is trembling slightly. The blue glow creates an eerie atmosphere. Camera angle from behind and slightly above. No text on image."

gen "f29-window-stare.jpg" \
"Realistic manga style, 9:16 vertical portrait. The stocky Chinese man with slicked-back hair and stubble standing at the small window of the rental apartment, looking out at the 2014 city nightscape. His silhouette is dark against the dim city lights. One hand on the window frame. His reflection in the glass shows a determined but shaken expression. Moody blue-purple night tones. Cinematic composition. No text on image."

gen "f30-cliffhanger.jpg" \
"Realistic manga style, 9:16 vertical portrait. Dramatic low-angle shot looking up at the stocky Chinese man with slicked-back hair and stubble, standing in the dark apartment. His face is half in shadow, half lit by the laptop's blue glow. His expression is fierce determination — jaw set, eyes burning. The darkness behind him seems to press in. Cinematic thriller mood. Strong contrast. No text on image."

echo "=== ALL FRAMES COMPLETE ==="
ls -la *.jpg | wc -l
du -sh .
