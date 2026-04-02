#!/bin/bash
# EXP-768-fix: Regenerate all 46 frames with correct character likeness
# Character anchor: 络腮胡、黑色短发向后梳、大眼睛不戴眼镜、172cm/80kg偏壮商务型体型、自信沉稳气质
# All frames 9:16 vertical, bright warm tones, no character facing camera

set -e
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
OUT="/Users/ahzhu_agent/trinity-v3-content/exp768-infinite-restart/images"

CHAR="A Chinese man in his early 30s with a short stubbly beard (络腮胡), black hair slicked back, big expressive eyes without glasses, 172cm/80kg sturdy build, confident and composed demeanor. The character should NOT face the camera - his gaze should be directed at objects or other characters in the scene, never toward the viewer."

gen() {
  local fname="$1"
  local prompt="$2"
  echo ">>> Generating $fname..."
  uv run "$SCRIPT" \
    --prompt "$prompt" \
    --filename "${OUT}/${fname}" \
    -i "$REF" \
    --resolution 1K 2>&1 | tail -2
  # Convert to JPG quality 78 and resize to max 800px wide
  if [ -f "${OUT}/${fname}" ]; then
    local tmp="${OUT}/_tmp_${fname}"
    if command -v magick &>/dev/null; then
      magick "${OUT}/${fname}" -resize 800x -quality 78 -interlace Plane "${OUT}/${fname%.png}.jpg" 2>/dev/null && rm -f "${OUT}/${fname}"
    fi
  fi
  echo "    Done: $fname"
}

# FRAME 01 - Morning wakeup
gen "frame-01-morning-wakeup.jpg" "Vertical 9:16 manga-realistic style illustration. ${CHAR} He is sitting up in bed, stretching, morning sunlight streaming through curtains. Bedroom scene, medium shot, eye-level angle. He looks to the side at an alarm clock. Warm bright morning tones, clean modern bedroom. The man is wearing a casual grey t-shirt. Cinematic lighting, detailed illustration."

# FRAME 02 - Mirror confidence
gen "frame-02-mirror-confidence.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} He is looking at himself in a bathroom mirror (shown through mirror reflection), fixing his hair with one hand. He wears a white dress shirt being buttoned up. Bathroom with bright lighting. Medium shot through mirror. He looks at his own reflection, NOT at viewer. Bright clean tones."

# FRAME 03 - Car ride
gen "frame-03-car-ride.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} sitting in the back seat of a luxury sedan, looking out the window at a modern city CBD skyline with glass skyscrapers. Side profile close-up, city reflections on car window. He wears a dark navy suit. Warm sunlight through window. Cinematic depth."

# FRAME 04 - Meeting room
gen "frame-04-meeting-room.jpg" "Vertical 9:16 manga-realistic style. A high-floor meeting room with floor-to-ceiling glass walls showing a city panorama. ${CHAR} in dark navy suit stands extending his hand for a handshake. Across the long conference table sits an older Chinese businessman (50s, slicked-back grey hair, gold ring on finger, expensive suit) flanked by two assistants. Wide angle shot. Bright natural light from windows. Characters look at each other, not at camera."

# FRAME 05 - Document slam
gen "frame-05-document-slam.jpg" "Vertical 9:16 manga-realistic style. Close-up shot of a manila folder sliding across a polished conference table. Low angle, shallow depth of field. In the background blur, hands of a businessman pushing the folder. Dramatic lighting from above. Bright but tense atmosphere."

# FRAME 06 - Angry exit
gen "frame-06-angry-exit.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in dark navy suit pushing open a glass door of a meeting room, walking out with controlled anger. Shot from inside the room looking out. His back is partially turned. In the background blur, the older businessman smirks slightly. Medium shot. Bright office lighting."

