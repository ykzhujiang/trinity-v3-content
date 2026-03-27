#!/bin/bash
BASEDIR="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image"
OUTDIR="$HOME/trinity-v3-content/exp616-esports-clutch-ch1/img"
API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
BASE_URL="https://king.tokenssr.com"
export HTTPS_PROXY="" HTTP_PROXY=""

gen() {
  local num=$1; shift
  local out="$OUTDIR/f$(printf '%02d' $num).png"
  [ -f "$out" ] && { echo "SKIP f$num"; return; }
  echo "=== f$num $(date +%H:%M:%S) ==="
  uv run "$BASEDIR/scripts/generate_image.py" \
    --api-key "$API_KEY" --base-url "$BASE_URL" \
    --prompt "$1" --filename "$out" --resolution 1K 2>&1 || echo "FAIL f$num"
  sleep 1
}

gen 7 "Semi-realistic manga, vertical 9:16. A young Chinese man (20yo, round face, big eyes, short black hair, white tank top) gripping a sink, staring at his young face in a small dorm mirror with shock and joy. Class schedule pinned nearby. He stares at MIRROR. 2005 Chinese dorm."

gen 8 "Semi-realistic manga, vertical 9:16. A young Chinese man (20yo, round face, big eyes, short hair) grinning with fierce determination, fist slammed on counter. Morning light behind him through window. Heroic low angle. NOT facing camera."

gen 9 "Semi-realistic manga, vertical 9:16. Wide shot of 2005 Chinese university campus in autumn. Students on bicycles, club banners. A young stocky man in white t-shirt and jeans walks among crowd, looking around nostalgically. Warm lighting."

gen 10 "Semi-realistic manga, vertical 9:16. College cafeteria, students at a table with enamel plates discussing earnestly. A young man walks past with tray, glancing sideways at them. 2005 China atmosphere."

gen 11 "Semi-realistic manga, vertical 9:16. A neon sign reading 飞翔网吧 on a small commercial street. Bicycles parked outside. A young Chinese man stands at entrance looking up at the sign. 2005 China daytime."

gen 12 "Semi-realistic manga, vertical 9:16. Inside a smoky 2005 Chinese internet cafe. CRT monitors in rows. Someone eating instant noodles. Oily keyboards. A young man stepping inside, warm amber haze of smoke. Nostalgic."

gen 13 "Semi-realistic manga, vertical 9:16. Side view of a young Chinese man in white t-shirt sitting at a CRT monitor showing Counter-Strike 1.6 loading screen. Windows XP. 2005 internet cafe."

gen 14 "Semi-realistic manga, vertical 9:16. Close-up of hands on oily keyboard playing CS 1.6. Screen shows crosshair tracking with slight shakiness. Focused concentration. Monitor glow."

gen 15 "Semi-realistic manga, vertical 9:16. Side view of a tall skinny guy with dyed yellow spiky hair, lollipop in mouth, slouching with one foot on desk. His hands blur on keyboard. Screen shows CS triple kill. Lazy posture but amazing gameplay. 2005 internet cafe."

gen 16 "Semi-realistic manga, vertical 9:16. Close-up profile of a young Chinese man's face, eyes sharp and intense, staring sideways at another screen. Screen glow illuminates half his face. Talent scout discovering a diamond. Dramatic manga lighting."

gen 17 "Semi-realistic manga, vertical 9:16. Conceptual panel - a balance scale. Left side: cautious waiting imagery. Right side: bold striking imagery. Scale tips right. Thought-bubble manga style border. Decision moment. Abstract internal monologue."

gen 18 "Semi-realistic manga, vertical 9:16. Two young men at an internet cafe desk. One (short black hair, white tshirt, stocky) pointing at the other's screen. The other (tall, yellow hair, lollipop) looking confused. Close proximity. Both look at screen."

gen 19 "Semi-realistic manga, vertical 9:16. Close-up of a young man's face with yellow spiky hair - lollipop nearly falling from mouth, eyes wide in shock. Manga surprise effect lines. Dramatic reaction shot."

gen 20 "Semi-realistic manga, vertical 9:16. A young stocky Chinese man leaning back in chair confidently, one finger raised, smiling knowingly. Across from him a tall yellow-haired guy looks bewildered. Internet cafe background."

gen 21 "Semi-realistic manga, vertical 9:16. Wide shot. A young man standing at a whiteboard in an internet cafe corner, drawing diagrams with marker. Four or five curious people gathered watching. Smoky atmosphere. He faces the whiteboard."

gen 22 "Semi-realistic manga, vertical 9:16. Close-up of whiteboard with hand-drawn flowchart. Chinese text labels: 直播平台, 赛事体系, 选手经纪, 周边电商, 广告赞助. Arrows connecting them. Each marked 十亿级. Messy marker handwriting."

gen 23 "Semi-realistic manga, vertical 9:16. Group reaction shot in internet cafe. Several people with different expressions - blank, skeptical. A half-bald older man eating noodles smirks. A tall yellow-haired youth studies the whiteboard with crossed arms. Nobody faces camera."

