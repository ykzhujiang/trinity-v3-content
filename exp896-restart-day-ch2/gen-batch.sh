#!/bin/bash
set -e
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"
SCRIPT="$HOME/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
REF="$HOME/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
OUT="$HOME/trinity-v3-content/exp896-restart-day-ch2/images"
cd "$OUT"

# Character descriptions for consistency
ZJ="a Chinese man in his early 30s with black hair slicked back, short stubble beard, round face, big eyes, sturdy build 172cm 80kg, based on the reference photo"
XW="a young Chinese woman in her mid-20s with a ponytail, round face, cheerful expression, wearing office casual"
CM="a slightly overweight Chinese man in his late 30s with square-framed glasses, friendly face"
ZJ_INVESTOR="a sharp Chinese businesswoman in her 40s with short bobcut hair, strong presence, wearing elegant navy blazer"

# Common style prefix
STYLE="Vertical 9:16 portrait format. Semi-realistic manga style with bright warm colors. Cinematic composition. Characters never look at camera - they look at story objects or other characters."

gen() {
  local fname="$1"
  shift
  if [ -f "$fname" ]; then
    echo "SKIP $fname (exists)"
    return
  fi
  echo "GEN $fname..."
  uv run "$SCRIPT" --prompt "$STYLE $*" --filename "$fname" -i "$REF" --resolution 1K 2>&1 | tail -2
}

# Beat 1 — 7:01觉醒 (4 frames)
gen p01.png "Overhead close-up of an alarm clock showing 7:01 on a wooden nightstand. A man's hand reaching toward phone. Warm golden morning sunlight through curtains. Only hand and objects visible. Chinese text on clock: 7:01"

gen p02.png "Medium shot from the side. $ZJ wearing white t-shirt and black sweatpants, sitting on edge of bed, looking at phone with surprised joy. Behind him on the wall is a crazy detective board covered in colorful sticky notes. Morning light. He looks toward the sticky notes wall, not at camera."

gen p03.png "Close-up of a wall covered in colorful sticky notes with Chinese handwriting. Notes read: 小王咖啡, 陈明9:47, 赵姐银色胸针. The biggest note says: 别穿那件蓝衬衫——第3次循环已验证=衰运. Warm lighting, shot from straight on."

gen p04.png "Medium shot. $ZJ in white t-shirt and black sweatpants stretching and looking at himself in a bathroom mirror with a self-deprecating smile. He looks at his reflection in the mirror, NOT at camera. Warm morning light. Speech bubble in Chinese: 第六天了。别人的土拨鼠日只过一天，我直接开了Season Pass。"

# Beat 2 — 小王咖啡 (4 frames)
gen p05.png "Wide shot of a bright modern startup office hallway. $ZJ wearing dark gray casual blazer with white shirt slightly open and no tie, standing at a corner looking ahead at a mop bucket on the floor. Time indicator: 9:10. Clean modern office aesthetic. He faces away from camera toward the hallway."

gen p06.png "$ZJ in dark gray casual blazer bending down to move a mop bucket to the wall corner. Relaxed expression like he's done this 100 times. Semi-transparent debug overlay text: [FIX] Remove root cause instead of handling exception. Bright office hallway."

gen p07.png "$XW carrying a coffee cup walking safely past where the bucket was, turning her head back in surprise toward $ZJ. Speech bubble: 朱总？你怎么知道那里有桶？ Bright startup office. She looks toward him, not at camera."

gen p08.png "Medium shot of $ZJ tilting his head with a charming smirk. Semi-transparent UI overlay showing options: A 直觉 (with checkmark) / B 我经历了5次今天 / C 不解释走开. Internal thought bubble: 说真话她会叫120。先帅一把。 Bright office. He looks slightly upward-sideways in thought, not at camera."

# Beat 3 — 陈明电话 (4 frames)
gen p09.png "Close-up of a smartphone screen showing incoming call from 陈明, time display 9:47. Floor-to-ceiling window with city skyline in background, bright daylight."

