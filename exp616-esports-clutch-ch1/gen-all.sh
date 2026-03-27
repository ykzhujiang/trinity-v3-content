#!/bin/bash
set -e
BASEDIR="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image"
OUTDIR="$HOME/trinity-v3-content/exp616-esports-clutch-ch1/img"
API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
BASE_URL="https://king.tokenssr.com"
export HTTPS_PROXY="" HTTP_PROXY=""

ZJ40="Chinese man age 40, round face, big expressive eyes, short black hair slicked back, goatee stubble beard, stocky build 172cm"
ZJ20="Chinese man age 20 college student, round face, big expressive eyes, short black hair, clean-shaven, stocky build 172cm"
DAFEI="tall skinny Chinese man age 20, dyed yellow/blonde spiky hair, lollipop in mouth, lazy cocky expression, sharp narrow eyes"
CHEN="Chinese man age 55, balding on top, beer belly, gray jacket, stern expression"
LINWEI="Chinese woman age 21, short bob haircut, camera/DV on shoulder, curious expression"

gen() {
  local num=$1; shift
  local out="$OUTDIR/f$(printf '%02d' $num).png"
  if [ -f "$out" ]; then
    echo "SKIP f$num (exists)"
    return
  fi
  echo "=== Generating f$num ==="
  uv run "$BASEDIR/scripts/generate_image.py" \
    --api-key "$API_KEY" --base-url "$BASE_URL" \
    --prompt "$1" \
    --filename "$out" \
    --resolution 1K 2>&1 || echo "FAILED f$num"
  sleep 2
}

# ACT 1: 猝死→重生 (f1-f8)
# f01 already done

gen 2 "Semi-realistic manga, vertical 9:16. Medium shot, eye level. $ZJ40 in dark shirt clutching his chest in sudden pain at office desk, expression twisted in agony. Monitor screens blur behind him. He looks DOWN at his chest, NOT at camera. Cold blue office lighting. Dramatic manga-style impact lines around him. No text."

gen 3 "Semi-realistic manga, vertical 9:16. Close-up overhead shot looking down. $ZJ40 collapsed face-down on keyboard, cheek pressed against keys, eyes half-open fading. Monitor shows '估值：48亿' in Chinese. A coffee cup tipped over, coffee liquid slowly spreading across desk. Dramatic shadows. He faces the keyboard NOT the camera. No text on image except the monitor text."

gen 4 "Semi-realistic manga, vertical 9:16. Pure black background with a single small white point of light in the center. Minimalist abstract composition. Represents death/void/transition. No characters, no text."

gen 5 "Semi-realistic manga, vertical 9:16. Close-up of an old-fashioned mechanical alarm clock ringing, hands pointing to 7:00. Behind it, a worn wooden nightstand. Warm golden morning light streaming in. 2005 Chinese college dorm atmosphere. Nostalgic warm tones. No text."

gen 6 "Semi-realistic manga, vertical 9:16. Medium shot, slight low angle. $ZJ20 in white tank top sitting bolt upright in a bottom bunk bed in shock, messy hair, wide eyes. Above him on the top bunk, $DAFEI hand hanging over the edge, snoring. Dorm wall has 2005-era posters. A paper calendar shows '2005年9月15日'. Morning light. He looks at his own hands in disbelief, NOT at camera. No text."

gen 7 "Semi-realistic manga, vertical 9:16. Medium shot. $ZJ20 in white tank top standing at dorm sink, gripping the wash basin, staring wide-eyed at his young reflection in a small iron mirror. A class schedule is pinned next to the mirror. His expression is shock mixed with joy. He stares at the MIRROR, NOT at camera. 2005 Chinese college dorm bathroom. No text."

gen 8 "Semi-realistic manga, vertical 9:16. Medium shot, slight low angle. $ZJ20 grinning with determination, eyes shining with fire, one fist slammed down on the sink counter. Morning light streams through window behind him. Heroic composition. He looks slightly upward to the side, NOT at camera. No text."