# FRAME 07 - Car impact
gen "frame-07-car-impact.jpg" "Vertical 9:16 manga-realistic style. Dramatic scene on a crosswalk - a car approaching with headlights blazing. Low angle looking up, motion blur. The perspective is from the pedestrian's viewpoint seeing the car coming. Dynamic action lines, dramatic impact moment. Bright daylight but dramatic contrast."

# FRAME 08 - Reset flash
gen "frame-08-reset-flash.jpg" "Vertical 9:16 abstract digital art. A time-reset visual effect - white flash expanding from center, digital glitch lines, the number 07:00 in large monospace font floating in a void of purple and blue digital distortion. Abstract, no people. Clean and striking."

# FRAME 09 - Wakeup deja vu
gen "frame-09-wakeup-deja-vu.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in grey t-shirt bolting upright in bed, sweating, hand on chest checking for injuries. Same bedroom as frame 01 but now with dramatic morning light cutting across. His phone screen shows 7:00 AM glowing. Medium shot, he looks at his own hands. Bright but with slight tension in lighting."

# FRAME 10 - Same breakfast / office lobby
gen "frame-10-same-breakfast.jpg" "Vertical 9:16 manga-realistic style. Modern office lobby. ${CHAR} in dark suit stops walking, turning to look at a young male assistant (different face - round, younger, smaller build) holding a tablet. Over-the-shoulder shot from behind the assistant looking at the protagonist. Bright modern office with glass and steel. The protagonist has a puzzled expression."

# FRAME 11 - Prepared counter
gen "frame-11-prepared-counter.jpg" "Vertical 9:16 manga-realistic style. Same high-floor meeting room. ${CHAR} in dark navy suit confidently places documents on the conference table, looking at the older businessman across the table. Medium shot. The older businessman raises an eyebrow in surprise. Bright natural lighting from floor-to-ceiling windows."

# FRAME 12 - Linwei's secret
gen "frame-12-linwei-secret.jpg" "Vertical 9:16 manga-realistic style. Extreme close-up reaction shot of ${CHAR} face, lit by harsh single overhead light. His big eyes are wide with shock and betrayal. He is looking down at a document (partially visible at bottom of frame). Dramatic top lighting creating shadows. His expression shows disbelief and pain."

# FRAME 13 - Loop 2 death
gen "frame-13-loop2-death.jpg" "Vertical 9:16 manga-realistic style. Overhead/bird's eye view of a meeting room, reality warping and distorting like a time vortex. Abstract swirling effect around the edges. The conference table and chairs are visible but being pulled into a spiral distortion. Purple and blue time-warp colors. Surreal and dramatic."

# FRAME 14 - Wakeup determined
gen "frame-14-wakeup-determined.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} sitting on the edge of a bed, elbows on knees, staring intensely at his own palms. Side low-angle shot. Morning light from side window creates dramatic shadows. His expression is pure determination. He wears a dark tank top. On the nightstand, a notebook is open. Warm but intense tones."

# FRAME 15 - Following Linwei
gen "frame-15-following-linwei.jpg" "Vertical 9:16 manga-realistic style, film noir lighting. Underground parking garage. ${CHAR} wearing a hoodie and jeans, cap pulled low, hiding behind a concrete pillar. In the distance, a professional Chinese woman (30s, long hair, business attire) walks toward a silver sedan. Long shot, dramatic shadows from overhead lights. He watches her from behind the pillar, not facing camera."

# FRAME 16 - Cafe spying
gen "frame-16-cafe-spying.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in hoodie sitting by a cafe window, pretending to look at his phone. Through the glass reflection, across the street, a Chinese woman and a man in a suit are having a tense conversation. Medium shot, glass reflections create layers. Warm cafe lighting inside, cooler tones outside. He looks sideways through the window."

# FRAME 17 - Overheard shock
gen "frame-17-overheard-shock.jpg" "Vertical 9:16 manga-realistic style. Extreme close-up of ${CHAR} face pressed against a wall in a corridor, eyes wide with shock at what he's hearing. Dramatic diagonal shadow cuts across his face. His expression shows horror and realization. He is looking to the side (toward a door). Dark moody corridor with a sliver of light from a doorway."

