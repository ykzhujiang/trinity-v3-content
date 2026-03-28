#!/bin/bash
set -e

SKILL_DIR="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts"
REF_IMG="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
OUT_DIR="/Users/ahzhu_agent/trinity-v3-content/exp720/images"
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"

ZJ_DESC="a young Chinese man in his late 20s with short black hair, large expressive eyes, no glasses, athletic lean build, handsome face based on the reference photo"

gen() {
  local n=$1
  local prompt=$2
  local fn="f$(printf '%02d' $n).png"
  echo "=== Generating frame $n ==="
  if [ -f "$OUT_DIR/$fn" ]; then
    echo "  Already exists, skipping"
    return
  fi
  uv run "$SKILL_DIR/generate_image.py" \
    --prompt "$prompt" \
    --filename "$OUT_DIR/$fn" \
    --resolution 1K \
    -i "$REF_IMG" 2>&1 | tail -3
  sleep 2
}

# Frame 1: Opening - city skyline, modern office building with "华山资本" sign
gen 1 "Vertical 9:16 portrait composition. Semi-realistic manga style, bright modern colors. Wide establishing shot of a gleaming modern Shanghai financial district skyline on a sunny morning. A tall glass office tower dominates the center. $ZJ_DESC wearing a navy blue polo shirt and khaki chinos, seen from behind walking toward the building entrance, small figure against the grand architecture. He carries a laptop bag. The mood is determined and optimistic. Do not include any text on the image."

# Frame 2: Zhu Jiang's inner wuxia vision - same building morphs into a martial arts sect gate
gen 2 "Vertical 9:16 portrait composition. Chinese ink wash painting style with warm golden tones. The same modern office building transforms into a grand ancient martial arts sect entrance gate with ornate Chinese architecture, misty mountains behind. A translucent overlay of the modern building shows through. Dreamlike atmospheric quality. Do not include any text on the image."

# Frame 3: Zhu Jiang walking through lobby, slight nervous excitement
gen 3 "Vertical 9:16 portrait composition. Semi-realistic manga style, bright interior lighting. Medium shot from a low angle. $ZJ_DESC wearing navy polo shirt and khaki chinos, walking through a luxurious modern office lobby with marble floors and floor-to-ceiling windows. He looks ahead with a mix of excitement and determination, slight smile. Natural lighting from the windows. Character is looking forward, not at camera. Do not include any text on the image."

# Frame 4: Spotting Lin Ke in the lobby - aggressive female CEO
gen 4 "Vertical 9:16 portrait composition. Semi-realistic manga style. Over-the-shoulder shot from behind $ZJ_DESC (navy polo, seen from behind), looking toward a stylish Chinese woman in her mid-30s with long black hair, sharp eyes, red lipstick, wearing a power suit, standing near the elevator. She exudes confidence and aggression. Bright modern office lobby. Neither character faces the camera. Do not include any text on the image."

# Frame 5: Wuxia vision - Lin Ke as Emei Sect master
gen 5 "Vertical 9:16 portrait composition. Chinese ink wash style with warm golden tones. A fierce female martial artist in elegant white and silver Emei Sect robes, long flowing black hair, sharp eyes, red lips, holding a thin sword at her side. She stands in a misty bamboo forest with cherry blossoms. Powerful aura radiating from her. Semi-realistic manga aesthetic. She looks to the side, not at camera. Do not include any text on the image."

# Frame 6: DECISION-1 moment - Zhu Jiang sees Lin Ke, decides to greet her
gen 6 "Vertical 9:16 portrait composition. Semi-realistic manga style. Close-up 3/4 view of $ZJ_DESC with navy polo shirt, showing a confident determined expression. His eyes look to the side toward someone off-screen. A slight knowing smile on his face. Dramatic lighting from the side. He does not look at camera. Indoor modern office setting blurred in background. Do not include any text on the image."

# Frame 7: Zhu Jiang walks up to Lin Ke, extends hand confidently
gen 7 "Vertical 9:16 portrait composition. Semi-realistic manga style. Medium two-shot. $ZJ_DESC in navy polo shirt extends his hand for a handshake toward a stylish Chinese woman with long black hair and red lipstick in a power suit. She looks surprised but intrigued. Modern office lobby with bright lighting. Both characters face each other, neither faces the camera. Do not include any text on the image."

# Frame 8: Lin Ke's reaction - slightly impressed but dismissive hair flip
gen 8 "Vertical 9:16 portrait composition. Semi-realistic manga style. Close-up of a stylish Chinese woman in her mid-30s with long flowing black hair mid-flip, sharp eyes, red lipstick, slight smirk. Dynamic hair movement. She looks to the side past the viewer. Bright office lobby background blurred. Dramatic manga-style motion lines for the hair flip. Do not include any text on the image."

