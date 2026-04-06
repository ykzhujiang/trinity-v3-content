#!/bin/bash
set -e
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"
CHARREF="$HOME/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
SCRIPT="$HOME/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
OUTDIR="$HOME/trinity-v3-content/exp-949-code-restart-ch4/images"
cd "$OUTDIR"

gen() {
  local num=$1
  local prompt=$2
  local use_ref=$3
  local fname="p$(printf '%02d' $num).png"
  if [ -f "$fname" ]; then echo "SKIP $fname"; return; fi
  echo "GEN $fname..."
  if [ "$use_ref" = "ref" ]; then
    uv run "$SCRIPT" --prompt "$prompt" -i "$CHARREF" --filename "$fname" --resolution 1K 2>&1 | tail -2
  else
    uv run "$SCRIPT" --prompt "$prompt" --filename "$fname" --resolution 1K 2>&1 | tail -2
  fi
}

# P02: Chen Lei sitting on bed looking at phone, worried
gen 2 "Realistic manga style, vertical 9:16 portrait. A young Chinese man (25, thin, messy hair, glasses, wearing a wrinkled t-shirt) sitting on a hotel bed edge, staring intensely at his phone screen with a worried expression. The phone screen shows a zoomed photo. Early morning, dim hotel room, unmade bed. He clearly didn't sleep well. He is NOT looking at the camera. Side angle, medium close-up." ""

# P03: Funny moment - Zhu Jiang talking to Chen Lei about laptop
gen 3 "Realistic manga style, vertical 9:16. Two Chinese men in a hotel room. The older one (late 20s, slicked-back black hair, light blue shirt, based on reference photo) is gesturing at the younger one (thin, glasses, messy hair) who is holding a laptop protectively. Comedy scene - the older one has an exasperated but amused expression pointing at the laptop, the younger one looks defensive. NOT looking at camera. Medium shot." ref

# P04: Arriving at SDK office building, 2010 Beijing
gen 4 "Realistic manga style, vertical 9:16. Exterior of a 2010-era Beijing office building, modern glass facade. Two men walking towards the entrance - one in light blue dress shirt (late 20s, slicked-back hair, confident stride) and one shorter with glasses carrying a backpack. Shot from behind/side showing them approaching the building. Beijing summer, bright sky. Urban environment. NOT looking at camera." ref

# P05: Conference room, everyone seated, Zhu Jiang notices extra person
gen 5 "Realistic manga style, vertical 9:16. A corporate conference room in 2010 China. Long table with several people seated. At the head: a balding, slightly overweight Chinese man in his 40s (polo shirt). Beside him: a young tech-looking man (Zhou Feng, 30s). On the side: a striking Chinese woman (early 30s, short bob haircut, gray suit jacket, sharp eyes) taking notes. The main character (late 20s, light blue shirt, reference photo face) is just entering, his eyes drawn to the unfamiliar woman. NOT looking at camera. Wide shot." ref

# P06: Close-up of Lin Xiaodie - the mysterious woman
gen 6 "Realistic manga style, vertical 9:16. Close-up portrait of a Chinese woman in her early 30s. Short bob haircut at ear level, sharp intelligent eyes, minimal makeup, wearing a gray suit jacket over white blouse. She is writing notes with a pen, looking down at her notebook with a slight enigmatic expression. Corporate conference room background blurred. Professional and mysterious aura. NOT looking at camera. She should look distinctly different from any male characters - delicate facial features, sharp jawline." ""

# P07: Contract on the table, Zhu Jiang reaching for pen
gen 7 "Realistic manga style, vertical 9:16. Close-up shot of a contract document on a conference table, with a hand reaching for a pen to sign. The hand belongs to a Chinese man in a light blue shirt sleeve. Other hands and documents visible around the table. Overhead angle looking down. Corporate 2010 setting. The contract has Chinese text header visible." ref

# P08: Lin Xiaodie interrupts - dramatic moment
gen 8 "Realistic manga style, vertical 9:16. Dramatic manga panel. A Chinese woman (early 30s, short bob haircut, gray suit) has just spoken up, her hand raised slightly. Everyone at the conference table has frozen mid-action and turned to look at her. The woman's expression is calm and authoritative. The balding CEO looks surprised. The main character (light blue shirt) has his pen hovering above the paper, frozen. Tension in the air. NOT looking at camera. Wide angle showing the whole table's reaction." ref

# P09: Lin Xiaodie presenting her report - screens/projector
gen 9 "Realistic manga style, vertical 9:16. A Chinese woman (early 30s, short bob, gray suit) standing next to a projector screen showing data charts and analysis. She is pointing at specific data points. Her posture is confident, professional. The audience at the conference table watches intently. 2010-era presentation equipment. The screen shows bar charts and trend lines. NOT looking at camera. Medium-wide shot from the side." ""

