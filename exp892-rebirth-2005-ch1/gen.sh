#!/bin/bash
# Generate panels for EXP-892
# Character: Young Zhu Jiang (22yo) - Chinese male, slim build, short black hair, no facial hair, clean-shaven, handsome face with slightly angular jawline
# Setting: 2005 China
# Style: Semi-realistic manga, portrait 9:16, vibrant colors

OUTDIR="$(pwd)"
ZJ="a young Chinese man, 22 years old, slim build, short neat black hair parted to the side, clean-shaven with no facial hair, handsome face with slightly angular jawline and warm brown eyes, wearing a simple white t-shirt and jeans"
ZJ_YOUNG="$ZJ"

generate() {
  local num=$1
  local prompt=$2
  local outfile="${OUTDIR}/panel-$(printf '%02d' $num).png"
  
  if [ -f "$outfile" ] || [ -f "${OUTDIR}/panel-$(printf '%02d' $num).jpg" ]; then
    echo "SKIP panel $num (exists)"
    return
  fi
  
  echo "=== Generating panel $num ==="
  gemini --model gemini-2.0-flash-preview-image-generation \
    "Generate an image in semi-realistic manga/manhwa art style, portrait orientation (9:16 aspect ratio), vibrant and bright colors. No text, no speech bubbles, no captions on the image. The character should NOT look at the camera/viewer - eyes should look at objects or other characters in the scene. $prompt" \
    --output-file "$outfile" 2>&1 | tail -3
  
  if [ -f "$outfile" ]; then
    # Convert to jpg
    sips -s format jpeg -s formatOptions 75 "$outfile" --out "${OUTDIR}/panel-$(printf '%02d' $num).jpg" 2>/dev/null
    rm "$outfile"
    # Resize to 800px width
    sips --resampleWidth 800 "${OUTDIR}/panel-$(printf '%02d' $num).jpg" 2>/dev/null
    echo "OK panel $num"
  else
    echo "FAIL panel $num"
  fi
}

# Beat 1: 醒来
generate 1 "First-person POV shot looking at an old CRT computer monitor emitting blue light in a dark college dorm room, 2005 China. The monitor shows a Windows XP desktop. Blurry, just-waking-up perspective."
generate 2 "Close-up of a Nokia 6600 phone vibrating on a wooden desk, next to textbooks and a desk lamp. 2005 Chinese college dorm setting. The phone screen is lit up."
generate 3 "Close-up of a desk calendar showing June 15, 2005 (Wednesday), in a Chinese college dorm. Warm morning light. Chinese characters on the calendar."
generate 4 "Close-up of young male hands gripping a bed rail tightly, knuckles turning white from tension. College dorm bed with blue sheets, morning light."

# Beat 2: 确认
generate 5 "A young Chinese man, 22 years old, slim, short black hair, clean-shaven, looking at his own reflection in a bathroom mirror with a shocked expression. He's touching his smooth chin. The reflection shows his young face. College bathroom with fluorescent lighting. Shot from behind his shoulder showing the mirror reflection."
generate 6 "Extreme close-up of a young man's hand touching his own smooth, clean-shaven chin and jawline. Bathroom mirror partially visible. Surprised gesture."
generate 7 "Wide shot of a 2005 Chinese college dorm room. A chubby young Chinese man with round face and black-framed glasses (Wang) sits at a desk playing Counter-Strike 1.6 on a CRT monitor. The room has bunk beds, posters, scattered books. $ZJ_YOUNG stands in the doorway looking bewildered."
generate 8 "Medium shot of a chubby young Chinese man with round face and thick black-framed glasses, turning around from his CRT computer with a confused expression, one hand still on the mouse. CS 1.6 visible on screen behind him. College dorm room."

# Beat 3: 第一个念头
generate 9 "Overhead/bird's eye shot of $ZJ_YOUNG sitting on the edge of a college dorm bed, fingers interlocked, deep in thought. Morning light streaming through the window. Contemplative mood."
generate 10 "Artistic visualization of future tech memories: translucent overlapping images of an iPhone silhouette, Bitcoin symbol, and WeChat logo, floating like dream bubbles against a dark background. Ethereal, dreamlike quality."
generate 11 "Medium side-profile shot of $ZJ_YOUNG suddenly looking up with bright, excited eyes and a determined expression. Sitting on a bed in a college dorm. Light catching his face dramatically."
generate 12 "Close-up of a CRT monitor showing a Chinese domain registration website (2005-era web design with table layouts). A young man's hand is on the mouse. The screen shows domain search results."

# Beat 4: 487元
generate 13 "Close-up of an ATM screen in 2005 China showing account balance: 487.32 (Chinese yuan). Old-style ATM interface with green text on dark screen."
generate 14 "Low-angle shot looking up at $ZJ_YOUNG standing in front of an ATM machine inside a bank, hands in jean pockets, with a wry, self-deprecating smile. Fluorescent bank lighting."
generate 15 "Close-up of a hand writing calculations in a notebook with a ballpoint pen: 60×7=420, remaining 67. Neat handwriting. Desk lamp lighting."
generate 16 "Overhead close-up of a notebook page with a handwritten list of domain names in both Chinese and English, some circled with red pen. The circled ones include weixin and douyin. Warm desk lamp light."

# DECISION-1
generate 17 "Artistic split-screen visualization showing three paths/doors: left door glowing with tech symbols (futuristic), middle door balanced with both modern and current elements (golden glow), right door showing a simple desk setup (conservative). $ZJ_YOUNG standing at the crossroads looking at the middle option."
generate 18 "Close-up of a hand circling words in a notebook with red pen, with a determined grip. The circled text shows a mixed strategy. Side view of the young man's focused face partially visible."

