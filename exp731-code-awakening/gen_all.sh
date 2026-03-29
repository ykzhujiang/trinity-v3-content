#!/bin/bash
# EXP-731 Code Awakening - Batch image generation
set -e

SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
OUTDIR="/Users/ahzhu_agent/trinity-v3-content/exp731-code-awakening/images"
cd "$OUTDIR"

export GEMINI_API_KEY="$(python3 -c "import json; print(json.load(open('/Users/ahzhu_agent/.openclaw/openclaw.json'))['skills']['entries']['gemini-image']['env']['GEMINI_API_KEY'])")"
export GEMINI_BASE_URL="$(python3 -c "import json; print(json.load(open('/Users/ahzhu_agent/.openclaw/openclaw.json'))['skills']['entries']['gemini-image']['env']['GEMINI_BASE_URL'])")"

# Character anchors:
# 朱江(ZJ): Chinese man 30s, short black hair combed back, stubble beard, big round eyes, stocky 172cm 80kg, NO glasses
# 小陈(XC): tall thin Chinese man 20s, messy hair, thick black-frame glasses, lanky
# 林薇(LW): Chinese woman 30s, sharp short bob haircut, professional suit, tall, cold expression

gen() {
  local fname="$1"
  local prompt="$2"
  if [ -f "$fname" ]; then
    echo "SKIP: $fname exists"
    return
  fi
  echo "GEN: $fname"
  uv run "$SCRIPT" --prompt "$prompt" --filename "$fname" --resolution 1K 2>&1 | tail -3
  sleep 2
}

# === SECTION 1: 量子风暴前夜 (f01-f05) ===
# f01 already generated, skip
gen "f02-xiaochen-roast.jpg" \
  "Vertical 9:16 cinematic manga panel, close-up shot. A tall thin Chinese man in his 20s with messy unkempt hair and thick black-frame glasses (小陈) leans against a desk, smirking mockingly at someone off-screen. He wears a wrinkled hoodie. Office background with whiteboards. Realistic manga style. NOT looking at camera. Chinese speech bubble: '老板，你这代码跟你的胡子一样粗犷'"

gen "f03-news-broadcast.jpg" \
  "Vertical 9:16 cinematic manga panel. A large wall-mounted TV screen in a startup office showing a news broadcast about quantum computing breakthrough. Green and blue tech graphics on screen. Two silhouettes watching the TV from behind - one stocky (朱江) one tall thin (小陈). Dramatic blue glow from TV illuminates the dark office. Realistic manga style. Chinese text on TV screen: '全球量子计算实验即将突破'"

gen "f04-office-vibe.jpg" \
  "Vertical 9:16 cinematic manga panel, wide establishing shot. A small but busy startup office at night - open floor plan, several desks with monitors, sticky notes on walls, a small kitchen area with instant noodle cups. Through large windows, city lights sparkle. A stocky Chinese man (black hair combed back, stubble, black T-shirt) sits at the center desk typing. Warm amber lighting. Realistic manga style. No one looks at camera."

gen "f05-phone-notification.jpg" \
  "Vertical 9:16 cinematic manga panel, extreme close-up of a smartphone screen showing multiple notifications about quantum computing news. The phone is held by a hand with stubble-bearing wrist visible. Screen shows Chinese headlines: '量子风暴倒计时48小时' and '全球科学家紧急会议'. Realistic manga style, dramatic lighting."

# === SECTION 2: 风暴降临 (f06-f10) ===
gen "f06-screens-flicker.jpg" \
  "Vertical 9:16 cinematic manga panel, dynamic angle. Multiple computer monitors in a startup office suddenly display static and glitch patterns. A stocky Chinese man (short black hair combed back, stubble, big eyes, black T-shirt) pushes back from his desk in shock, chair rolling. Papers flying. Dramatic manga speed lines and lighting effects. Realistic manga style. He looks at the screens NOT at camera. Chinese thought bubble: '什么情况？！'"