# Frame 9: Wuxia vision - sword energy from the hair flip
gen 9 "Vertical 9:16 portrait composition. Chinese ink wash style with golden tones. A female martial artist in white Emei robes performs a lightning-fast sword draw, blade gleaming with energy. Sword qi (energy slash) visible in the air. Dynamic action pose. Misty martial arts setting. She faces to the side, not at camera. Do not include any text on the image."

# Frame 10: Conference room - Ma Ge the investor, bald 50s man
gen 10 "Vertical 9:16 portrait composition. Semi-realistic manga style, warm bright lighting. A modern glass-walled conference room with a long table. A Chinese man in his 50s, completely bald on top, long face, warm squinting smile, wearing a refined gray suit, sits at the head of the table. He has a calm wise demeanor. He gestures welcomingly toward seats. He does not look at camera but looks at someone entering. Do not include any text on the image."

# Frame 11: Wuxia vision - Ma Ge as Wudang elder
gen 11 "Vertical 9:16 portrait composition. Chinese ink wash painting style with warm golden tones. An elderly martial arts master in flowing Wudang Taoist robes (deep blue and white), bald head, serene smile, sitting in meditation pose on a mountain pavilion. He slowly draws a Tai Chi sword. Clouds and pine trees surround him. Peaceful yet powerful atmosphere. He gazes at the sword, not at camera. Do not include any text on the image."

# Frame 12: Zhu Jiang and Lin Ke sitting across in conference room
gen 12 "Vertical 9:16 portrait composition. Semi-realistic manga style. Wide shot of a modern conference room. $ZJ_DESC in navy polo sits on one side of the table. Across from him sits the woman with long black hair and red lipstick in a power suit. At the head sits a bald 50s man in gray suit smiling. Tension between the two younger people is visible. Bright daylight through floor-to-ceiling windows. No one faces camera. Do not include any text on the image."

# Frame 13: Ma Ge proposes the PK - DECISION-2 setup
gen 13 "Vertical 9:16 portrait composition. Semi-realistic manga style. Medium close-up of the bald Chinese man in his 50s (gray suit, warm smile), gesturing with both hands as if proposing something. His expression is kind but calculating. Conference room background. He looks at the people at the table, not at camera. Do not include any text on the image."

# Frame 14: Wuxia vision - arena/lei tai challenge
gen 14 "Vertical 9:16 portrait composition. Chinese ink wash style with dramatic warm golden tones. A grand martial arts arena (lei tai / raised fighting platform) in an ancient tournament setting. Torches blaze around the edges. Two figures face each other across the platform - a young man and a woman warrior. Cheering crowd silhouettes below. Epic dramatic atmosphere. Do not include any text on the image."

# Frame 15: DECISION-2 - Zhu Jiang accepts the challenge with a grin
gen 15 "Vertical 9:16 portrait composition. Semi-realistic manga style. Close-up 3/4 view of $ZJ_DESC in navy polo, showing a bold confident grin. One eyebrow slightly raised. His eyes sparkle with competitive fire. He looks toward the side (at his opponent). Dramatic side lighting in conference room. Manga-style confidence aura. Not facing camera. Do not include any text on the image."

# Frame 16: Demo time - Zhu Jiang presents at screen, gesturing
gen 16 "Vertical 9:16 portrait composition. Semi-realistic manga style. Medium shot from the side. $ZJ_DESC in navy polo standing next to a large presentation screen in a conference room, gesturing at the screen with one hand. He looks focused and passionate. The screen shows a colorful interface (abstract tech UI, no text). Modern bright conference room. He faces the screen, not the camera. Do not include any text on the image."

# Frame 17: Laptop crashes! Blue screen moment
gen 17 "Vertical 9:16 portrait composition. Semi-realistic manga style. Close-up on a laptop screen showing a generic error/crash state (abstract glitch visual, no text). $ZJ_DESC's hands visible on the keyboard, frozen in shock. The screen casts blue light on his face from below. Dramatic tense moment. Do not include any text on the image."

# Frame 18: Lin Ke smirks at the crash
gen 18 "Vertical 9:16 portrait composition. Semi-realistic manga style. Close-up of the woman with long black hair and red lipstick, showing a subtle satisfied smirk. She sits with arms crossed in the conference room. She looks to the side (at the crash scene), not at camera. Slight manga-style amusement sparkle in her eyes. Do not include any text on the image."

# Frame 19: Wuxia vision - "qi deviation" moment
gen 19 "Vertical 9:16 portrait composition. Chinese ink wash style with dramatic red and golden tones. A young martial artist kneeling on the ground, energy swirling chaotically around him like out-of-control qi. Glowing red energy crackling. Other martial artists watching from a distance. Dramatic crisis moment. He faces downward, not at camera. Do not include any text on the image."

