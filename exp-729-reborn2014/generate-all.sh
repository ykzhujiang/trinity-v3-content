#!/bin/bash
set -e
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
OUT="/Users/ahzhu_agent/trinity-v3-content/exp-729-reborn2014"
cd "$OUT"

gen() {
  local fname="$1"
  local prompt="$2"
  if [ -f "$fname" ]; then
    echo "SKIP: $fname exists"
    return
  fi
  echo "GEN: $fname"
  uv run "$SCRIPT" --prompt "$prompt" -i "$REF" --filename "$fname" --resolution 1K 2>&1 | tail -3
  echo "DONE: $fname"
}

# === SCENE 1: 2026 Office Night (f01-f03) ===
# f01 already done

gen "f02-phone-screen.png" \
"Realistic manga style, 9:16 vertical portrait. Close-up of a Chinese man's hands holding a smartphone, screen showing bank balance 3847.22 yuan. The man's face partially visible from above, 3/4 angle, slicked-back black hair, stubble, exhausted expression. Dark office background with blue phone glow. Cinematic lighting. No text on image."

gen "f03-blackout.png" \
"Realistic manga style, 9:16 vertical portrait. A Chinese man with slicked-back black hair and stubble, in a dark suit, slumping forward onto his desk in a dark empty office. Seen from side angle. His eyes closing, body going limp. Computer monitors dark. Dramatic shadow and moonlight contrast. Feeling of losing consciousness. No text on image."

# === SCENE 2: Rebirth Moment (f04-f06) ===
gen "f04-wakeup.png" \
"Realistic manga style, 9:16 vertical portrait. A Chinese man with slicked-back black hair, looking younger (early 30s), suddenly waking up in a small messy bedroom. Shot from above looking down at him lying on a narrow bed. Old-style flip phone ringing on the nightstand. Morning sunlight streaming through thin curtains. Expression: confusion and shock. He's wearing a plain white t-shirt. No text on image."

gen "f05-calendar.png" \
"Realistic manga style, 9:16 vertical portrait. Close-up of a man's hand holding an old flip phone, screen showing date March 2014. 3/4 angle of the Chinese man's face behind the phone, younger looking (early 30s), slicked-back black hair, eyes wide with disbelief. Small messy bedroom background. Warm morning light. No text on image."

gen "f06-mirror.png" \
"Realistic manga style, 9:16 vertical portrait. A young Chinese man (early 30s) with slicked-back black hair standing before a bathroom mirror, looking at his own reflection with a bittersweet smirk. His face is youthful - no dark circles, no gray hair. He touches his face with one hand. Small bathroom with old tiles. Warm natural lighting. 3/4 angle from behind his shoulder showing his reflection. No text on image."

# === SCENE 3: Confirming Rebirth (f07-f10) ===
gen "f07-street-2014.png" \
"Realistic manga style, 9:16 vertical portrait. A young Chinese man (early 30s) in a casual grey t-shirt and jeans walking on a Chinese city street in 2014. Shot from behind at 3/4 angle. Street scene includes: Nokia advertisement billboard, newspaper kiosks, people with basic smartphones, older cars, no shared bikes. Bright spring sunshine. Nostalgic but vibrant atmosphere. No text on image."

gen "f08-newspaper.png" \
"Realistic manga style, 9:16 vertical portrait. Close-up of a Chinese newspaper stand in 2014, with newspapers and magazines visible. A young Chinese man's hand reaching to pick up a newspaper. His 3/4 profile visible, slight smile forming. Spring sunshine. Period-accurate details: old phone ads, 2014 magazine covers. No text on image."

gen "f09-computer-search.png" \
"Realistic manga style, 9:16 vertical portrait. A young Chinese man (early 30s) with slicked-back black hair sitting at an old desktop computer in a small rental apartment. The monitor shows a search engine page. He is viewed from 3/4 side angle, leaning forward with intense focus, a knowing smirk on his face. Cheap desk, old keyboard, cramped room. Warm afternoon light through small window. No text on image."