gen "f07-city-blackout.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic wide shot from office window. A Chinese city at night going completely dark - blocks of lights shutting off in sequence like falling dominoes. A silhouette of a stocky man stands at the floor-to-ceiling window watching the cascade blackout. Lightning in the sky. Dramatic atmosphere. Realistic manga style."

gen "f08-phones-brick.jpg" \
  "Vertical 9:16 cinematic manga panel, close-up. Multiple smartphones on an office desk, all showing blue screen of death or frozen screens. A stocky man's hands (stubble beard visible in blurred foreground) hover helplessly over the dead phones. Dramatic dark lighting with only the faint glow of dying screens. Realistic manga style."

gen "f09-first-green-code.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic POV shot. First-person perspective - looking down at own hands in a dark room, but translucent green digital code streams are flowing through the air like Matrix code rain, overlaying reality. The green data streams wrap around nearby electronic devices. Eerie beautiful green glow in darkness. Realistic manga style. Chinese inner monologue text: '我眼花了？这些绿色的东西是什么？'"

gen "f10-rubbing-eyes.jpg" \
  "Vertical 9:16 cinematic manga panel, medium close-up. A stocky Chinese man (short black hair combed back, stubble, big round eyes, black T-shirt) rubbing his eyes vigorously with both fists. Around him, faint translucent green code streams are visible in the air. Morning sunlight through blinds. He looks confused and worried. NOT looking at camera. Realistic manga style. Chinese thought bubble: '一定是熬夜太多产生幻觉了'"

# === SECTION 3: 代码视觉觉醒 (f11-f16) ===
gen "f11-morning-discovery.jpg" \
  "Vertical 9:16 cinematic manga panel, wide shot. A stocky Chinese man (short black hair combed back, stubble, black T-shirt, jeans) walks into the restored-power office in morning light. Green translucent code data streams are flowing out of every electronic device - monitors, routers, phones. Only he can see them. His expression is shocked, mouth slightly open. NOT looking at camera. Realistic manga style."

gen "f12-seeing-data-streams.jpg" \
  "Vertical 9:16 cinematic manga panel, over-the-shoulder shot. Looking over the shoulder of a stocky Chinese man toward a colleague's phone on a nearby desk. Green translucent data streams rise from the phone showing chat messages and emojis in holographic form. The man's profile shows wide-eyed amazement. Realistic manga style. Chinese thought bubble: '我能看到他手机里的聊天记录？'"

gen "f13-router-data.jpg" \
  "Vertical 9:16 cinematic manga panel, dynamic low angle. A Wi-Fi router on a shelf with massive green data streams flowing from it like a digital fountain, branching into hundreds of thin threads going to different directions. A stocky Chinese man crouches below looking up at it in awe. Green light illuminates his stubbled face from below. Realistic manga style."

gen "f14-decision1-temptation.jpg" \
  "Vertical 9:16 cinematic manga panel, split-composition. Left side: green data streams from a neighboring company's server revealing confidential documents floating in the air. Right side: close-up of a stocky Chinese man's face (short black hair, stubble, big eyes) showing internal conflict - one eye reflecting green code, hand clenched. Dramatic lighting. Realistic manga style. Chinese text overlay: '[决策点一] 偷看？还是移开目光？'"

gen "f15-decision1-choice.jpg" \
  "Vertical 9:16 cinematic manga panel, medium shot. A stocky Chinese man (short black hair combed back, stubble, black T-shirt) deliberately turns his head away from floating green data streams, eyes closed with a resolved expression. He's clenching his fist. The green streams fade on one side. Morning office light. Realistic manga style. NOT looking at camera. Chinese inner monologue: '我是创业者，不是小偷。有些底线不能碰。'"

gen "f16-decision1-resolve.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic close-up of a fist clenching on a desk. The knuckles are white. Above the fist, faint green code streams flow past harmlessly. A nameplate on the desk reads: '朱江 CEO'. Realistic manga style. Clean composition."

# === SECTION 4: 能力试探 (f17-f22) ===
gen "f17-testing-power.jpg" \
  "Vertical 9:16 cinematic manga panel, over-shoulder shot. A stocky Chinese man (short black hair, stubble, black T-shirt) reaches out his hand toward a computer monitor. From his fingertips, green energy connects to the code on screen. Lines of code are rearranging themselves. His expression is focused and curious. NOT looking at camera. Realistic manga style."

