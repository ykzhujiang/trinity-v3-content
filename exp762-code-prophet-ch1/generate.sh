#!/bin/bash
# EXP-762 Image Generation Script
# Generates frames using Gemini CLI

OUT_DIR="$HOME/trinity-v3-content/exp762-code-prophet-ch1"
REF_IMG="$HOME/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
cd "$OUT_DIR"

# Character description constants
ZJ_YOUNG="a young Chinese man (27 years old), square-round face, big eyes, short black hair slicked back, short stubble beard, 172cm tall, 80kg sturdy build, wearing a white t-shirt with blue jeans and white sneakers. He looks like the man in the reference photo but younger with better skin."
ZJ_SUIT="a Chinese man (36 years old), square-round face, big eyes, short black hair slicked back, short stubble beard, 172cm tall, 80kg sturdy build, wearing a dark grey suit with white shirt and striped tie. He looks like the man in the reference photo."
XIAOWANG="a chubby round-faced young Chinese man with black thick-rimmed glasses, wearing a red plaid shirt, slightly overweight"
LINYUAN="a thin tall young Chinese man (25 years old) with short neat hair, wearing a simple polo shirt, sharp perceptive eyes"

# Style prefix
STYLE="Semi-realistic manga art style, vibrant colors, bright warm lighting, high quality detailed illustration, vertical 9:16 aspect ratio portrait orientation."

generate() {
  local id=$1
  local prompt=$2
  
  if [ -f "${id}.jpg" ]; then
    echo "SKIP $id (exists)"
    return 0
  fi
  
  echo "GEN $id..."
  
  # Use gemini with image reference
  gemini --model gemini-2.0-flash-exp --output-file "${id}_raw.png" \
    "Generate an image. ${STYLE} ${prompt} IMPORTANT: vertical portrait orientation (9:16), the character should NOT look at the camera, character's gaze should be directed at objects/people within the scene. NO text or words on the image." \
    2>/dev/null
  
  if [ $? -ne 0 ] || [ ! -f "${id}_raw.png" ]; then
    echo "FAIL $id - retrying with different approach..."
    gemini --output-file "${id}_raw.png" \
      "Generate an image. ${STYLE} ${prompt} IMPORTANT: vertical portrait orientation (9:16), the character should NOT look at the camera. NO text on the image." \
      2>/dev/null
  fi
  
  if [ -f "${id}_raw.png" ]; then
    # Convert to JPG, resize to max 800px width
    sips -s format jpeg -s formatOptions 75 "${id}_raw.png" --out "${id}.jpg" --resampleWidth 800 2>/dev/null
    rm -f "${id}_raw.png"
    echo "OK $id ($(du -h ${id}.jpg | cut -f1))"
  else
    echo "FAIL $id"
    return 1
  fi
}

# Frame generation
generate "f01" "Wide shot, slightly overhead angle. A futuristic quantum computing laboratory in 2026 with white walls, blue LED strips, massive quantum computer arrays with glowing elements. ${ZJ_SUIT} stands before a huge holographic screen, fingers dancing on a virtual keyboard. He is focused on his work, not looking at camera."

generate "f02" "Close-up shot. A holographic screen showing scrolling code, data visualizations, and quantum state diagrams. A man's hand hovers over a critical line of code. The screen data streams are accelerating, blue and green light reflects on his concentrated face from the side."

generate "f03" "Medium shot, 45-degree side angle. A lab suddenly bathed in red warning lights. ${ZJ_SUIT} jumps up from his chair, both hands bracing against the control panel. Multiple screens show red error codes and warnings. Alarm lights flash. Dramatic moment."

generate "f04" "Close-up, low angle looking up. Blinding white light erupting from quantum computer arrays. ${ZJ_SUIT} shields his eyes with his arm, white light engulfing the scene. Dramatic, the figure is being consumed by light."