# P10: Zhu Jiang's cold sweat moment - close-up face
gen 10 "Realistic manga style, vertical 9:16. Extreme close-up of a Chinese man's face (late 20s, reference photo face, light stubble). He is sweating slightly, eyes widened in shock and recognition. Manga-style sweat drops on his temple. His expression shows inner turmoil - he has just realized something terrifying. Background slightly blurred, conference room ambient. NOT looking at camera - his eyes are focused on something off-screen to the side." ref

# P11: Eye contact between Zhu Jiang and Lin Xiaodie - information warfare
gen 11 "Realistic manga style, vertical 9:16. Split composition showing two faces in profile looking at each other across a conference table. Left: a Chinese man (late 20s, slicked-back hair, light stubble, intense calculating gaze). Right: a Chinese woman (early 30s, short bob, sharp eyes, slight knowing smile). Between them, faint digital/data visualization overlay suggesting information warfare. Dramatic lighting. Manga-style tension lines in background. They are looking at EACH OTHER, not at camera." ref

# P12: Comedy relief - Chen Lei arguing with Zhou Feng about gcc
gen 12 "Realistic manga style, vertical 9:16. Comedy panel. Two nerdy Chinese men having an animated technical argument. One (thin, glasses, messy hair, 25) and one (30s, casual tech wear) are pointing at each other energetically, both passionate about something trivial. Other people at the conference table look confused or amused. Light-hearted scene contrasting the previous tension. Manga-style emotion marks showing excitement. NOT looking at camera." ""

# P13: Zhu Jiang at whiteboard, counter-attack
gen 13 "Realistic manga style, vertical 9:16. A Chinese man (late 20s, reference photo face, light blue shirt with rolled-up sleeves) standing confidently at a whiteboard, drawing a timeline diagram. He's in full presentation mode - one hand on the whiteboard marker, gesturing with the other. The whiteboard shows a hand-drawn timeline with Chinese text annotations and arrows. Everyone at the table is watching, impressed. The woman in gray suit watches with a subtle smile. NOT looking at camera. Shot from slightly below, making him look authoritative." ref

# P14: Whiteboard detail - the predictions
gen 14 "Realistic manga style, vertical 9:16. Close-up of a whiteboard with hand-drawn diagrams. A timeline from 2010 to 2013 with red circles marking specific events. Chinese text labels describing security incidents. Arrows connecting causes and effects. A hand holding a red marker just finished drawing. Clean, readable Chinese characters. Professional diagram style." ""

# P15: The room's stunned reaction
gen 15 "Realistic manga style, vertical 9:16. Wide shot of a conference room. A balding Chinese man in polo shirt (the CEO, 45) has his mouth slightly open in amazement. A woman in gray suit (short bob, 30s) has stopped writing - her pen is frozen above the paper. Her expression shows genuine respect/admiration for the first time. Others around the table look impressed. NOT looking at camera." ""

# P16: Lin Xiaodie's genuine expression - admiration
gen 16 "Realistic manga style, vertical 9:16. Close-up of a Chinese woman (early 30s, short bob, gray suit). For the first time her professional mask has slipped - her expression shows genuine admiration and a hint of excitement. Her eyes are bright, focused on something off-screen. A slight genuine smile replacing her usual controlled expression. Warm lighting. NOT looking at camera." ""

# P17: Contract signed - handshake
gen 17 "Realistic manga style, vertical 9:16. Two men shaking hands across a conference table with signed documents visible. One is a Chinese man in light blue shirt (late 20s, reference photo face, triumphant but composed) and the other is a balding man in polo (45, CEO, smiling broadly). Others clap in background. 2010 corporate setting. NOT looking at camera. Medium shot." ref

# P18: Hallway - Lin Xiaodie stops Zhu Jiang
gen 18 "Realistic manga style, vertical 9:16. A corporate office hallway. A Chinese woman (early 30s, short bob, gray suit) has just caught up to a Chinese man (late 20s, light blue shirt, reference photo face) and gently touched his arm to stop him. He's turning to face her, surprised. She leans slightly closer with a serious expression. The hallway is empty except for them. Dramatic lighting from windows. NOT looking at camera. Medium shot." ref

# P19: Decision moment - inner conflict visualization
gen 19 "Realistic manga style, vertical 9:16. A Chinese man (late 20s, reference photo face) shown in contemplation. The image has a creative split - half shows a dark mysterious meeting scene (risk/danger) and half shows a well-lit safe approach (caution/preparation). His face is in the center, deep in thought. Manga-style thought visualization. NOT looking at camera." ref

# P20: Night scene - Houhai lake area 2010
gen 20 "Realistic manga style, vertical 9:16. Night scene at Houhai (后海) lake in Beijing, 2010 era. Neon bar signs reflecting on the lake water, a silhouette of a street musician playing guitar near the waterfront. Willow trees along the lake edge. Some pedestrians walking. Warm orange and cool blue neon lights creating beautiful reflections. Atmospheric, nostalgic 2010 Beijing nightlife. No one looking at camera. Wide establishing shot." ""