# ACT 2: 网吧觉醒+收服大飞 (f9-f25)
gen 9 "Semi-realistic manga, vertical 9:16. Wide shot. 2005 Chinese university campus in early autumn. Students riding bicycles, club recruitment banners, morning joggers. Yellow-tinged leaves. $ZJ20 in white sports t-shirt, jeans, sneakers walks among the crowd, looking around at the nostalgic scene. He looks at the CAMPUS, NOT at camera. Warm nostalgic lighting. No text."

gen 10 "Semi-realistic manga, vertical 9:16. Medium shot. Chinese college cafeteria, several students sitting around a table with enamel plates, earnest expressions discussing. $ZJ20 walks past carrying a tray, glancing sideways at them. He looks at the STUDENTS, NOT at camera. 2005 era atmosphere. No text."

gen 11 "Semi-realistic manga, vertical 9:16. Wide shot. A small commercial street. Neon sign reading '飞翔网吧' (Flying Internet Cafe) lit up even in daytime. Bicycles parked outside. $ZJ20 stands at the entrance looking UP at the sign. Street scene, 2005 China. He looks at the SIGN, NOT at camera. No text except the cafe name on sign."

gen 12 "Semi-realistic manga, vertical 9:16. Medium shot. Inside a smoky 2005 Chinese internet cafe. Rows of CRT monitors. Oily keyboards. Someone eating instant noodles in the corner. An older man watching stock charts at next terminal. $ZJ20 walking in, taking a deep breath. Warm amber interior lighting, haze of cigarette smoke. He looks at the INTERIOR, NOT at camera. No text."

gen 13 "Semi-realistic manga, vertical 9:16. Medium shot, side angle. $ZJ20 in white t-shirt sitting at a CRT monitor showing Windows XP desktop with Counter-Strike 1.6 loading. His hands rest on the old oily keyboard. He looks at the SCREEN. 2005 internet cafe environment. Nostalgic warm lighting. No text."

gen 14 "Semi-realistic manga, vertical 9:16. Close-up of hands on keyboard. $ZJ20 hands operating, screen shows CS 1.6 crosshair tracking but slightly shaking. His brow slightly furrowed in concentration. Focus on hands and screen, NOT face toward camera. No text."

gen 15 "Semi-realistic manga, vertical 9:16. Medium shot, side angle. At the NEXT terminal, $DAFEI slouching in chair, one foot up on desk, lollipop in mouth, looking bored and lazy. But his hands are a BLUR on keyboard. His CS screen shows a triple kill 1v3. Stark contrast between lazy posture and insane gameplay. He looks at HIS screen, NOT at camera. No text."

gen 16 "Semi-realistic manga, vertical 9:16. Close-up of $ZJ20 face in profile, eyes sharp and intense, staring at the next terminal's screen. The look of a talent scout who just found a diamond. Dramatic manga lighting - half face illuminated by screen glow. He looks to the SIDE at the other screen, NOT at camera. No text."

gen 17 "Semi-realistic manga, vertical 9:16. Abstract conceptual panel - a balance scale in $ZJ20 mind. Left side labeled '等待' (Wait) with cautious imagery, right side labeled '出击' (Strike) with bold imagery. The scale tips heavily to the right. Manga thought-bubble style border. Decision moment visualization. Moody internal monologue atmosphere."

gen 18 "Semi-realistic manga, vertical 9:16. Medium shot. $ZJ20 has pulled his chair next to $DAFEI, pointing at DAFEI's screen replay. Dafei still has lollipop, giving a 'who are you' confused look. Close physical proximity, two people at one desk. Neither looks at camera. 2005 internet cafe background. No text."

gen 19 "Semi-realistic manga, vertical 9:16. Close-up of $DAFEI face - lollipop nearly falling out of mouth, eyes wide in shock. Manga-style surprise effect lines around his head. Dramatic reaction shot. He looks at ZJ (to the side), NOT at camera. No text."

gen 20 "Semi-realistic manga, vertical 9:16. Medium shot. $ZJ20 leaning back in chair confidently, one finger raised, smiling knowingly. $DAFEI across from him looking bewildered. Internet cafe ambient background. ZJ looks at DAFEI, NOT at camera. Conversational scene. No text."