gen "f18-code-fixing-magic.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic wide shot. A stocky Chinese man sitting at his desk, but surrounded by swirling green holographic code in a dome around him. His hands move through the air like conducting an orchestra, code blocks moving and connecting. His face shows concentration and growing excitement. Dark office, green glow dominant. Realistic manga style."

gen "f19-xiaochen-shocked.jpg" \
  "Vertical 9:16 cinematic manga panel, reaction shot. A tall thin Chinese man with messy hair and thick black-frame glasses (小陈) stares at a monitor screen with his jaw dropped, coffee cup frozen mid-sip. The screen shows commit logs scrolling at impossible speed. His eyes are comically wide behind the glasses. NOT looking at camera. Realistic manga style. Chinese speech bubble: '老板你今天debug速度怎么跟吃了摇头丸似的？！'"

gen "f20-efficiency-graph.jpg" \
  "Vertical 9:16 cinematic manga panel, close-up of a monitor screen showing a productivity dashboard. A line graph shoots nearly vertical - labeled '今日代码提交量'. Numbers show 10x the usual output. A stocky man's reflection is barely visible in the screen, smirking. Green tint from code streams visible at edges. Realistic manga style. Chinese text on screen: '效率提升：1000%'"

gen "f21-playing-it-cool.jpg" \
  "Vertical 9:16 cinematic manga panel, two-shot. A stocky Chinese man (short black hair, stubble, black T-shirt) leans back in his office chair with a deliberately casual expression, hands behind his head. A tall thin man with glasses (小陈) stands beside him looking suspicious, arms crossed. Comedic atmosphere. NOT looking at camera. Realistic manga style. 朱江's speech bubble: '可能是我昨晚吃的外卖开窍了吧' 小陈's speech bubble: '你脑子被咖啡因烧坏了吧'"

gen "f22-secret-smile.jpg" \
  "Vertical 9:16 cinematic manga panel, close-up profile shot. A stocky Chinese man (short black hair combed back, stubble) walks down an office hallway, the corner of his mouth turned up in a secretive smile. Faint green code reflections in his dark eyes. Dramatic side lighting from a window. NOT looking at camera. Realistic manga style. Chinese inner monologue: '这个能力...也许能改变一切'"

# === SECTION 5: 不速之客 (f23-f28) ===
gen "f23-linwei-entrance.jpg" \
  "Vertical 9:16 cinematic manga panel, low angle dramatic shot. A Chinese woman in her early 30s (sharp short bob haircut, cold beautiful face, wearing a tailored dark blue business suit, tall and commanding) walks into a small startup office. She carries a leather briefcase. Her posture is perfect, expression controlled. Office workers look up. Dramatic lighting from behind her. NOT looking at camera. Realistic manga style."

gen "f24-meeting-room.jpg" \
  "Vertical 9:16 cinematic manga panel, wide shot of a small glass-walled meeting room. A stocky Chinese man (short black hair, stubble, black T-shirt) sits across from a sharp-looking Chinese woman (short bob, navy suit). Between them, documents and a laptop. She presents an investment proposal. He listens with his arms crossed, one eyebrow raised. Green data streams faintly visible only around her phone. NOT looking at camera. Realistic manga style."

gen "f25-too-good-offer.jpg" \
  "Vertical 9:16 cinematic manga panel, close-up of a contract document on a table. A pen rests beside it. The terms shown are incredibly generous - Chinese text visible: '投资金额：5000万' '董事会席位：零要求' '对赌条件：无'. A stocky man's hand hovers near the pen hesitantly. Realistic manga style."

gen "f26-scanning-phone.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic POV shot from the stocky man's perspective. Looking at the woman (short bob, navy suit) sitting across the table who is checking her phone. From his special vision: green encrypted data streams flow from her phone, and among them a fragmented message is visible: '方舟...目标已接触...觉醒者确认'. The woman is unaware. Realistic manga style. Chinese thought bubble: '方舟？她到底是谁？'"

