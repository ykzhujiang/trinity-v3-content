#!/bin/bash
set -e
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
OUT="/Users/ahzhu_agent/trinity-v3-content/exp-745-silicon-hunt-ch3"

# Zhu Jiang appearance description for every prompt
ZJ="a Chinese man in his early 30s with short black hair swept back, light stubble and short goatee, lean athletic build, sharp jawline, warm brown eyes, slightly thick eyebrows"

gen() {
  local num=$1
  local prompt=$2
  local fname="f$(printf '%02d' $num).png"
  echo "=== Generating frame $num ==="
  uv run "$SCRIPT" -i "$REF" --prompt "$prompt" --filename "$OUT/$fname" --resolution 1K 2>&1 | tail -3
  echo "=== Frame $num done ==="
}

# ACT 1: Morning Hotel Room (frames 1-6)
gen 1 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. CLOSE-UP shot: ${ZJ}, wearing a white T-shirt and dark grey sweatpants, crouching near a wooden hotel wardrobe. He discovers a tiny blinking red light (hidden camera) behind the wardrobe frame. His expression is alert and tense, eyes focused on the tiny device, viewed from 3/4 angle, NOT facing camera. Luxury hotel room, dim amber morning light through curtains. Cinematic composition, detailed."

gen 2 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. EXTREME CLOSE-UP of hands: ${ZJ}'s hands carefully holding a smartphone, fingers tapping rapidly on the screen showing encrypted data transfer interface with progress bars. White T-shirt sleeve visible. Warm amber hotel room lighting. The hands look tense but precise. Shot from above looking down at hands and phone. NOT facing camera."

gen 3 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. MEDIUM shot: ${ZJ} in white T-shirt and grey sweatpants, sitting on hotel bed edge, looking down at phone with a wry half-smile. Phone screen glows blue on his face. Morning light through curtains creates golden streaks. Hotel room interior with warm wood tones. 3/4 angle view, character looking at phone NOT at camera. Cinematic."

gen 4 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. CLOSE-UP of smartphone screen showing a chat interface with Chinese text messages. The screen shows a conversation with contact name '沈若棋'. Clean modern messaging UI. Warm ambient light reflecting on phone screen. Shot from character's POV looking at own phone. No faces visible."

gen 5 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. MEDIUM shot: ${ZJ} in white T-shirt, standing by hotel window, looking out at Shanghai skyline through sheer curtains. Morning golden light silhouettes him partially. His expression is contemplative with a slight sardonic smile. 3/4 back view, looking out the window NOT at camera. City visible through curtains. Cinematic composition."

gen 6 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. WIDE establishing shot: Luxury hotel corridor with marble floors and golden warm lighting. ${ZJ} walks toward the elevator in a sharp dark grey suit jacket over a black turtleneck sweater, looking confident but alert. Shot from behind at slight angle, walking away from camera. Elegant interior, Hong Kong film aesthetic."

echo "=== ACT 1 Complete ==="

# ACT 2: Rotating Restaurant Lunch (frames 7-12)
gen 7 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. WIDE establishing shot: Rooftop rotating restaurant with floor-to-ceiling windows, Shanghai city skyline visible outside. Modern luxury interior with about 15 people seated at round tables. Warm golden sunlight floods in. Elegant white tablecloths, crystal glasses. Shot from entrance perspective showing the panoramic view. No one facing camera. Cinematic."

gen 8 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. MEDIUM shot: ${ZJ} in dark grey suit jacket and black turtleneck, being guided to his seat by a waiter. He notices his seat is directly opposite a silver-haired Western man (Victor Chen, tall, slim, wearing grey three-piece suit with gold tie clip). Both men's eyes meet briefly across the table. Shot from side angle. Neither facing camera. Elegant restaurant setting."

gen 9 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. CLOSE-UP: A sleek tablet on the table next to wine glasses and silverware, its screen subtly showing a recording waveform indicator. ${ZJ}'s hand rests near it, fingers slightly tensed. Focus on the tablet and hand, blurred restaurant background with warm bokeh lights. Detailed, cinematic."

gen 10 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. MEDIUM TWO-SHOT: Victor Chen (silver-haired Western man, mid-50s, sharp features, grey three-piece suit, gold tie clip) gestures elegantly while speaking. Across the table, ${ZJ} in dark grey suit and black turtleneck listens with calm composure, slight smile. Between them: wine glasses, fine dining plates. Both in profile/3/4 view, facing each other NOT camera. Warm restaurant lighting."

gen 11 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. CLOSE-UP on ${ZJ}'s face in 3/4 profile, eyes slightly narrowed with intelligence, a subtle confident smirk forming. He's thinking strategically. Dark grey suit collar visible. Warm golden light from restaurant windows creates rim lighting on his face. Sharp focus on expression. NOT looking at camera, looking slightly to the side as if at someone across the table."