gen "f10-smirk.png" \
"Realistic manga style, 9:16 vertical portrait. Close-up of a young Chinese man's face (early 30s), slicked-back black hair, 3/4 angle, with a subtle confident smirk. His eyes have a glint of determination and hidden knowledge. Computer screen glow on his face. Shallow depth of field, the background blurred. Cinematic lighting. No text on image."

# === SCENE 4: Decision + Finding Old Ma (f11-f15) ===
gen "f11-thinking-window.png" \
"Realistic manga style, 9:16 vertical portrait. A young Chinese man (early 30s) in grey t-shirt standing by a window in a small apartment, looking out at the city skyline with arms crossed. 3/4 rear angle - we see his profile and the city beyond. He appears deep in thought, determined expression. Spring afternoon light. Chinese city skyline with 2014-era buildings. No text on image."

gen "f12-bbq-stall.png" \
"Realistic manga style, 9:16 vertical portrait. Two Chinese men sitting at a street-side BBQ stall at night. Left: young man (early 30s) with slicked-back black hair in a casual grey t-shirt, animated expression, leaning forward. Right: round-faced man with thick black-framed glasses, slightly chubby, wearing a plaid/checkered shirt, looking skeptical with arms crossed. Beer bottles and BBQ skewers on the table. Warm orange lights from the stall. Shot from slightly above, capturing both at 3/4 angle. No text on image."

gen "f13-oldma-skeptical.png" \
"Realistic manga style, 9:16 vertical portrait. Close-up of a round-faced Chinese man with thick black-framed glasses, slightly chubby, wearing a plaid shirt. He is looking at someone across the table with a deeply skeptical expression - one eyebrow raised, mouth slightly open. BBQ stall background blurred. He looks like he's watching someone pitch a pyramid scheme. Warm lighting. 3/4 angle. No text on image."

gen "f14-beer-gulp.png" \
"Realistic manga style, 9:16 vertical portrait. A young Chinese man (early 30s) with slicked-back black hair, caught mid-action tilting a beer bottle to his lips, looking slightly panicked as if trying to cover up something he almost said. His eyes dart sideways. The round-faced man with glasses across the table is still staring at him suspiciously. BBQ stall night scene. 3/4 angle. Comedic tension. No text on image."

gen "f15-oldma-thinking.png" \
"Realistic manga style, 9:16 vertical portrait. The round-faced Chinese man with thick black-framed glasses and plaid shirt is rubbing his chin thoughtfully, his expression slowly changing from skeptical to intrigued. He is looking down at his beer bottle, considering something. The young man with slicked-back hair is visible in the blurred background, watching hopefully. BBQ stall scene, warm night lighting. 3/4 angle. No text on image."

# === SCENE 5: Convincing + Partnership (f16-f19) ===
gen "f16-emotional-appeal.png" \
"Realistic manga style, 9:16 vertical portrait. The young Chinese man (early 30s) with slicked-back black hair is speaking earnestly to his friend across the BBQ table. His expression is sincere and slightly vulnerable - not the confident smirk from before but genuine emotion showing through. He's holding his beer but not drinking, looking directly at the round-faced man. Warm streetlight creates emotional atmosphere. 3/4 angle from slightly behind the round-faced man. No text on image."

gen "f17-handshake.png" \
"Realistic manga style, 9:16 vertical portrait. Two men shaking hands across a BBQ stall table - the young man with slicked-back black hair (grey t-shirt) and the round-faced man with glasses (plaid shirt). Both have slight smiles. Beer bottles and skewer sticks scattered on table. The round-faced man still looks slightly reluctant but committed. Night scene, warm lights. Shot from side angle capturing both faces in 3/4. No text on image."

gen "f18-walk-home.png" \
"Realistic manga style, 9:16 vertical portrait. Two men walking side by side on a quiet Chinese city street at night. Left: young man with slicked-back black hair in grey t-shirt, hands in pockets, looking up at the sky with a small smile. Right: round-faced man with glasses in plaid shirt, looking at his phone with a mix of worry and excitement. Street lights creating long shadows. 2014-era Chinese city. Shot from behind at low angle. No text on image."