gen p10.png "Medium shot. $ZJ in dark gray casual blazer standing by floor-to-ceiling window, speaking on phone with a slight smile, preempting the caller. Speech bubble: PPT第12页改了，还有什么？ Phone speech bubble: 你怎么知道我要说…… City skyline behind him. He looks out the window."

gen p11.png "Split-screen composition. Left side: $ZJ by window looking serious. Right side: $CM on other end of phone looking confused. Chen Ming is a slightly overweight man with square glasses. Speech bubble from Chen Ming: ……你是不是又熬夜了？我给你带了咖啡，下来拿。"

gen p12.png "Same split screen but with humorous narration text overlay: 陈明回应公式：你是不是又__了？我给你__了。六次循环，模板不变。 Semi-transparent debug log style. Both characters shown from the side."

# Beat 4 — 路演新策略 (3 frames)
gen p13.png "Side tracking shot of $ZJ in dark gray blazer walking confidently on a modern city street. Calm composed expression, contrast to anxiety. Internal monologue bubble: 前5次我在优化表演。这次我要优化状态。 Street background blurred, bright daylight."

gen p14.png "POV shot from $ZJ's perspective - a delivery rider on an electric scooter running a red light, the delivery box clearly reads 小朱家常菜 in Chinese. Debug overlay: [NOTE] 环境细节可能不是随机的。小朱……？ City intersection, bright."

gen p15.png "Doorframe composition. $ZJ's back silhouette looking into a meeting room where $ZJ_INVESTOR sits. She wears a blue teardrop-shaped brooch instead of the expected silver geometric one. Internal thought: 前5次银色几何。今天蓝色水滴？她也在变？ Corporate meeting room, bright."

# Beat 5 — 路演·赵姐变奏 (4 frames)
gen p16.png "Wide shot of modern meeting room with floor-to-ceiling windows showing city panorama. $ZJ standing in front of projection screen, relaxed posture. $ZJ_INVESTOR in foreground slightly blurred. He faces the screen/audience, not camera."

gen p17.png "Medium close-up of $ZJ_INVESTOR raising her hand to interrupt, expression curious not critical. Short bobcut hair, navy blazer, blue teardrop brooch visible. Speech bubble: 上一次你说想让AI成为每个人的朋友。我回去想了一晚上。 She looks toward where Zhu Jiang would be standing."

gen p18.png "Dramatic close-up of $ZJ's face showing shock. Pupils slightly contracted. He looks in the direction of the investor woman, NOT at camera. Internal thought: 她记得上次循环？还是说…… Cinematic lighting from the windows."

gen p19.png "$ZJ_INVESTOR leaning back in chair, arms crossed, a mix of scrutiny and smile. Speech bubble: 别紧张。你昨天说的和今天的PPT，完全是两个人在讲。 Narration: 真诚的痕迹……会积累在别人身上。 She looks toward the presentation area."

# Beat 6 — 核心发现 (4 frames)
gen p20.png "Bird's eye view of a cafe table. An open notebook full of diagrams, arrows, and relationship maps spread across the table. A cup of black coffee beside it. Warm cafe lighting, afternoon. Labels visible: 根因, 表象, 隐藏状态. Cozy atmosphere."

gen p21.png "Close-up of the notebook pages. Six loops of event network diagrams with annotations in Chinese. Red circles around key nodes. The notes show a pattern emerging. Detective board on paper style."

gen p22.png "$ZJ in the cafe, jacket draped over chair back, white shirt sleeves rolled up. He rests chin on hand, eyes lighting up with epiphany. He looks down at the notebook. Large debug overlay: [INSIGHT] 循环不是让我优化自己——是让我理解别人。每个NPC不是NPC，是有隐藏状态的完整程序。 Warm cafe light."