gen 12 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. MEDIUM shot: ${ZJ} speaking at the lunch table, hands gesturing expressively as he explains something technical. Victor Chen across from him leans forward with genuine interest, chin resting on clasped hands. Other diners visible in soft focus background. Warm sunlight. 3/4 angle on both, NOT facing camera."

echo "=== ACT 2 Complete ==="

# Decision 5 (frame 13)
gen 13 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. DRAMATIC CLOSE-UP: ${ZJ}'s eyes in sharp focus, reflecting the restaurant's golden light. His expression shows strategic calculation - one eyebrow slightly raised, eyes sharp and assessing. The reflection of Victor Chen can be faintly seen in his eyes. Dark grey suit. Ultra-detailed, cinematic. NOT looking at camera, looking to the side."

echo "=== Decision 5 ==="

# ACT 3: Post-lunch & Old K encounter (frames 14-20)
gen 14 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. MEDIUM shot: Victor Chen (silver-haired, grey three-piece suit, gold tie clip) stands up from his chair with a genuine warm smile, reaching across the table to shake ${ZJ}'s hand. Victor's expression has shifted from evaluating to admiring. Warm restaurant light. Side angle view, neither facing camera."

gen 15 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. WIDE shot: Elegant restaurant restroom with dark marble walls, golden fixtures, large mirror. ${ZJ} in dark grey suit stands at the sink washing hands. In the mirror's reflection, a middle-aged Chinese man (Old K: grey-streaked hair, dark casual blazer, open-collar white shirt, medium build, round face - clearly different from Zhu Jiang) appears behind him. Tense atmosphere. Mirror composition. Neither facing camera directly."

gen 16 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. CLOSE-UP through mirror: Old K (middle-aged Chinese man, grey-streaked hair, round face, dark casual blazer over white open-collar shirt) reflected in the restroom mirror, leaning slightly forward, speaking in a low voice. His expression is serious but not threatening. Marble walls and golden lighting reflected. NOT looking at camera, looking at Zhu Jiang's reflection."

gen 17 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. LOW ANGLE shot: Old K (grey-streaked hair, dark blazer) pushing open the restroom door and walking away, seen from behind at low angle. The heavy door frames him. Marble corridor beyond. Mysterious atmosphere. Walking away from camera. Dramatic lighting from corridor."

gen 18 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. MEDIUM shot: ${ZJ} back at his restaurant seat, looking down at where his dessert plate was - now empty, cleared by the waiter. A small bewildered/amused expression on his face. One hand resting on the tablecloth where the plate used to be. 3/4 angle, NOT facing camera. Warm ambient light."

# Decision 6 (frame 19)
gen 19 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. MEDIUM shot: ${ZJ} in dark grey suit standing in the hotel elevator alone, leaning against the wall, looking down at his phone with a conflicted expression. The elevator's metallic walls create reflections. Warm amber ceiling light. He's deciding something important. 3/4 angle, NOT facing camera. Phone screen glow on his face."

gen 20 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber tones. Vertical 9:16 portrait. CLOSE-UP of ${ZJ}'s hand pressing the phone's power button to lock the screen, decisively. The elevator number display shows floor changing. Sharp focus on the determined hand gesture. Dark suit sleeve. Metallic elevator interior. Cinematic detail shot."

echo "=== ACT 3 Complete ==="

# ACT 4: Evening analysis (frames 21-28)
gen 21 "Semi-realistic manga illustration, warm Hong Kong noir style, golden amber and dark blue tones. Vertical 9:16 portrait. WIDE shot: Hotel room at night. ${ZJ} back in white T-shirt and grey sweatpants, sitting cross-legged on the bed with laptop open. Shanghai night skyline glows through the large window behind him. Multiple browser tabs open on laptop screen. Blue laptop glow mixed with city lights. 3/4 angle, NOT facing camera, looking at screen."

gen 22 "Semi-realistic manga illustration, warm Hong Kong noir style, blue-gold night tones. Vertical 9:16 portrait. EXTREME CLOSE-UP: Laptop screen showing technical data - NFC signal analysis with waveforms and Chinese text labels. A small ID card icon with government authentication chip indicator. Green verification marks. Detailed technical UI. Shot from character's POV."

gen 23 "Semi-realistic manga illustration, warm Hong Kong noir style, blue-gold night tones. Vertical 9:16 portrait. CLOSE-UP: ${ZJ}'s face illuminated by laptop screen in the dark room. His expression is one of realization and surprise - eyes widening slightly, mouth slightly parted. Blue-white screen light on his face, Shanghai night city lights warm orange behind him through window. 3/4 profile, NOT facing camera."