gen "f27-decision2.jpg" \
  "Vertical 9:16 cinematic manga panel, intense close-up. A stocky Chinese man's face (short black hair, stubble, big round eyes) showing calculated thought. Split lighting - one half warm office light, other half cool green code glow. His eyes are narrowed, thinking hard. NOT looking at camera. Realistic manga style. Chinese text overlay: '[决策点二] 当面揭穿？还是暗中调查？'"

gen "f28-decision2-choice.jpg" \
  "Vertical 9:16 cinematic manga panel, medium shot. A stocky Chinese man (short black hair, stubble, black T-shirt) shakes hands with a sharp Chinese woman (short bob, navy suit) with a confident smile, but his other hand behind his back has fingers crossed. Symbolic duality. Meeting room background. Neither looks at camera. Realistic manga style. Chinese inner monologue: '先收下你的钱，再摸清你的底牌。霹雳手段，需要信息优势。'"

# === SECTION 6: 暗网信号 (f29-f32) ===
gen "f29-3am-office.jpg" \
  "Vertical 9:16 cinematic manga panel, moody wide shot. A nearly empty office at 3:30 AM. A single desk lamp illuminates a stocky Chinese man (short black hair, stubble, hoodie now) hunched over a laptop. The city outside the window is dark and quiet. Empty energy drink cans. Lonely atmosphere. Realistic manga style. Chinese caption text: '凌晨三点半——创业者的正常作息'"

gen "f30-shadow-message.jpg" \
  "Vertical 9:16 cinematic manga panel, extreme close-up of a laptop screen showing a dark web chat interface. A mysterious message appears in green text on black background: '你不是唯一一个能看到代码的人。小心方舟。——影子'. The screen reflects in the wide-open eyes of a man with stubble in the foreground. Eerie atmosphere. Realistic manga style."

gen "f31-tracing-signal.jpg" \
  "Vertical 9:16 cinematic manga panel, dynamic shot. A stocky Chinese man (short black hair, stubble, hoodie) with both hands raised, manipulating massive green holographic data streams in the air - tracing a signal source. The green streams form a complex web map. His face shows intense concentration, sweat on forehead. Dark room lit only by green glow. NOT looking at camera. Realistic manga style. Chinese inner monologue: '这个影子的技术...远超普通黑客'"

gen "f32-signal-lost.jpg" \
  "Vertical 9:16 cinematic manga panel, medium shot. A stocky Chinese man slumps back in his chair, the green data trails in the air dissipating and fading. His expression is frustrated but impressed. The laptop screen shows: 信号追踪失败. Dark office atmosphere. NOT looking at camera. Realistic manga style. Chinese speech bubble: '有意思...藏得比我当年深多了'"

# === SECTION 7: 第一次实战 (f33-f38) ===
gen "f33-attack-alert.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic. Multiple monitors in an office flashing red alert warnings. A tall thin man with glasses (小陈) is typing frantically. A stocky Chinese man (short black hair, stubble, black T-shirt) rushes in from the door. Red warning lights. Urgent atmosphere. Realistic manga style. Chinese text on screens: '⚠ APT攻击检测' '防火墙已被突破' 小陈 speech bubble: '老板！服务器被打穿了！客户数据在泄漏！'"

gen "f34-decision3.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic close-up. A stocky Chinese man's face showing fierce determination. Behind him, red alert screens. In his eyes, green code streams are visible. His jaw is set, fists clenched. Dramatic manga-style intense close-up with speed lines in background. NOT looking at camera. Realistic manga style. Chinese text overlay: '[决策点三] 用超能力反击？还是装普通人叫外援？'"

gen "f35-activating-power.jpg" \
  "Vertical 9:16 cinematic manga panel, full-body dynamic shot. A stocky Chinese man (short black hair, stubble, black T-shirt) stands up from his chair with both hands outstretched. Green code energy erupts from his body like an explosion, filling the room. His expression is fierce and focused. Papers and small objects lift off desks from the energy wave. Dramatic manga action pose. NOT looking at camera. Realistic manga style. Chinese inner monologue: '客户数据比暴露风险重要。不好意思了——'"