gen p23.png "$ZJ covering his face with both hands, self-deprecating bitter smile visible between fingers. Speech bubble: 创业CEO花了6天才发现用户才是核心。说出去丢人…… Warm cafe, afternoon light. He looks down, not at camera."

# Beat 7 — DECISION-3 黄昏 (5 frames)
gen p24.png "POV shot: looking down at an office desk. A recruiter's resume/business card visible on the desk. Evening golden light from window falling on the papers. Chinese text visible on the paper: some recruiter company logo and 陈明's name."

gen p25.png "Close-up of the headhunter company logo and Chen Ming's name on the resume paper, golden sunset light illuminating it. Dramatic lighting, warm tones."

gen p26.png "$CM looking up and seeing $ZJ, awkwardly shoving the resume into a desk drawer. The two men's eyes meet. Sunset backlighting through office window. They look at each other, NOT at camera. Tension and guilt in the air. Chen Ming is slightly overweight with square glasses."

gen p27.png "Large DECISION-3 marker. Options overlay UI: A 假装没看到 / B 直接问你想走？ / C 我如果是你也会看看别的机会 (checkmark) / D 那家给多少？我也投一份. $ZJ's internal monologue: 菩萨心肠，霹雳手段。但这一刻，只需要菩萨心肠。 Sunset office."

gen p28.png "$ZJ pulling a chair to sit next to $CM. Both men sitting side by side looking out the window at the sunset cityscape. NOT facing camera. Chen Ming looking down. Speech bubble from Chen Ming: 不是钱的问题。是……我看不懂公司的方向了。 Narration: 真正的bug从来不在简历上——在未说出口的那句话里。 Warm golden sunset light."

# Beat 8 — 夜幕·系统提示 (4 frames)
gen p29.png "Side silhouette of $ZJ sitting alone in a dark office lit only by a desk lamp. City night skyline through window. His phone screen glows. He faces the window. Moody but not dark-horror, still warm undertones. White shirt high rolled sleeves, collar loose, slightly messy hair."

gen p30.png "Close-up of phone screen showing an app notification with an infinity ∞ symbol. Chinese text: Loop 6 解锁成就：【Root Cause Analysis】。奖励：+120秒。下一个断点：找到你最大的未处理exception。 Dark background, phone glow."

gen p31.png "$ZJ's expression going from shock to a wry smile, looking at his phone. He looks down at the phone, NOT at camera. City night background. Speech bubble: ……这循环还有成就系统？ Warm desk lamp lighting his face from the side."

gen p32.png "$ZJ frantically trying to screenshot the phone - the notification has disappeared. He's rolling his eyes in frustration. Debug overlay: [BUG] 系统通知无法截图。Feature or bug？倾向feature——开发者和我一样讨厌screenshot testing。 Night office, comedic tone."

# Beat 9 — 第七天·悬念 (5 frames)
gen p33.png "Close-up of alarm clock showing 7:03. Same nightstand as p01 but the morning light is warmer and brighter. Emphasis on the time: three minutes more than the first loop. Warm golden tones."

gen p34.png "$ZJ picking up his phone from the nightstand. His expression suddenly changes - something unexpected on the screen. White t-shirt, morning. He looks at the phone screen, NOT at camera. Dramatic."

gen p35.png "Phone screen close-up showing a group photo of $ZJ with several unfamiliar people, all smiling. Small text at bottom: Version 0.7 — 6/7 exceptions handled. The photo looks warm and friendly. One figure on the far right is slightly blurred."

gen p36.png "Zoomed-in crop of the right edge of the group photo. A blurred but recognizable silhouette - short hair, sharp features, capable look... the investor woman in casual clothes, actually smiling warmly. Chinese text overlay: 等等……是赵姐？穿便装的赵姐，在笑？"

gen p37.png "Black screen with white Chinese text centered: 第七天。距离debug完成——还剩一个exception。 Below in slightly smaller text: 【重启日·第三章：未处理的exception】即将载入…… Minimalist, dramatic."

echo "=== ALL DONE ==="