generate "f05" "Overhead bird's-eye view. A college dormitory room with bunk beds (metal frame), desk cluttered with textbooks and instant noodle cups, posters on wall, bright sunlight streaming through window. ${ZJ_YOUNG} lies on the top bunk, eyes just snapping open, sunlight on his face. Morning scene, warm and nostalgic."

generate "f06" "Medium shot, level angle. Inside a college dorm room. ${ZJ_YOUNG} leans over the edge of the top bunk looking down with shock. Below at a desk, ${XIAOWANG} sits in front of a CRT monitor, furiously clicking a mouse, playing World of Warcraft. The room is messy with college stuff. 2010 era."

generate "f07" "Extreme close-up. A hand trembling slightly, holding a Nokia N97 phone. The phone screen shows the date: 2010-06-30. The hand's knuckles are white from gripping too hard. Sharp focus on the phone."

generate "f08" "Medium shot, slight low angle. ${XIAOWANG} has turned around in his chair, pushing up his thick black glasses, a spicy snack stick dangling from his mouth, looking up at the top bunk with a confused but caring expression. College dorm setting, messy desk behind him."

generate "f09" "Wide establishing shot, side angle. A 2010 college dorm desk: old CRT monitor showing Windows XP desktop, a stack of exam prep books, a Kobe Bryant poster on the wall, a red thermos flask, scattered papers. Everything screams 2010 China campus life. Warm nostalgic lighting."

generate "f10" "Medium shot, level. ${ZJ_YOUNG} stands in front of a small mirror above a dorm wash basin, both hands gripping the basin edge, staring at his younger reflection. The reflection shows the same face but smoother skin, shorter stubble, no dark circles. Bathroom/washroom area of dorm."

generate "f11" "Extreme close-up on eyes. A young Chinese man's large expressive eyes, reflected in a mirror. In the reflection you can see his younger face. There's a single tear at the corner of one eye. Emotional, intimate moment. The iris has a warm brown color."

generate "f12" "Wide panoramic shot, overhead angle. A Chinese university campus in summer 2010 - green trees, bicycle shed, students walking in groups, old teaching buildings, basketball court in distance. ${ZJ_YOUNG} walks out of a dormitory building into bright sunshine. Everything is green and warm and hopeful. Nostalgic atmosphere."

generate "f13" "Medium shot from behind. ${ZJ_YOUNG} walks down a tree-lined campus road, hands in jeans pockets, from behind. Tall plane trees on both sides, dappled sunlight. Students on bicycles pass by. A girl carries textbooks. 2010 Chinese campus atmosphere. Warm golden light."

generate "f14" "Close-up, side profile. ${ZJ_YOUNG} in profile view, a knowing smirk on his lips, eyes showing quiet confidence - the look of someone who knows the future. Campus greenery blurred in background. Warm lighting. He looks to the side, not at camera."

generate "f15" "Wide shot, slight low angle. A busy campus plaza with many students. ${ZJ_YOUNG} has stopped walking in the middle of the plaza, both hands clutching his head in sudden pain. Other students walk past obliviously. His posture is hunched with pain. Bright daylight."

generate "f16" "Extreme close-up. A young man's face with eyes squeezed tightly shut in pain, veins visible on temple, sweat droplets on forehead. Dark background suggesting his closed-eye vision. Intense, dramatic."

generate "f17" "Wide panoramic shot, first-person POV. A stunning data visualization of a university campus - buildings become semi-transparent revealing network cables and WiFi signals as blue waves. People become glowing data nodes connected by colorful relationship lines. The sky becomes a giant data dashboard. Like a holographic overlay on reality. Blues, greens, golds. Beautiful and awe-inspiring."

generate "f18" "Medium shot. ${ZJ_YOUNG} crouches on the ground in a campus plaza, one hand on his knee, the other pressing his temple. His expression is pained but his eyes are shining with excitement. A few students in the background look at him curiously. Bright daylight."