# FRAME 18 - Stairway fall
gen "frame-18-stairway-fall.jpg" "Vertical 9:16 manga-realistic style. Dynamic overhead shot of a spiral staircase, a person falling backward through it, motion blur. The perspective looks straight down the spiral. Action lines and motion effects. Dramatic vertigo-inducing composition. Bright stairwell with white walls but dramatic motion."

# FRAME 19 - Planning wall
gen "frame-19-planning-wall.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in casual clothes standing in a living room, looking at a wall covered with sticky notes, red string connecting them, timeline and character relationship diagrams. Wide angle shot, warm lamp light mixed with dark room atmosphere. His back is partially to us as he studies the wall. The wall has Chinese text on sticky notes. Detective/investigation board feel."

# FRAME 20 - Multiple paths
gen "frame-20-multiple-paths.jpg" "Vertical 9:16 manga-realistic style. Split-screen/multi-panel composition showing 4 different scenarios in one image: top-left: a meeting room scene, top-right: following someone in a parking lot, bottom-left: hacking at a computer in a dark room with green screen glow, bottom-right: observing a hospital from outside. All featuring the same Chinese man with stubbly beard and slicked-back hair in different outfits. Stylized panel dividers."

# FRAME 21 - Server room
gen "frame-21-server-room.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in dark casual clothes crouching in a server room, illuminated by green and blue LED lights from server racks. He types on a laptop placed on a server rack. Low angle shot. Green-tinted lighting from server LEDs. He looks at the laptop screen, not at camera. Tech/cyberpunk atmosphere but clean and clear."

# FRAME 22 - Hospital truth
gen "frame-22-linwei-hospital.jpg" "Vertical 9:16 manga-realistic style. View from outside a hospital at night. Through a lit window, a Chinese woman (30s) sits holding the hand of an elderly woman in a hospital bed. ${CHAR} watches from the street below, looking up at the window. Cool blue exterior, warm yellow hospital interior light contrast. Emotional, cinematic long shot."

# FRAME 23 - Comedy predict
gen "frame-23-comedy-predict.jpg" "Vertical 9:16 manga-realistic style, bright and comedic. Modern bright office. ${CHAR} in a sharp suit, smiling smugly with one hand raised, pointing as if predicting what someone is about to say. A young male assistant (different face - round, younger) stands frozen with mouth half-open in shock. Medium shot, bright cheerful office lighting. Comedy scene, exaggerated expressions. Chinese text bubble: 赵鹏那边确认了，下午两点，38层会议室，对吧？"

# FRAME 24 - Xiaochen freaks out
gen "frame-24-comedy-predict2.jpg" "Vertical 9:16 manga-realistic style, bright comedy. Office scene. A young Chinese male assistant (round face, younger, smaller build) clutches a tablet to his chest and backs away two steps, looking terrified/amazed. ${CHAR} in suit is laughing, unable to contain himself. Bright warm lighting, comedic atmosphere. Exaggerated manga-style shock expression on the assistant. Chinese text: 老板你……怎么知道？？？"

# FRAME 25 - Intelligence montage
gen "frame-25-montage-intel.jpg" "Vertical 9:16 manga-realistic style. Dynamic montage composition of 4 scenes stitched together: 1) laptop screen showing server logs, 2) official business registration documents, 3) a recording device on a table capturing conversation, 4) two men meeting in a park. All connected by geometric lines suggesting a conspiracy map. Bright, clear, information-dense visual."

# FRAME 26 - Stock joke
gen "frame-26-stock-joke.jpg" "Vertical 9:16 manga-realistic style, comedic warm scene. ${CHAR} in casual home clothes sitting at a desk, looking at a computer screen showing a stock chart (K-line chart going down). He has a bitter/ironic smile, one hand on forehead. Warm desk lamp lighting. Cozy study room. He looks at the screen, not at camera. Humorous resigned expression."

