#!/bin/bash
set -e
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
OUT="/Users/ahzhu_agent/trinity-v3-content/exp-703-chongqi2008-ch1/images"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"

gen() {
  local fname="$1"
  local prompt="$2"
  local ref="$3"
  if [ -f "$OUT/$fname" ]; then
    echo "SKIP: $fname already exists"
    return
  fi
  echo "GENERATING: $fname"
  if [ -n "$ref" ]; then
    uv run "$SCRIPT" --prompt "$prompt" --filename "$fname" --resolution 1K -i "$ref" 2>&1 | tail -2
  else
    uv run "$SCRIPT" --prompt "$prompt" --filename "$fname" --resolution 1K 2>&1 | tail -2
  fi
  echo "DONE: $fname"
}

# f02 - Zhu Jiang sitting on bed looking at hands
gen "f02-hands.png" "Vertical 9:16 manga-realistic hybrid illustration. A stocky Chinese young man age 25, 172cm 80kg build, with short black hair slightly messy, short stubble beard, big round eyes, round face, wearing a white old t-shirt and shorts, sitting on a messy single bed in a cramped rental apartment in China. He is looking down at his own hands with a shocked expression. The walls are yellowed. There is a Jay Chou poster on the wall. 2008 era Chinese apartment. Warm bright lighting. Character does NOT look at the camera. 3/4 angle view." "$REF"

# f03 - Nokia phone closeup
gen "f03-phone.png" "Vertical 9:16 manga-realistic hybrid illustration. Close-up of a hand holding a Nokia N73 mobile phone. The phone screen shows the date 2008-09-12 in Chinese format. There are 3 unread message notifications and a QQ icon on the screen. The hand belongs to a stocky young Chinese man. Only the hand and phone are visible. Warm bright lighting. Detailed realistic phone rendering." ""

# f04 - Body strength discovery
gen "f04-strength.png" "Vertical 9:16 manga-realistic hybrid illustration. Full body shot of a stocky Chinese young man age 25, 172cm 80kg, short messy black hair, short stubble beard, big eyes, wearing white t-shirt and shorts, barefoot, standing in a cramped Chinese rental apartment. He looks confused at his fist. The corner of a wooden desk is broken/shattered where he accidentally hit it. Books and instant noodle cups on the desk. An old standing fan in the corner. Warm bright lighting. Character looks at his own fist, NOT at camera." "$REF"

# f05 - Mirror scene
gen "f05-mirror.png" "Vertical 9:16 manga-realistic hybrid illustration. A stocky Chinese young man age 25, 172cm 80kg, standing sideways in front of a small cracked bathroom mirror. We see his 3/4 profile and his reflection in the mirror. His reflection shows: big round eyes, short stubble beard, black short hair now wet and starting to be combed back. Wearing white t-shirt. Tiny cramped bathroom with dripping faucet. Warm natural lighting. Character looks at his own reflection in the mirror, NOT at camera." "$REF"

# f06 - Memory montage
gen "f06-montage.png" "Vertical 9:16 manga-realistic hybrid illustration. A montage/collage of three futuristic visions overlapping: (1) a glowing smartphone silhouette, (2) a golden Bitcoin symbol, (3) an AI chip with neural network patterns. The images are arranged vertically with ethereal light halos connecting them. Sci-fi blue and gold color scheme. Dynamic composition. No text. No characters. Bright vibrant colors." ""

# f07 - Decision at desk
gen "f07-decision.png" "Vertical 9:16 manga-realistic hybrid illustration. A stocky Chinese young man age 25, 172cm 80kg, black hair now wet and combed back, short stubble beard, big eyes, wearing a gray polo shirt and jeans, sitting at a desk in a small apartment. He is intensely focused on a piece of paper where he is drawing a mind map. On the desk: a calculator, textbooks, A4 paper. Through the window: a 2008 Chinese old residential neighborhood with laundry hanging on balconies. Warm afternoon light from window. Character looks at the paper, NOT at camera." "$REF"

# f08 - Decision closeup paper
gen "f08-paper.png" "Vertical 9:16 manga-realistic hybrid illustration. Top-down close-up of an A4 paper on a desk with a hand-drawn mind map. The Chinese characters 创业 (entrepreneurship) are circled three times emphatically with a pen. Next to it, 炒股 (stock trading) is crossed out. A pen and calculator are beside the paper. Warm lighting. Clean detailed illustration." ""

# f09 - Walking out to 2008 street
gen "f09-street.png" "Vertical 9:16 manga-realistic hybrid illustration. Full body shot of a stocky Chinese young man age 25, 172cm 80kg, black hair combed back, short stubble beard, wearing gray polo shirt, jeans, and sneakers, carrying an old backpack, walking out of an old 6-story Chinese residential building entrance. The street has small shops, a mobile phone recharge sign, bicycle repair shop, bread vans and bicycles. A faded banner reads about Beijing Olympics. 2008 Chinese urban street atmosphere. Warm golden afternoon light. Character looks toward the street ahead, NOT at camera." "$REF"

# f10 - Internet cafe meeting Li Zhenhua
gen "f10-cafe.png" "Vertical 9:16 manga-realistic hybrid illustration. Interior of a 2008 Chinese internet cafe. CRT monitors, oily keyboards, smoky air. Counter Stike and World of Warcraft posters on walls. Behind the counter sits a short chubby Chinese young man with round face, small eyes, thick black-framed glasses, wearing a red plaid shirt - he is reading a manga. At the entrance, a taller stocky man (back view, gray polo, jeans, backpack) is walking in. A sign near the door shows 上网2元每小时. Warm yellowish indoor lighting. Characters do NOT look at camera." "$REF"