generate "f19" "Close-up. ${ZJ_YOUNG} has just opened his eyes wide, vision returning to normal. A thin trickle of blood from one nostril. His expression mixes pain, shock, and excitement. Campus background blurred. Dynamic moment."

generate "f20" "Medium shot. ${ZJ_YOUNG} sits on a campus bench, dabbing his nosebleed with a tissue in one hand, the other hand pressing his forehead. Despite the nosebleed, he's smiling - a wry, amazed, incredulous smile. Trees and warm sunlight around him."

generate "f21" "Wide establishing shot, slightly overhead. A 2010 Chinese street-side internet cafe at night - neon sign reading '星际网吧', bicycles parked outside, air conditioner units humming, warm light spilling from glass door. ${ZJ_YOUNG} stands outside looking at it. Urban China 2010 atmosphere."

generate "f22" "Medium shot, level. Inside a 2010 internet cafe - hazy with cigarette smoke, rows of CRT monitors, young men wearing headphones gaming intensely. ${ZJ_YOUNG} sits at a corner spot with a dusty old computer. The guy next to him is yelling into a headset. Atmospheric, authentic 2010 Chinese internet cafe."

generate "f23" "Close-up on hands. A young man's hands flying across an old keyboard, the CRT monitor in background shows a simple e-commerce website from 2010 era. Focused, skilled typing. Warm indoor lighting."

generate "f24" "Wide panoramic POV shot. A stunning code-visualization of a website architecture - the website becomes a transparent 3D building with layers: frontend (glass), backend (steel), database (vault). Data flows like illuminated pipes connecting modules. One pipe is glowing RED - indicating a vulnerability. Beautiful tech-visualization art. Blues, greens, with one alarming red element."

generate "f25" "Medium shot. ${ZJ_YOUNG} opens his eyes at a computer desk in an internet cafe, nosebleed again, but his expression is one of satisfied confirmation. He wipes blood with the back of his hand casually. A knowing smile. CRT monitor glowing in background."

generate "f26" "Close-up. ${ZJ_YOUNG} sits at the computer, chin resting on one hand, staring at the screen thoughtfully. The screen shows a text editor with some code lines. His expression is contemplative, weighing options. Side lighting from the monitor. He looks at the screen, not at camera."

generate "f27" "Split-screen artistic composition. LEFT side dark moody: silhouette of a young man hunched over a computer in shadows, hacking. RIGHT side bright warm: the same young man in sunlight, making a phone call with a friendly expression. Visual metaphor for black-hat vs white-hat choice. Dramatic contrast."

generate "f28" "Medium shot. ${ZJ_YOUNG} leans back in his internet cafe chair, a confident smile on his face. His fingers are already typing on the keyboard - composing an email. The screen shows an email being written. Warm determination in his posture. He looks at the screen."

generate "f29" "Medium shot, level. A simple Chinese roadside barbecue stall (大排档) at dusk - plastic tables and chairs, beer bottles and meat skewers. ${ZJ_YOUNG} sits across from ${LINYUAN}. The table is loaded with skewers and beer. Warm golden evening light. Casual, friendly atmosphere."

generate "f30" "Close-up. ${LINYUAN} - thin face, sharp eyes now soft with gratitude, both hands gripping a beer glass, eyes slightly reddened with emotion. He's looking to the side at his companion. Evening light. Emotional moment."

generate "f31" "Medium shot, two people at a table. At the barbecue stall, sunset behind them casting warm orange-golden light. ${ZJ_YOUNG} raises his beer glass casually, waving his other hand dismissively, easy smile on his face. But his eyes are sharp and observant, studying the other person. Warm evening atmosphere."

generate "f32" "Medium shot. At the barbecue stall, ${ZJ_YOUNG} is animatedly gesturing with a meat skewer while talking, making exaggerated hand movements explaining something. ${LINYUAN} across the table has his mouth slightly open in amazement. Beer bottles and food on table. Lively, energetic scene."