# FRAME 27 - Confident entrance
gen "frame-27-confident-entrance.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in a sharp dark suit walking into a meeting room, shot from low angle looking up (hero shot). Backlit by floor-to-ceiling windows creating a dramatic silhouette with lens flare. His stride is confident and powerful. He looks ahead into the room. Bright dramatic lighting, cinematic."

# FRAME 28 - Evidence reveal
gen "frame-28-evidence-reveal.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} standing at a conference table, laying out photos and documents one by one. Medium shot. Across the table, the older businessman (50s, grey hair) starts to look worried. Power dynamic shift visible in body language. Bright meeting room with city views. The protagonist looks at his opponent, not at camera."

# FRAME 29 - Zhao counter
gen "frame-29-zhao-counter.jpg" "Vertical 9:16 manga-realistic style. Close-up of an older Chinese businessman (50s, grey slicked-back hair, gold ring, expensive suit) with cold calculating eyes. He leans back in his chair with fingers interlocked. Cold blue-tinted lighting on his face. Behind him through glass, two large bodyguards are visible in silhouette. He stares across the table (not at camera). Menacing corporate villain feel."

# FRAME 30 - Bigger conspiracy
gen "frame-30-bigger-conspiracy.jpg" "Vertical 9:16 manga-realistic style. Over-the-shoulder shot from behind ${CHAR} looking at a large screen display showing a corporate organization chart with Chinese text - multiple subsidiary companies connected by lines, with one box highlighted in red labeled 待收购标的. The chart shows a sprawling tech conglomerate. The room is dim, screen is bright. Dramatic reveal moment."

# FRAME 31 - Bodyguard escort
gen "frame-31-bodyguard-escort.jpg" "Vertical 9:16 manga-realistic style. Office corridor, two large bodyguards flanking ${CHAR}, gripping his arms and walking him out. Shot from medium distance. Overhead lighting creates pools of light and shadow. ${CHAR} walks calmly despite being restrained, showing he's not afraid. He looks forward down the corridor, not at camera. Clean corporate hallway."

# FRAME 32 - Tomorrow quip
gen "frame-32-tomorrow-quip.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} looking back over his shoulder with a knowing smile as he's being led to an elevator. Close-up of his face in profile/three-quarter view. His expression is calm, amused, almost mocking. Shallow depth of field, soft corridor background. He looks back at someone behind him, not at camera. Cinematic lighting."

# FRAME 33 - Zhao confused
gen "frame-33-zhao-confused.jpg" "Vertical 9:16 manga-realistic style. The older businessman (50s, grey hair, expensive suit) standing at a meeting room doorway, his expression shifting from triumph to confusion. Cool blue office lighting. Close-up on his face. His brow furrows as he watches someone walk away. He looks into the distance, not at camera."

# FRAME 34 - Mastermind plan
gen "frame-34-mastermind-plan.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in casual dark clothing standing in an apartment, surrounded by multiple screens and monitors showing data, maps, and plans. Wide angle shot. Blue-white screen glow illuminating his face and the room. He studies the screens intensely. The word 终局 is written on a whiteboard. Warm+tech lighting mix."

# FRAME 35 - Code transfer
gen "frame-35-code-transfer.jpg" "Vertical 9:16 manga-realistic style. Close-up of a laptop screen showing green terminal text with a progress bar and Chinese characters 传输完成 (transfer complete). Fingers visible on keyboard. Green glow from the screen illuminates the surroundings. Cyberpunk hacker aesthetic but clear and readable. No English text."

# FRAME 36 - Rival investor
gen "frame-36-rival-investor.jpg" "Vertical 9:16 manga-realistic style. Elegant French restaurant, ${CHAR} in a refined dark suit sitting across from a sophisticated Chinese businesswoman (40s, sharp eyes, elegant dress, pearl earrings). They shake hands across the table. Warm golden restaurant lighting, wine glasses on table. Medium shot. Both look at each other (not at camera). Professional yet warm atmosphere."