# f11 - Two friends talking
gen "f11-friends.png" "Vertical 9:16 manga-realistic hybrid illustration. Two Chinese young men at an internet cafe counter, having a conversation. Man 1 (standing, leaning on counter): stocky build 172cm/80kg, black hair combed back, short stubble beard, big eyes, gray polo shirt, calm confident smile. Man 2 (sitting behind counter, looking up): short and chubby, round face, small eyes, thick black-framed glasses, red plaid shirt, exaggerated worried expression. Their faces are clearly different from each other. Warm indoor lighting. Neither looks at camera - they look at each other." "$REF"

# f12 - Lifting CRT monitor
gen "f12-lift.png" "Vertical 9:16 manga-realistic hybrid illustration. Low angle shot in a 2008 Chinese internet cafe. A stocky Chinese young man (172cm/80kg, black hair combed back, stubble beard, gray polo) casually lifts a heavy 21-inch CRT monitor with ONE hand, looking relaxed and natural. Beside him, a skinny internet cafe patron stares wide-eyed in disbelief. In the background, the chubby guy with glasses behind the counter tilts his head suspiciously. Warm lighting. No one looks at camera." "$REF"

# f13 - Searching on computer
gen "f13-search.png" "Vertical 9:16 manga-realistic hybrid illustration. Over-the-shoulder shot from behind a stocky Chinese young man with black hair combed back and gray polo shirt. He sits at a CRT computer monitor showing a 2008-era Baidu search page. The search query visible on screen shows Chinese characters. The search results page is sparse with few results. His hands are on the keyboard. Warm indoor lighting. Character faces the screen, not the camera." "$REF"

# f14 - Outside office building
gen "f14-building.png" "Vertical 9:16 manga-realistic hybrid illustration. A stocky Chinese young man age 25, 172cm/80kg, black hair combed back, stubble beard, gray polo shirt, jeans, sneakers, old backpack, holding printed A4 papers, standing in front of a mid-tier Shanghai office building looking UP at it. Glass curtain wall building, slightly dated. A company sign hangs near the entrance. 2008 Shanghai street with taxis and buses. Warm afternoon sunlight. Character looks upward at the building, NOT at camera." "$REF"

# f15 - Meeting Zhou Wei at reception
gen "f15-reception.png" "Vertical 9:16 manga-realistic hybrid illustration. Office reception area, simple business style with 2008 aesthetics (paper sign-in book, landline phone). Behind the reception desk: a Chinese young woman with a high ponytail, oval face, arched eyebrows, single eyelids, white blouse and black skirt, looking professional and neat, just putting down a desk phone. In front of the counter: a stocky Chinese young man with black hair combed back, stubble beard, gray polo, standing with backpack. They look at each other across the counter. Neither faces the camera directly." "$REF"

# f16 - Pitching to Mr. Ma
gen "f16-pitch.png" "Vertical 9:16 manga-realistic hybrid illustration. Small meeting room. A stocky Chinese young man (gray polo, black hair combed back, stubble beard, passionate expression) stands at a whiteboard with Chinese handwriting on it. Facing him across the table: an overweight Chinese man in his 50s, balding, beer belly visible even seated, wearing a rumpled suit with loose tie, picking his teeth with a toothpick, looking dismissive and bored. Two assistants sit beside the older man, heads down looking at their Nokia phones. 2008 office setting. Warm but fluorescent lighting. No one faces camera." "$REF"

# f17 - Decision closeup face
gen "f17-face.png" "Vertical 9:16 manga-realistic hybrid illustration. Dramatic close-up of a Chinese young man's face in 3/4 profile view. Stocky face with stubble beard, big eyes, black hair combed back. His expression transitions from calm smile to sharp determined eyes. Background is blurred meeting room. Dramatic side lighting creating contrast on his face. Cinematic feel. Character looks to the side, NOT at camera." "$REF"

# f18 - Confrontation
gen "f18-confrontation.png" "Vertical 9:16 manga-realistic hybrid illustration. Meeting room dramatic scene. A stocky Chinese young man (gray polo, black hair combed back, stubble beard) leans forward with both hands on the conference table, intense calm expression, pushing a document toward the man across the table. The older Chinese man (50s, balding, beer belly, rumpled suit) leans back in his chair, shocked, his toothpick fallen on the table. Tense confrontation composition. Dramatic lighting. Neither faces camera - they face each other." "$REF"

# f19 - Walking away confidently
gen "f19-walkaway.png" "Vertical 9:16 manga-realistic hybrid illustration. Office hallway perspective shot. A stocky Chinese young man (gray polo, jeans, backpack) walks away from camera toward an elevator, his back to us, stride confident and unhurried. Far in the background at the reception desk, a young Chinese woman with ponytail (Zhou Wei) tilts her head watching him leave, expression thoughtful. Clean office corridor. Warm natural lighting from windows." "$REF"

# f20 - Sunset bridge cliffhanger
gen "f20-sunset.png" "Vertical 9:16 manga-realistic hybrid illustration. A stocky Chinese young man age 25, 172cm/80kg, black hair combed back, stubble beard, gray polo, jeans, leans against a pedestrian overpass railing, looking out at the Shanghai Pudong skyline at sunset. The skyline shows 2008-era buildings (NO Shanghai Tower). Golden orange sunset light bathes the scene. His Nokia phone in hand is glowing with an incoming call. He gazes at the distant cityscape with a calm, expectant expression. Warm golden hour colors. Character looks at the city, NOT at camera. Cinematic wide composition." "$REF"

echo "ALL FRAMES GENERATED"