generate "f33" "Close-up sequence-style shot. ${LINYUAN}'s face showing three stages of reaction in one artistic frame: confused (eyebrows furrowed) → surprised (eyes widening) → excited (eyes bright, leaning forward). Warm barbecue stall lighting. Expressive manga-style emotion progression."

generate "f34" "Medium shot. ${LINYUAN} has stood up from his plastic chair at the barbecue stall, one hand slapping the table (beer bottles wobbling), the other hand pointing at ${ZJ_YOUNG} who remains seated and calm. Night has fallen, street lights and barbecue grill glow. Dramatic, excited moment."

generate "f35" "Medium shot. ${ZJ_YOUNG} sits relaxed at the barbecue stall, slightly raising his beer glass with a mysterious, knowing smile. The gesture is understated but confident. Night barbecue scene, warm lighting from hanging bulbs. He looks at his glass, not at camera."

generate "f36" "Wide establishing shot. A Chinese university campus at night - warm yellowish street lamps line a tree-shaded path, distant dormitory buildings with lit windows, a crescent moon. ${ZJ_YOUNG} walks alone on the path, a solitary peaceful figure. Gardenia flowers visible. Warm, tranquil, summer night."

generate "f37" "Medium shot. Dimly lit dorm hallway. ${ZJ_YOUNG} pushes open the dorm door. Inside, ${XIAOWANG} has turned from his computer to look at Zhu Jiang with a suspicious, scrutinizing expression. His round face is unusually serious. The dorm is lit by the computer screen's glow."

generate "f38" "Close-up, two faces. ${ZJ_YOUNG} leans against the bunk bed ladder, looking down at ${XIAOWANG} who sits in his chair looking up. Their eyes meet in a tense moment. Dorm room, night, computer screen backlighting. Both faces clearly different - one square-jawed with stubble, one round with glasses."

generate "f39" "Medium shot. ${ZJ_YOUNG} walks over laughing, patting ${XIAOWANG}'s shoulder with one hand while snatching a snack packet from the desk with the other. His expression is playfully mischievous. Casual, brotherly moment in the dorm."

generate "f40" "Medium shot. ${XIAOWANG} reaches up trying to grab back his snack, mouth wide open in outrage, but ${ZJ_YOUNG} (only his arm visible) holds it up high out of reach. Comic moment. ${XIAOWANG}'s expression is hilariously indignant. Dorm room, warm lighting."

generate "f41" "Wide shot. Dorm room at night, moonlight through window. ${XIAOWANG} is asleep on the bottom bunk (visible snoring pose). ${ZJ_YOUNG} lies on the top bunk, hands behind his head, staring up at the ceiling with a contemplative, determined expression. Quiet, peaceful night scene."

generate "f42" "Medium shot. ${ZJ_YOUNG} on the top bunk suddenly turns on his side, face contorted in sudden pain, eyes squeezing shut, sweat appearing on forehead. Moonlit dorm room. Dramatic shift from peaceful to tense."

generate "f43" "First-person POV, looking down from top bunk. In darkness, the sleeping figure on the bottom bunk is visible as a silhouette - but wrapped around him is a glowing RED thread/line, pulsing like a living vein. The red line extends out through the window into the darkness beyond. Eerie, supernatural, unsettling. Dark with red glow."

generate "f44" "Extreme close-up. ${ZJ_YOUNG}'s face, eyes snapping wide open in terror, drenched in sweat. One hand grips the bed rail so hard the knuckles are white. Moonlight catches the fear in his wide eyes. Dramatic, intense."

generate "f45" "Wide atmospheric shot. View through a dorm window at night - campus nightscape under cold moonlight. But on the window glass, there's a faint reflection of a red glowing line extending into the dark sky. Eerie, mysterious, cliffhanger ending. Beautiful but unsettling."

echo ""
echo "=== GENERATION COMPLETE ==="
ls -la *.jpg 2>/dev/null | wc -l
echo "frames generated"
du -sh . 2>/dev/null