gen "f36-counter-attack.jpg" \
  "Vertical 9:16 cinematic manga panel, epic action scene. A stocky Chinese man stands at the center of a hurricane of green code streams. His hands direct the streams like weapons, redirecting the attack. Holographic firewalls form around servers. The digital battlefield visualized in green and red opposing forces. Manga speed lines and impact effects. Dark office lit by green and red glow. NOT looking at camera. Realistic manga style."

gen "f37-three-seconds.jpg" \
  "Vertical 9:16 cinematic manga panel, triumphant moment. A stocky Chinese man (short black hair, stubble, black T-shirt) lowers his hands calmly. All monitors behind him show green: '攻击已阻断' '数据完整性：100%'. Green code streams settle peacefully. His expression is calm confidence with a slight smirk. NOT looking at camera. Realistic manga style. Chinese text: '三秒。解决。'"

gen "f38-xiaochen-wtf.jpg" \
  "Vertical 9:16 cinematic manga panel, comedic reaction shot. A tall thin man with messy hair and thick black-frame glasses (小陈) frozen in absolute shock - his coffee cup has fallen from his hand and is mid-air, liquid spilling. His glasses are sliding off his nose. His mouth is a perfect O shape. Comedic manga shock effect lines around him. NOT looking at camera. Realistic manga style. Chinese speech bubble: '你...你刚才...那是什么？！'"

# === SECTION 8: 追踪者 (f39-f42) ===
gen "f39-being-watched.jpg" \
  "Vertical 9:16 cinematic manga panel, POV shot from a surveillance camera perspective. Looking down at a stocky Chinese man walking out of an office building at night. A red circle targets him. In the corner: '网安特勤局 目标追踪系统'. Grainy surveillance footage aesthetic within manga style. Ominous atmosphere."

gen "f40-linwei-changes.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic two-shot in a high-end restaurant. A Chinese woman with short bob hair (林薇) sits across from a stocky Chinese man (short black hair, stubble, casual button-up shirt). Her previous warm investor smile is gone, replaced by a cold analytical expression. She steeples her fingers. Green data streams from her hidden devices are visible to the man. NOT looking at camera. Realistic manga style. 林薇 speech bubble: '朱总，我们来谈谈...融资的细节'"

gen "f41-scanning-device.jpg" \
  "Vertical 9:16 cinematic manga panel, extreme close-up. The stocky man's special vision reveals a small device hidden in the woman's brooch - it emits invisible scanning beams aimed at his head. Green holographic overlay shows: '脑电波扫描中...' The device is shown in x-ray style. Realistic manga style. Chinese thought bubble: '她在扫描我的脑电波？！这可不是普通投资人的装备...'"

gen "f42-poker-face.jpg" \
  "Vertical 9:16 cinematic manga panel, medium shot. A stocky Chinese man (short black hair, stubble, casual shirt) maintains a perfect poker face while sipping tea across from the sharp woman. His hand is steady, expression naturally relaxed. But in his eyes: green code swirls. He is pretending everything is normal. NOT looking at camera. Realistic manga style. Chinese inner monologue: '她想扫我？让她扫。我倒要看看方舟到底是什么来头。'"

# === SECTION 9: 绝境抉择 (f43-f47) ===
gen "f43-linwei-reveals.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic reveal shot. A Chinese woman (short bob, navy suit) stands up from the restaurant table and places an ID badge on the table. The badge shows: '网安特勤局 林薇 特工'. Her expression is dead serious. Dramatic lighting from above. NOT looking at camera. Realistic manga style. 林薇 speech bubble: '朱江，别装了。我知道你觉醒了。'"

gen "f44-ark-proposal.jpg" \
  "Vertical 9:16 cinematic manga panel. The woman (林薇, short bob, navy suit) slides a holographic tablet across the table showing 'PROJECT ARK 方舟计划'. The hologram displays a network of connected nodes labeled '觉醒者'. A stocky Chinese man (stubble, casual shirt) examines it with narrowed eyes. Green from his code vision mixes with blue hologram light. NOT looking at camera. Realistic manga style."