# Frame 20: DECISION-3 - Zhu Jiang pulls out phone, eyes determined
gen 20 "Vertical 9:16 portrait composition. Semi-realistic manga style. Dynamic medium shot. $ZJ_DESC in navy polo pulls out his smartphone with a determined intense expression. His other hand pushes the crashed laptop aside. Dramatic lighting, sharp angle. Conference room setting. He looks at the phone screen, not at camera. Speed lines in manga style suggesting swift decisive action. Do not include any text on the image."

# Frame 21: Live coding on phone - fingers flying
gen 21 "Vertical 9:16 portrait composition. Semi-realistic manga style. Extreme close-up of hands holding a smartphone, fingers moving rapidly across the screen. Abstract code-like patterns reflected on the phone surface. Green/blue tech glow. Background blurred - conference room. Intense focused energy. Do not include any text on the image."

# Frame 22: Wuxia vision - unsheathing the sword mid-battle
gen 22 "Vertical 9:16 portrait composition. Chinese ink wash style with dramatic golden/blue tones. A young martial artist draws a gleaming sword from his back in a fluid motion, energy exploding outward in a circular wave. His robes billow dramatically. Translucent modern clothes visible underneath the ancient robes (dual-layer visual). He faces to the side. Do not include any text on the image."

# Frame 23: Demo works again! The crowd (Ma Ge) impressed
gen 23 "Vertical 9:16 portrait composition. Semi-realistic manga style, bright victorious lighting. Medium wide shot. $ZJ_DESC in navy polo holds up his phone triumphantly connected to the presentation screen which now shows a working interface. The bald man in gray suit leans forward with genuine surprised interest. The woman with long hair watches with reluctant respect. Conference room with warm sunlight. No one faces camera. Do not include any text on the image."

# Frame 24: Lin Ke presents her product - polished but aggressive
gen 24 "Vertical 9:16 portrait composition. Semi-realistic manga style. Medium shot of the stylish woman with long black hair and red lipstick standing confidently next to a presentation screen, gesturing dramatically. Her posture is commanding. Slick corporate presentation visible (abstract visuals, no text). The bald man watches from his seat. She faces the screen/audience, not camera. Do not include any text on the image."

# Frame 25: Wuxia vision - Emei sword dance, beautiful but lethal
gen 25 "Vertical 9:16 portrait composition. Chinese ink wash style with silver and violet tones. The female Emei martial artist performs an elaborate sword dance, multiple sword afterimages creating a beautiful flower-like pattern. Her moves are elegant yet deadly. Petals scatter in the wind. Moonlight illumination. She spins to the side, not facing camera. Do not include any text on the image."

# Frame 26: PK over - tense standoff moment between the two
gen 26 "Vertical 9:16 portrait composition. Semi-realistic manga style. Dramatic low-angle two-shot. $ZJ_DESC in navy polo and the woman with long hair in power suit stand facing each other across the conference table. Electric tension between them. The bald man sits between them at the head, hands steepled, observing. Dramatic shadow lighting. Neither faces camera. Do not include any text on the image."

# Frame 27: Ma Ge says he needs to think - cryptic expression
gen 27 "Vertical 9:16 portrait composition. Semi-realistic manga style. Close-up of the bald Chinese man in his 50s, his warm smile now more enigmatic. He touches his chin thoughtfully. His eyes show layers of calculation behind the kindness. Soft office lighting. He looks down and to the side, not at camera. Do not include any text on the image."

# Frame 28: DECISION-4 - Lin Ke offers her card, Zhu Jiang accepts gracefully
gen 28 "Vertical 9:16 portrait composition. Semi-realistic manga style. Medium close-up two-shot. The woman with long black hair extends a business card toward $ZJ_DESC in navy polo. He reaches to accept it with a polite but guarded expression. Their hands nearly touching over the card. Hallway outside conference room, natural lighting. Neither faces camera. Do not include any text on the image."

# Frame 29: Back at his small startup office, night, opening email
gen 29 "Vertical 9:16 portrait composition. Semi-realistic manga style, warm night lighting. Medium shot. $ZJ_DESC in navy polo sits at a messy desk in a small cramped startup office, lit by a laptop screen glow and a desk lamp. He stares at the laptop screen with widening eyes, expression shifting from casual to shocked. Night cityscape visible through a small window behind him. He faces the screen, not camera. Do not include any text on the image."

# Frame 30: Cliffhanger - the mysterious email with rankings
gen 30 "Vertical 9:16 portrait composition. Semi-realistic manga style, dramatic blue-tinged lighting. Extreme close-up of $ZJ_DESC's face, lit by screen glow from below. His eyes wide with a mix of shock and realization. Reflections of data/charts visible in his eyes. His expression says 'everything I thought I knew was wrong'. Deep shadows on half his face. He stares at the screen (off to the side), not at camera. Do not include any text on the image."

echo "=== All frames generated ==="