gen "f19-oldma-truth.png" \
"Realistic manga style, 9:16 vertical portrait. Close-up of the young Chinese man (early 30s) with slicked-back black hair. He has paused mid-step, face caught in a moment of complex emotion - a mix of sad smile and determination. 3/4 profile shot with street lights behind him creating rim lighting. His friend's words clearly hit a nerve. Deep depth, cinematic night atmosphere. No text on image."

# === SCENE 6: First Client (f20-f24) ===
gen "f20-rental-office.png" \
"Realistic manga style, 9:16 vertical portrait. Two men working in a tiny cramped rental apartment converted into a makeshift office. Young man with slicked-back black hair (grey t-shirt) sits at a cheap desk pointing at a laptop screen. Round-faced man with glasses (plaid shirt) leans over his shoulder looking at the screen. Papers and notebooks scattered around. Whiteboard with diagrams on wall. Daytime, natural light from small window. 3/4 angle from corner of room. No text on image."

gen "f21-research.png" \
"Realistic manga style, 9:16 vertical portrait. Close-up over-the-shoulder shot of the young Chinese man with slicked-back black hair looking at a laptop screen. His expression is focused and calculating, a slight smile suggesting he knows exactly what he's looking for. The screen reflects in his eyes. Cramped apartment office background. Afternoon light. No text on image."

gen "f22-meeting-cto.png" \
"Realistic manga style, 9:16 vertical portrait. A small meeting room in a startup office in 2014 China. The young man with slicked-back black hair (now wearing a simple button-up shirt over t-shirt, looking professional but casual) sits across from another man in a tech company hoodie (the CTO - thin face, short hair, different appearance from both main characters). They're having an animated discussion, with the CTO looking impressed. Whiteboard with technical diagrams. Bright office lighting. 3/4 angle. No text on image."

gen "f23-cto-surprised.png" \
"Realistic manga style, 9:16 vertical portrait. Close-up of the CTO character - a thin-faced Chinese man with short hair wearing a tech company hoodie, looking genuinely surprised and impressed by something he just heard. He's leaning back in his chair slightly. Conference room background blurred. Good overhead lighting. 3/4 angle. No text on image."

gen "f24-inner-monologue.png" \
"Realistic manga style, 9:16 vertical portrait. The young Chinese man with slicked-back black hair sitting in a meeting room, maintaining a casual confident smile on his face, but his eyes betray a deeper knowing. He's sitting back in his chair with one arm resting casually. The scene has a slight dreamy quality suggesting internal thoughts. Meeting room with the other person blurred. Cinematic lighting from window. 3/4 angle. No text on image."

# === SCENE 7: Crisis + Cliffhanger (f25-f27) ===
gen "f25-exit-building.png" \
"Realistic manga style, 9:16 vertical portrait. The young Chinese man with slicked-back black hair in his button-up shirt walking out of a modern office building lobby, looking satisfied with a slight smile. He's about to push through glass doors. Bright daylight outside. 3/4 angle from inside the lobby looking out. Chinese city street visible through the glass doors. No text on image."

gen "f26-rival-spotted.png" \
"Realistic manga style, 9:16 vertical portrait. The young Chinese man with slicked-back black hair has stopped in his tracks just outside the office building. He is staring at someone across the entrance area with a shocked expression - his confident demeanor completely shattered. His body language is tense, one foot mid-step. Dramatic sunlight creating sharp shadows. Shot from side angle capturing his frozen profile. No text on image."

gen "f27-rival-face.png" \
"Realistic manga style, 9:16 vertical portrait. A mysterious Chinese man (different from the main character - slightly older, sharp angular face, narrow eyes, neatly styled hair, wearing an expensive dark coat) standing near the entrance of an office building. He too has a look of surprise on his face, staring at someone off-screen. The two men are clearly recognizing each other. Dramatic lighting with afternoon sun creating long shadows. 3/4 angle. No text on image."

echo "=== ALL FRAMES GENERATED ==="
ls -la *.png | wc -l