gen 24 "Semi-realistic manga illustration, warm Hong Kong noir style, dark dramatic tones. Vertical 9:16 portrait. MEDIUM shot: ${ZJ} in white T-shirt, leaning back from the laptop, running one hand through his hair. His expression is troubled and contemplative. The laptop screen casts blue light. City nightscape through window. He's processing disturbing information. 3/4 angle, NOT facing camera."

gen 25 "Semi-realistic manga illustration, warm Hong Kong noir style, dark ominous tones with red accent. Vertical 9:16 portrait. CLOSE-UP of laptop screen: An email interface showing an anonymous message. Chinese text visible. A world map trace route showing 7 node hops, the final node highlighted in red pointing to Beijing. Dark, threatening atmosphere. Technical detail. Shot from POV."

gen 26 "Semi-realistic manga illustration, warm Hong Kong noir style, dark blue-red dramatic tones. Vertical 9:16 portrait. EXTREME CLOSE-UP: ${ZJ}'s hands on the laptop keyboard. One hand is slightly trembling - visible micro-shake. White T-shirt sleeves. Blue screen glow illuminates the hands. Tense, visceral detail shot. Focus on the trembling fingers. Cinematic."

gen 27 "Semi-realistic manga illustration, warm Hong Kong noir style, transitioning from fear to determination. Vertical 9:16 portrait. CLOSE-UP: ${ZJ}'s face transforms from shock to cold determination. His jaw clenches, eyes narrow with focus. Blue laptop glow and warm city lights create split lighting on his face. The fear is being replaced by resolve. 3/4 profile, NOT facing camera. Powerful character moment."

gen 28 "Semi-realistic manga illustration, warm Hong Kong noir style, golden-blue night tones. Vertical 9:16 portrait. WIDE establishing shot: ${ZJ} in white T-shirt sitting in an armchair by the large hotel window, laptop on his knees, typing rapidly. Shanghai's glittering night skyline stretches behind him - the Bund, Oriental Pearl Tower in warm golden lights. He's small against the vast cityscape. Working alone against a conspiracy. NOT facing camera, looking at screen. Cinematic."

echo "=== ACT 4 Complete ==="

# ACT 5: Li Hao message & cliffhanger (frames 29-34)
gen 29 "Semi-realistic manga illustration, warm Hong Kong noir style, tense blue tones. Vertical 9:16 portrait. CLOSE-UP: Phone screen lighting up on the desk next to the laptop. WeChat notification visible with contact name '李昊' and a preview of Chinese text message. The phone's glow contrasts with the dark room. Laptop screen blurred in background. Detailed, sharp focus on phone. POV shot."

gen 30 "Semi-realistic manga illustration, warm Hong Kong noir style, suspicious tense tones. Vertical 9:16 portrait. CLOSE-UP: ${ZJ}'s face reading the phone message, expression shifting to suspicion and alertness. His eyes narrow, one corner of his mouth tightens. He realizes something is wrong. Blue-white phone glow on his face, dark room. 3/4 profile, NOT facing camera. Sharp cinematic focus."

gen 31 "Semi-realistic manga illustration, warm Hong Kong noir style, dark contemplative tones. Vertical 9:16 portrait. MEDIUM shot: ${ZJ} in white T-shirt, sitting on the edge of the bed, holding the phone in one hand and looking at the laptop screen simultaneously. Two sources of information, two layers of deception. Split blue-warm lighting. City lights through window. Tense body language, slightly hunched forward. 3/4 angle, NOT facing camera."

gen 32 "Semi-realistic manga illustration, warm Hong Kong noir style, dramatic golden-dark tones. Vertical 9:16 portrait. WIDE CINEMATIC shot: ${ZJ} stands at the hotel window, white T-shirt, one hand on the glass. His silhouette against the vast Shanghai night skyline. The city below is beautiful and dangerous. His reflection is faintly visible in the glass. Contemplating tomorrow - walking into the lion's den. NOT facing camera, back/3/4 view. Moody, atmospheric. Epic scale."

gen 33 "Semi-realistic manga illustration, warm Hong Kong noir style, intense dark amber. Vertical 9:16 portrait. EXTREME CLOSE-UP: ${ZJ}'s eyes reflected in the hotel window glass, with Shanghai's city lights bokeh behind the reflection. His eyes show a mixture of fear, determination, and intelligence. Just the eyes and bridge of nose visible. Hyper-detailed. NOT looking at camera, looking through the window at the city."

gen 34 "Semi-realistic manga illustration, warm Hong Kong noir style, fade to dark with golden accent. Vertical 9:16 portrait. ARTISTIC shot: The Shanghai night skyline seen through the hotel window, with ${ZJ}'s ghostly reflection overlaid. The Oriental Pearl Tower glows golden. Dark vignette framing. The image fades to darkness at the edges. Ominous, beautiful, cliffhanger feeling. Cinematic end frame."

echo "=== ALL FRAMES COMPLETE ==="