gen 21 "Semi-realistic manga, vertical 9:16. Wide shot. $ZJ20 standing at a whiteboard in corner of internet cafe (normally used for price list), writing with a marker. $DAFEI and 3-4 curious onlookers gathered around watching. ZJ draws diagrams on the whiteboard. Smoky internet cafe. He faces the WHITEBOARD, NOT camera. No text."

gen 22 "Semi-realistic manga, vertical 9:16. Close-up of the whiteboard showing hand-drawn industry chain diagram with Chinese labels: 直播平台→赛事体系→选手经纪→周边电商→广告赞助, each node marked '十亿级'. Messy but logical handwriting. Marker-drawn style. No character faces visible."

gen 23 "Semi-realistic manga, vertical 9:16. Medium shot. Group reaction shot: several onlookers with various expressions - one blank, one skeptical smirk. In the corner, an older man eating instant noodles making a sarcastic comment (half-bald head visible). $DAFEI arms crossed, head tilted, studying the whiteboard. Nobody looks at camera. Internet cafe background. No text."

gen 24 "Semi-realistic manga, vertical 9:16. Close-up of $DAFEI face. He pulls the lollipop stick out of his mouth, expression transitioning from doubt to... excitement. Eyes starting to light up. Manga-style sparkle beginning in his eyes. Dramatic character moment. He looks slightly to the side, NOT at camera. No text."

gen 25 "Semi-realistic manga, vertical 9:16. Medium shot. $ZJ20 extending his hand for a handshake. $DAFEI looking at the hand with a dismissive 'tch' expression but reaching out to shake it anyway. Behind them, curious onlookers watching with amused expressions. Internet cafe background. Both look at each other's HANDS, NOT at camera. Warm buddy-moment lighting. No text."

# ACT 3: 校内赛 (f26-f38)
gen 26 "Semi-realistic manga, vertical 9:16. Wide shot. University bulletin board with a red banner reading '网络文化节——CS表演赛'. Students walking past, mostly indifferent. $ZJ20 standing to the side, staring intently at the banner poster. Autumn campus background. He looks at the POSTER, NOT at camera. No text except the banner."

gen 27 "Semi-realistic manga, vertical 9:16. Medium overhead shot. $ZJ20 crouching on dorm floor, drawing tactical diagrams on paper like a football coach. $DAFEI leaning over from top bunk, head hanging down looking at the drawings upside-down. Cramped dorm room, 2005 era. Both look at the DRAWINGS. No text."

gen 28 "Semi-realistic manga, vertical 9:16. Medium shot. $DAFEI hanging off the edge of top bunk upside down, giving an OK hand sign with a grin, lollipop in mouth. Casual lazy pose. He looks at ZJ below him, NOT at camera. Dorm room background. No text."

gen 29 "Semi-realistic manga, vertical 9:16. Wide shot. University computer lab as makeshift tournament venue. A dozen desktop computers, small speaker on a table, 30-40 student spectators. Opposing team in matching t-shirts on one side. $ZJ20's team of 5 in casual clothes on other side, looking serious. $LINWEI with DV camera at side. Nobody looks at camera. Tense atmosphere. No text."

gen 30 "Semi-realistic manga, vertical 9:16. Close-up, tight framing. $ZJ20 putting on headphones, whispering to $DAFEI next to him. Their heads close together, conspiratorial angle. Intense focused expressions. Both look at each other, NOT at camera. Dramatic side-lighting from monitor glow. No text."

gen 31 "Semi-realistic manga, vertical 9:16. Abstract decision visualization. A poker/gambling table from above, chips pushed to center. Represents 'all-in' decision. Bold dramatic lighting. No characters visible, pure conceptual. Dark dramatic atmosphere. No text."

gen 32 "Semi-realistic manga, vertical 9:16. Medium shot. Tournament starting - countdown on screens going to zero. Multiple hands hitting keyboards simultaneously. CS gun sounds implied. $LINWEI in background with DV camera reporting. Dynamic action composition. Players look at SCREENS. Exciting atmosphere. No text."

gen 33 "Semi-realistic manga, vertical 9:16. Overhead tactical view showing a CS map diagram (Dust2 style) with 5 arrows all pushing B site together. Flashbang and smoke grenade icons marked at key positions. Clean tactical diagram overlaid on the map. Military briefing aesthetic. No text except tactical symbols."