# FRAME 37 - Rescue plan
gen "frame-37-rescue-plan.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} on a rooftop at dusk, talking on his phone with a determined expression. City skyline in background with orange-teal color grading. He looks out at the city, not at camera. He wears a dark jacket. Wind slightly moves his hair. Cinematic wide shot with beautiful sky."

# FRAME 38 - Evidence compile
gen "frame-38-evidence-compile.jpg" "Vertical 9:16 manga-realistic style. Close-up of a desk covered with organized documents, photos, USB drives, labeled folders in Chinese (律师, 媒体, 陈瑶). Dawn light coming through a window illuminating the desk. Hands are arranging the last document. Warm morning light, meticulous detail."

# FRAME 39 - Final morning
gen "frame-39-final-morning.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} standing before a full-length mirror, wearing an all-black suit with black shirt. Morning sunlight cuts across the room diagonally. He is adjusting his cuff, looking at his reflection (not at camera). His reflected eyes show fierce determination. Dramatic cinematic lighting. This is a warrior preparing for battle."

# FRAME 40 - Walk to destiny
gen "frame-40-walk-to-destiny.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in all-black suit striding through a modern office lobby. Low angle tracking shot. Office workers instinctively step aside. A young assistant jogs to keep up. Natural light from glass facade. He walks with commanding presence, looking straight ahead. Bright modern lobby, hero walk moment."

# FRAME 41 - Final entrance
gen "frame-41-final-entrance.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in all-black suit pushing open the glass door of the meeting room. Wide angle shot from inside the room. Backlit by windows creating dramatic lens flare around him. The older businessman and assistants are visible at the far end of the table. Epic entrance moment. He looks at his opponent, not at camera."

# FRAME 42 - Checkmate line
gen "frame-42-checkmate-line.jpg" "Vertical 9:16 manga-realistic style. Two men facing each other across a conference table. ${CHAR} in all-black stands confidently, leaning slightly forward. The older businessman across the table is frozen mid-expression. Side-lit dramatic shot showing both profiles. Tension in the air. Cinematic framing."

# FRAME 43 - Zhao face drops
gen "frame-43-zhao-face-drops.jpg" "Vertical 9:16 manga-realistic style. Extreme close-up of the older businessman's face (50s, grey hair). His expression shifts from composed to genuine fear - sweat beads on forehead, eyes widening. Dramatic bottom lighting creating ominous shadows. He looks at someone across from him, not at camera."

# FRAME 44 - Control moment
gen "frame-44-control-moment.jpg" "Vertical 9:16 manga-realistic style. Cinematic overhead/bird's eye shot of the meeting room. ${CHAR} in all-black stands at the table with hands planted on the surface, dominating the scene. Around him, the assistants shift nervously, bodyguards are uncertain. The older businessman sits deflated. Power has shifted completely. Dramatic top-down perspective."

# FRAME 45 - Phone buzz
gen "frame-45-phone-buzz.jpg" "Vertical 9:16 manga-realistic style. Close-up of a smartphone on a polished conference table, screen lit up with a notification from an anonymous number. The phone vibrates, creating tiny ripples in a glass of water nearby. Shallow depth of field. Dramatic tension. Clean, bright but suspenseful."

# FRAME 46 - Smile freezes
gen "frame-46-smile-freezes.jpg" "Vertical 9:16 manga-realistic style. ${CHAR} in all-black suit, side profile close-up. His face is split by dramatic light - one half bright, one half in shadow (明暗分割). His expression: a confident smile that is just starting to freeze into uncertainty. He looks down at something (phone) below frame. Cinematic film-quality lighting. The most dramatic frame of the story."

echo "=== ALL 46 FRAMES GENERATED ==="