gen "f45-decision4.jpg" \
  "Vertical 9:16 cinematic manga panel, intense close-up. A stocky Chinese man's face (short black hair, stubble, big round eyes) with sweat beads on his temple. Dual reflection in his eyes: the woman's cold face on one side, his hacker instinct screaming on the other. Extreme dramatic manga close-up. NOT looking at camera, looking down at the proposal. Realistic manga style. Chinese text overlay: '[决策点四] 拒绝求自由？还是假装同意摸底牌？'"

gen "f46-decision4-choice.jpg" \
  "Vertical 9:16 cinematic manga panel, medium shot. A stocky Chinese man (short black hair, stubble, casual shirt) extends his hand for a handshake with a measured smile. But the manga panel shows a thought bubble with a chess board - his move is a feint. The woman (林薇) reaches to shake, unaware of his true intent. NOT looking at camera. Realistic manga style. Chinese inner monologue: '黑客精神第一条：先搞清楚对方底牌。我接受你的邀请，林特工。'"

# === SECTION 10: 悬念钩子 (f47-f50) ===
gen "f47-ark-base.jpg" \
  "Vertical 9:16 cinematic manga panel, epic wide establishing shot. A massive underground high-tech facility - the ARK base. Sleek metallic corridors, holographic displays everywhere, armed guards. A stocky Chinese man (short black hair, stubble, now wearing a grey ARK-issued uniform) walks through the entrance, dwarfed by the scale. He looks up at the facility in awe. Green code streams visible to him flow everywhere. NOT looking at camera. Realistic manga style. Chinese caption: '方舟基地——合作第一天'"

gen "f48-scanning-base.jpg" \
  "Vertical 9:16 cinematic manga panel, dynamic shot. A stocky Chinese man walks through a corridor of the ARK facility, discreetly activating his code vision. Green holographic overlays reveal hidden surveillance systems, encrypted data vaults, and restricted access zones not visible to normal eyes. He walks casually but his eyes are scanning everything. NOT looking at camera. Realistic manga style. Chinese inner monologue: '让我看看你们到底藏了什么'"

gen "f49-encrypted-room.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic shot. A stocky Chinese man presses against a corridor wall, peering around a corner. His code vision reveals a door with extraordinary encryption - layers upon layers of green code form a fortress around it. Unlike anything else in the base. Through the encryption, he can barely make out a person inside. Mysterious and ominous. NOT looking at camera. Realistic manga style. Chinese thought bubble: '这个房间的加密等级...比整个基地加起来都高'"

gen "f50-prisoner-message.jpg" \
  "Vertical 9:16 cinematic manga panel, extreme close-up through layers of green encrypted code. Barely visible through the digital fortress: a gaunt figure (another awakened person) sitting in a white cell. On the wall behind them, scratched desperately into the surface: '方舟不是救世 是收割'. The words glow ominously. Dark, chilling atmosphere. Realistic manga style."

gen "f51-final-cliffhanger.jpg" \
  "Vertical 9:16 cinematic manga panel, dramatic close-up. A stocky Chinese man's face in shadow, only his eyes visible, reflecting green code and the scratched warning message. His expression has shifted from curiosity to cold realization. The ARK facility corridor stretches behind him into darkness. Dramatic chiaroscuro lighting. NOT looking at camera. Realistic manga style. Chinese inner monologue: '我以为自己走进了一个机会...但也许，走进了一个笼子。'"

gen "f52-end-card.jpg" \
  "Vertical 9:16 cinematic manga end card. Dark background with faint green Matrix-style code rain. Large bold Chinese title text in the center: '《代码觉醒》第一章 完' followed by smaller text: '第二章：笼中之鸟——即将来临'. Minimalist but dramatic design. Green and dark color scheme."

echo "=== ALL FRAMES GENERATED ==="
ls -la *.jpg | wc -l