gen 34 "Semi-realistic manga, vertical 9:16. Medium shot. Opposing team players' faces in a row - expressions changing from confident to confused to panicked. Their hands becoming frantic on keyboards. Monitor glow lights their faces from below. They look at their SCREENS in disbelief. Dramatic manga reaction sequence. No text."

gen 35 "Semi-realistic manga, vertical 9:16. Close-up side profile of $DAFEI during intense gaming. His lazy expression completely TRANSFORMED into fierce concentration, eyes blazing, lollipop bitten in half. Fingers blur on keyboard. Screen reflects in his eyes. He stares at the SCREEN. Manga speed lines. Ultimate focus moment. No text."

gen 36 "Semi-realistic manga, vertical 9:16. Wide shot. Score display shows 12:12. $DAFEI in 1v3 situation. Entire audience standing up, some clenching fists. Dead silence implied - everyone frozen watching screens. Dramatic tension. Spectators look at SCREENS. Stadium/venue wide angle. No text except score numbers."

gen 37 "Semi-realistic manga, vertical 9:16. Extreme close-up of $DAFEI right hand on mouse - slight tremor, then a sudden decisive flick. Screen shows CS headshot effect. Manga impact lines radiating from the screen. The decisive moment - the clutch. Focus on HAND and SCREEN only. Dramatic lighting. No text."

gen 38 "Semi-realistic manga, vertical 9:16. Wide shot, slight low angle. Computer lab erupting in celebration. $DAFEI standing with both arms raised in victory. $ZJ20 beside him clapping and smiling broadly. Crowd of spectators surging toward them, cheering. $LINWEI pushing through crowd with DV camera. Euphoric energy. Nobody looks at camera. Warm triumphant lighting. No text."

# ACT 4: 尾声+悬念 (f39-f45)
gen 39 "Semi-realistic manga, vertical 9:16. Medium shot. Hallway outside computer lab. $CHEN (balding 55yo man in gray jacket, beer belly) walking past the door, hands behind back, frowning disapproval as he glances inside at celebrating students. His back mostly to us. Stern authoritarian figure. He looks at the DOOR, NOT at camera. No text."

gen 40 "Semi-realistic manga, vertical 9:16. Medium shot. $ZJ20 notices $CHEN walking away (shown as receding figure in background). ZJ's smile unchanged but eyes gain a deeper knowing look. $DAFEI leaning over to ZJ. Hallway/computer lab doorway. ZJ looks at CHEN's retreating figure, NOT at camera. No text."

gen 41 "Semi-realistic manga, vertical 9:16. Medium shot. Late night dorm room, everyone asleep. $ZJ20 sits on bottom bunk, face lit by a 2005-era ThinkPad laptop screen. Screen shows search page: '2005年WCG中国赛区报名'. Quiet intimate atmosphere. Moonlight through window. He looks at LAPTOP screen. No text except on screen."

gen 42 "Semi-realistic manga, vertical 9:16. Close-up of a 2005 flip phone vibrating on the bunk bed, screen lighting up showing an unknown number. Dark dorm room, only the phone's blue glow visible. Dramatic tension. No character face visible. No text."

gen 43 "Semi-realistic manga, vertical 9:16. Medium shot. $ZJ20 holding flip phone to ear, listening. His expression gradually becomes focused and serious. Phone held to LEFT ear, face in half-shadow, half-lit by moonlight. He's looking at the dorm window while listening. NOT at camera. Tension building. No text."

gen 44 "Semi-realistic manga, vertical 9:16. Close-up, slight low angle. $ZJ20 face - corner of mouth slowly curling into a confident smirk, eyes sharp like a predator. Dramatic manga-style lighting from below. He looks slightly to the SIDE. Power and confidence radiating. Decision moment. Heroic angle. No text."

gen 45 "Semi-realistic manga, vertical 9:16. Wide shot from behind. $ZJ20 standing on dorm balcony, silhouette against 2005 night sky - fewer city lights, some stars visible. Wind blows his white t-shirt. Back view, looking up at sky. Lonely but determined figure. Dramatic cinematic composition. NOT facing camera (back view). Beautiful night sky. No text."

echo "=== ALL DONE ==="