gen 24 "Semi-realistic manga, vertical 9:16. Close-up of a young man with yellow spiky hair pulling lollipop stick from mouth. Expression transitioning from doubt to excitement. Eyes beginning to sparkle. Dramatic character moment."

gen 25 "Semi-realistic manga, vertical 9:16. Two young men shaking hands. One stocky with black hair extends hand, the other tall with yellow hair reluctantly shakes with a dismissive grin. Onlookers amused. Internet cafe. Warm buddy moment."

gen 26 "Semi-realistic manga, vertical 9:16. University bulletin board with red banner 网络文化节CS表演赛. Students walking past. A young man stares intently at the banner. Autumn campus."

gen 27 "Semi-realistic manga, vertical 9:16. Overhead view. A young man crouching on dorm floor drawing tactical diagrams on paper. Another guy leaning down from top bunk watching upside-down. Cramped 2005 dorm."

gen 28 "Semi-realistic manga, vertical 9:16. A young man with yellow spiky hair hanging upside down from top bunk, grinning, giving OK hand sign, lollipop in mouth. Casual lazy dorm scene."

gen 29 "Semi-realistic manga, vertical 9:16. University computer lab tournament. Desktop computers, small speaker, 30+ spectators. Two teams facing off - one in matching shirts, one in casual clothes. A girl with DV camera at side. Tense atmosphere."

gen 30 "Semi-realistic manga, vertical 9:16. Close-up of two young men heads close together whispering before match. One putting on headphones. Intense focused expressions. Monitor glow side-lighting. Conspiratorial angle."

gen 31 "Semi-realistic manga, vertical 9:16. Abstract overhead view of a poker table with all chips pushed to center. All-in moment. Dark dramatic lighting. No characters. Bold decision symbolism."

gen 32 "Semi-realistic manga, vertical 9:16. Tournament moment - countdown to zero. Multiple hands hitting keyboards. Dynamic action. A girl with camera reporting in background. CS gaming competition energy."

gen 33 "Semi-realistic manga, vertical 9:16. Overhead tactical map view of CS Dust2 B site. Five arrows rushing B together. Flashbang and smoke icons at positions. Clean military-briefing style tactical diagram."

gen 34 "Semi-realistic manga, vertical 9:16. Opposing team players' faces in a row. Expressions shifting from confident to confused to panicked. Hands frantic on keyboards. Monitor glow from below. Dramatic manga reaction sequence."

gen 35 "Semi-realistic manga, vertical 9:16. Close-up side profile of a young man with yellow spiky hair in INTENSE gaming focus. Eyes blazing. Lollipop bitten in half. Fingers blur on keyboard. Screen reflects in eyes. Speed lines. Ultimate concentration."

gen 36 "Semi-realistic manga, vertical 9:16. Wide shot tournament. Score 12:12 displayed. Entire audience standing. One player alone in 1v3 clutch. Dead silence tension. Everyone watching screens. Dramatic."

gen 37 "Semi-realistic manga, vertical 9:16. Extreme close-up of a hand on mouse - slight tremor then decisive flick. Screen shows headshot effect. Impact lines radiating outward. The decisive clutch moment. Focus on hand and screen only."

gen 38 "Semi-realistic manga, vertical 9:16. Computer lab erupting in celebration. A tall yellow-haired guy standing arms raised in victory. A stocky young man beside him clapping and grinning. Crowd surging forward cheering. Euphoric energy. Warm triumphant light."

gen 39 "Semi-realistic manga, vertical 9:16. Hallway. A stern balding 55yo Chinese man in gray jacket, hands behind back, frowning as he glances through a doorway at celebrating students. Disapproval. He faces the DOOR not camera."

gen 40 "Semi-realistic manga, vertical 9:16. A young stocky Chinese man notices the stern older man walking away (receding figure). Smile unchanged but eyes deeper. A yellow-haired guy leans over to him. Hallway near computer lab."

gen 41 "Semi-realistic manga, vertical 9:16. Late night dorm room, others asleep. A young man on bottom bunk, face lit by ThinkPad laptop glow. Screen shows search page. Moonlight through window. Quiet intimate atmosphere."

gen 42 "Semi-realistic manga, vertical 9:16. Close-up of a 2005 flip phone vibrating in the dark, screen glowing blue with unknown number. Dark dorm room. Only the phone light visible. Suspenseful."

gen 43 "Semi-realistic manga, vertical 9:16. A young Chinese man holding flip phone to ear in dark dorm room. Expression gradually becoming focused and serious. Half face in moonlight shadow. Listening intently. Tension."

gen 44 "Semi-realistic manga, vertical 9:16. Close-up low angle of a young Chinese man's face. Confident smirk forming, eyes sharp like a predator. Dramatic underlighting. Decision and power moment. Heroic angle."

gen 45 "Semi-realistic manga, vertical 9:16. Back view. A young man standing on dorm balcony silhouette against 2005 night sky with stars. Wind blows white t-shirt. Lonely but determined figure. Beautiful cinematic night sky. Wide shot."

echo "=== ALL DONE $(date) ==="