# P21: Zhu Jiang and Lin Xiaodie on bench by the lake
gen 21 "Realistic manga style, vertical 9:16. Two people sitting on a bench by a lake at night. A Chinese man (late 20s, now wearing a dark casual jacket over his shirt, reference photo face) and a Chinese woman (early 30s, short bob, still in gray suit). They sit with some distance between them - not close, wary. Neon reflections on the lake behind them. She is turned slightly toward him speaking. He stares ahead at the lake, listening intently. NOT looking at camera. Medium-wide shot from the side." ref

# P22: Lin Xiaodie's revelation - facial expression
gen 22 "Realistic manga style, vertical 9:16. Close-up of a Chinese woman (early 30s, short bob, gray suit) speaking with quiet intensity. Night scene, neon reflections highlighting her face. Her expression is serious, slightly vulnerable - she's revealing important secrets. Warm and cool light mixing on her face. NOT looking at camera - looking slightly to the side at her conversation partner." ""

# P23: Zhu Jiang's shock - third time traveler revelation
gen 23 "Realistic manga style, vertical 9:16. Close-up of a Chinese man (late 20s, reference photo face, dark jacket). His expression shows deep shock - eyebrows raised, lips slightly parted. Night scene with neon bokeh in background. Manga-style impact lines radiating around his face suggesting the weight of what he just heard. NOT looking at camera." ref

# P24: Lin Xiaodie getting phone call - face changes
gen 24 "Realistic manga style, vertical 9:16. A Chinese woman (early 30s, short bob, gray suit) looking at a phone that just rang. Her face has gone pale/tense. She's sitting on a bench by a lake at night. The phone is a 2010-era phone with a custom case (hiding modern tech). Neon reflections around. Her body language shows sudden alarm. NOT looking at camera." ""

# P25: Lin Xiaodie leaving abruptly
gen 25 "Realistic manga style, vertical 9:16. A Chinese woman (early 30s, short bob, gray suit) standing up urgently from a bench and walking away quickly. She's looking back over her shoulder at the man still sitting on the bench (not visible, implied). Night lakeside scene with neon. Her posture shows urgency. Wind slightly catching her hair. NOT looking at camera. Dramatic angle." ""

# P26: Late night hotel room - Zhu Jiang at laptop
gen 26 "Realistic manga style, vertical 9:16. A Chinese man (late 20s, reference photo face, wearing a casual t-shirt now) sitting at a hotel desk, illuminated only by laptop screen blue light. His face shows intense concentration. His fingers are on the keyboard. Behind him, another man (Chen Lei, glasses) is asleep on the bed. 2010-era laptop. Dark room, dramatic screen-light only. NOT looking at camera." ref

# P27: Screen showing the Qimingxing Fund discovery
gen 27 "Realistic manga style, vertical 9:16. Close-up of a 2010-era laptop screen showing a Chinese business registration website. The screen displays information about a fund called '启明星天使基金' (Qimingxing Angel Fund) with registration date May 2010 and a list of 12 portfolio companies. The screen has a blue-white glow. Hands on keyboard visible at bottom of frame. Chinese text on screen." ""

# P28: Zhu Jiang's realization - zooming in on signature
gen 28 "Realistic manga style, vertical 9:16. Extreme close-up of a laptop screen showing a scanned document with a handwritten Chinese signature/name. A hand with a cursor pointing at the signature. The blue laptop light illuminates the man's face partially visible at the edge of the frame (late 20s, reference photo features). His expression shows dawning horror/recognition. Screen glow is the only light source. NOT looking at camera." ref

# P29: Flashback - university dormitory memory
gen 29 "Realistic manga style, vertical 9:16. Flashback scene with slightly faded/sepia colors. A Chinese university dormitory room, early 2000s. Two young men (early 20s) - one recognizable as a younger version of the main character, and the other a different-looking young man (Zhang Wei - tall, thin, intellectual look, rectangular glasses, neat hair) studying together at a desk. Warm nostalgic atmosphere. Old posters on walls, bunk beds. NOT looking at camera." ref

# P30: Final dramatic shot - screen glow on face
gen 30 "Realistic manga style, vertical 9:16. Cinematic final panel. A Chinese man (late 20s, reference photo face) leaning back in his chair, laptop screen casting blue light on his face. His expression is a complex mix of shock, determination, and a hint of dark excitement - he's discovered his opponent's identity. The laptop screen glow creates dramatic shadows on his face. Dark hotel room. Behind him through the window, the Beijing city lights twinkle. NOT looking at camera - staring at the laptop screen. Epic composition." ref

echo "ALL DONE"