# Beat 5: 中关村
generate 19 "Wide establishing shot of a 2005 Shanghai subway station entrance, crowds of people entering and exiting. $ZJ_YOUNG with a backpack walking into the station. Urban China, slightly hazy, busy atmosphere. Period-accurate: old ticket gates, CRT information displays."
generate 20 "Wide shot of Zhongguancun Electronics Market exterior in 2005 Beijing, covered in colorful signboards and banners advertising computers and electronics. Bustling street scene with people, bikes, and taxis. Bright daylight."
generate 21 "Interior of a 2005 Chinese electronics market: narrow aisles between small vendor booths stacked with CRT monitors, keyboards, CD-ROMs. Fluorescent lighting, crowded, chaotic energy."
generate 22 "Medium shot of a Chinese woman in her mid-30s, permed curly hair, sharp intelligent eyes, casual blouse, leaning against an electronics market counter with arms crossed, looking appraisingly at someone off-camera. Confident, street-smart demeanor."
generate 23 "Two-shot of $ZJ_YOUNG talking with the curly-haired woman (Li Jie, 35, permed hair, casual blouse) at an electronics market counter. She's raising an eyebrow examining him. He looks earnest. Various electronics visible in background."

# Beat 6: 第一桶金
generate 24 "Medium shot of the curly-haired Chinese woman (Li Jie) talking on an old flip phone while leaning on a counter. $ZJ_YOUNG waits nearby, hands in pockets, looking around the electronics market."
generate 25 "Artistic split-screen effect: left side shows modern code (React/Vue syntax in colorful IDE), right side shows primitive PHP4 code with HTML table tags on a CRT screen. Visual contrast between future knowledge and 2005 reality. Dreamy overlay effect."
generate 26 "Over-the-shoulder shot from behind $ZJ_YOUNG as he sits at an old desktop computer with a CRT monitor in a cramped electronics market office. His hands hover over a beige keyboard. Warm fluorescent lighting."
generate 27 "Close-up of a CRT monitor displaying PHP code with HTML table layout markup. The code is visible and looks authentic for 2005 web development. Greenish monitor tint."

# Beat 7: 百度的诱惑
generate 28 "Medium shot in a college dorm at night. The chubby Chinese man with round face and black glasses (Wang) excitedly waves a printed letter (job offer), grinning broadly. Desk lamp lighting, warm atmosphere."
generate 29 "Close-up of $ZJ_YOUNG's face showing internal conflict - brow slightly furrowed, eyes looking to the side thoughtfully. A Baidu logo subtly blurred in the background. Dramatic side lighting."
generate 30 "Artistic visualization of a stock price chart soaring upward from $8 to $800, with a blue Baidu-like company logo. Dynamic upward curve with golden light effects. Chart/graph style but with manga artistic flair."
generate 31 "Medium side-angle shot of $ZJ_YOUNG placing his hand on the chubby bespectacled friend's (Wang) shoulder with a knowing, warm smile. College dorm setting, night, desk lamp lighting. A mentor-like gesture."

# DECISION-2
generate 32 "Silhouette shot of $ZJ_YOUNG standing at a dorm room window, looking out at a university campus at night. City lights and campus buildings visible through the window. Contemplative, cinematic framing with window frame creating a natural border."
generate 33 "Close-up side profile of $ZJ_YOUNG's face, eyes determined and forward-looking, jaw set. Dramatic lighting from one side. A subtle reflection of city lights in his eyes. Cinematic mood."

# Beat 8: 第一个客户
generate 34 "Medium shot of a middle-aged Chinese businessman, pot-bellied, in a tacky but expensive-looking office (gold decorations, fake plants, leather chair), pointing at an old computer. He's wearing a polo shirt. 2005 China small business aesthetic."
generate 35 "Side-profile close-up of $ZJ_YOUNG working intensely at an old computer, writing code. Sweat on his forehead, concentrated expression. CRT monitor glow on his face. Late afternoon light from a window."
generate 36 "Close-up of hands exchanging money: a thick-fingered hand offering a stack of Chinese 100-yuan bills (about 2000 yuan), and $ZJ_YOUNG's younger, thinner hands receiving them carefully. Warm lighting, emotional moment."

# Beat 9: 夜晚笔记本
generate 37 "Wide shot of a dark college dorm room at night. Only a small desk lamp is on. One bunk bed has someone sleeping (visible lump under blanket). At the desk, $ZJ_YOUNG is hunched over writing in a notebook, illuminated by the warm lamp light. Moody, atmospheric."
generate 38 "Overhead close-up of a notebook page filled with dense handwritten timeline in Chinese: 2007-iPhone发布, 2009-比特币, 2011-微信上线, 2012-今日头条, 2016-抖音... The handwriting gets more frantic and excited as it goes down. Pen visible, warm lamp light."
generate 39 "Extreme close-up of a hand holding a pen, visibly trembling. The pen tip is pressing against paper, leaving a shaky ink trail. Dramatic lighting emphasizing the tremor. Emotional intensity."

# Beat 10: 悬念
generate 40 "Dramatic close-up of a Nokia phone lighting up on a dark desk showing an incoming call from an unknown number. A hand reaches toward it from the shadows. Tense atmosphere, the phone's screen glow is the main light source. Night setting."

echo "=== ALL DONE ==="
ls -la *.jpg 2>/dev/null | wc -l
