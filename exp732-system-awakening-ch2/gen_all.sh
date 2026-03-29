#!/bin/bash
# EXP-732 Frame Generation Script
# Usage: bash gen_frames.sh [start_frame] [end_frame]
# Generates frames for 系统觉醒 Ch2

OUTDIR=~/trinity-v3-content/exp732-system-awakening-ch2/images
SKILL_SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
START=${1:-1}
END=${2:-50}

# Load API config from openclaw config
export GEMINI_API_KEY=$(python3 -c "import json; d=json.load(open('$HOME/.openclaw/openclaw.json')); print(d['skills']['entries']['gemini-image']['env']['GEMINI_API_KEY'])")
export GEMINI_BASE_URL=$(python3 -c "import json; d=json.load(open('$HOME/.openclaw/openclaw.json')); print(d['skills']['entries']['gemini-image']['env']['GEMINI_BASE_URL'])")

# Character descriptions
ZJ="a stocky Chinese man (172cm, 80kg), short black hair slicked back, thick stubble beard covering jaw and chin, large expressive eyes, NO glasses. In this scene wearing dark grey hoodie and black sweatpants"
ZJ_SUIT="a stocky Chinese man (172cm, 80kg), short black hair slicked back, thick stubble beard covering jaw and chin, large expressive eyes, NO glasses. Wearing a dark formal suit with slightly crooked tie"
LAOZHOU="a slightly chubby Chinese man with round face, wearing black-framed glasses, dressed in blue-and-white striped pajamas, messy hair"
XIAOMEI="a young slim Chinese woman with black ponytail, wearing white t-shirt with denim jacket, white headphones around neck, delicate features, clearly different face from the male characters"
LINWEI="a professional Chinese businesswoman with high ponytail, wearing dark business suit, sharp and capable look"

# Style prefix
STYLE="Semi-realistic manga style illustration, vertical 9:16 portrait orientation, cyberpunk startup aesthetic with blue-green holographic UI elements. Character is NOT looking at the camera, looking at objects/people within the scene."

generate_frame() {
  local num=$(printf "%02d" $1)
  local prompt="$2"
  local outfile="$OUTDIR/f${num}.png"
  
  if [ -f "$outfile" ] || [ -f "$OUTDIR/f${num}.jpg" ]; then
    echo "SKIP f${num} (exists)"
    return 0
  fi
  
  echo "=== Generating f${num} ==="
  uv run "$SKILL_SCRIPT" --prompt "$prompt" --filename "$outfile" --resolution 1K 2>&1 | tail -5
  
  # Convert to JPG
  if [ -f "$outfile" ]; then
    sips -s format jpeg -s formatOptions 78 --resampleWidth 800 "$outfile" --out "$OUTDIR/f${num}.jpg" 2>/dev/null && rm "$outfile"
    echo "OK f${num}.jpg"
  fi
}

# Generate frames
for i in $(seq $START $END); do
  case $i in
    1)  generate_frame $i "$STYLE Wide shot of a nearly empty office at 4AM - only two desks, a coffee machine, boxes of instant noodles. $ZJ standing next to a sleeping bag on the floor, shaking $LAOZHOU who is curled up in a blanket on the floor. Dark outside the window. Dim warm light from desk lamp. Chinese text overlay in top corner: 「凌晨四点」" ;;
    2)  generate_frame $i "$STYLE Close-up of $LAOZHOU face being woken up, sleepy eyes half-open, drool at corner of mouth, hair extremely messy. Speech bubble in Chinese: 「你几点了？」" ;;
    3)  generate_frame $i "$STYLE Medium shot of $ZJ standing with arms crossed, looking down at someone on the floor with serious expression. Blue computer screen glow behind him. Speech bubble in Chinese: 「四点。起来写代码。」" ;;
    4)  generate_frame $i "$STYLE Close-up of $LAOZHOU with shocked expression, eyes wide open, jaw dropped. Speech bubble in Chinese: 「你是魔鬼吗？！」" ;;
    5)  generate_frame $i "$STYLE Medium shot of $ZJ sitting at computer desk, screen glowing blue on his face, fingers on keyboard. A translucent blue-green holographic panel floating in front of him showing a progress bar near full. Looking at the screen." ;;
    6)  generate_frame $i "$STYLE Holographic UI panel close-up: translucent blue-green glowing interface showing an experience bar labeled 「经验值 98/100」 with golden glow, below it text: 「每完成一个开发里程碑 +10经验值」. Dark background." ;;
    7)  generate_frame $i "$STYLE Medium shot of $ZJ looking thoughtfully at holographic panel, behind him $LAOZHOU slowly getting up from floor mat with messy hair. Chinese narration text: 「只差2点。这盘棋，得加速了。」" ;;
    8)  generate_frame $i "$STYLE Wide establishing shot of the entire tiny office at dawn - two desks with computers, instant noodle boxes stacked in corner, coffee cans everywhere, two men at their stations. First light coming through window. Atmospheric, melancholy but determined mood. Chinese text: 「这就是我的全部家当。」" ;;
    9)  generate_frame $i "$STYLE Holographic UI close-up: skill tree diagram glowing blue-green, one node highlighted and pulsing: 「代码加速 Lv1」with sub-text 「打字速度+30% Debug直觉增强」. Unlock condition displayed: 「连续编程8小时」. Dark background with particle effects." ;;
    10) generate_frame $i "$STYLE Close-up of $ZJ face with slight smirk, blue screen light on his face. Chinese thought bubble: 「连续编程8小时？这叫正常上班。」" ;;
    11) generate_frame $i "$STYLE Medium shot of $ZJ looking at a full box of instant coffee packets on the desk. $LAOZHOU yawning in background. Chinese narration: 「弹药充足。」 Warm desk lamp light." ;;
    12) generate_frame $i "$STYLE Holographic UI decision panel: title 「选择你的武器」 glowing. Option A in red glow: 「正面竞争」. Option B in blue glow: 「侧翼突袭」. A hand reaching toward option B. Dark cyberpunk background." ;;
    13) generate_frame $i "$STYLE Close-up of $ZJ with determined eyes, blue light reflecting on his face. Chinese narration text: 「两个人打十个人？那是傻子。黑客不硬碰硬——找系统漏洞。」" ;;
    14) generate_frame $i "$STYLE Holographic UI feedback panel: 「侧翼突袭 ✓ 战略评分 S级」 with blue-green particle explosion effects. 「系统奖励：灵感碎片×1」 displayed below." ;;
    15) generate_frame $i "$STYLE Medium shot of $LAOZHOU leaning over to look at $ZJ computer screen with confused expression. $ZJ smiling. Speech bubble Laozhou: 「你选了什么？」 Speech bubble Zhujiang: 「选了不跟陈锋同一条路上打。」" ;;
    16) generate_frame $i "$STYLE Wide shot of two men sitting side by side at computers, both typing. Morning sunlight streaming through window. Warm hopeful atmosphere. Chinese narration: 「方向定了。接下来——需要人。」" ;;
    17) generate_frame $i "$STYLE Close-up of phone screen showing a messaging app recruitment group. One message highlighted: a job posting from someone named 小美. Chinese text clearly visible on screen." ;;
    18) generate_frame $i "$STYLE Holographic UI appraisal panel for 小美: 「技术能力：92」「团队协作：45」「对上一份工作的愤怒值：97」in red. Previous employer highlighted: 「陈锋新公司」. Reason: 「不认同技术路线」. Blue-green translucent style." ;;
    19) generate_frame $i "$STYLE Close-up of $ZJ looking at phone with eyebrows raised and slight smirk, amused expression. Chinese narration: 「陈锋裁了一个技术92分的人？老天爷在帮我。」" ;;
    20) generate_frame $i "$STYLE Medium shot of $LAOZHOU leaning over to look at $ZJ phone, pointing at screen with exaggerated shocked expression. Speech bubble: 「愤怒值97？！这姑娘是被炒了还是被炸了？」" ;;
    21) generate_frame $i "$STYLE Holographic UI decision panel: 「如何说服小美？」. Option A in red: 「利用愤怒——一起复仇」. Option B in blue: 「正道——让技术说话」. Dark background." ;;
    22) generate_frame $i "$STYLE Close-up of $ZJ with serious but warm expression. Chinese narration: 「利用别人的愤怒，不长久。要用梦想吸引人。」 Soft warm light." ;;
    23) generate_frame $i "$STYLE Holographic UI showing hidden attribute reveal: 「小美·隐藏属性 — 理想主义：88」 highlighted and glowing golden. Chinese narration: 「她要的不是复仇，是一个值得相信的方向。」" ;;
    24) generate_frame $i "$STYLE Medium shot in a coffee shop. $ZJ wearing clean grey hoodie sitting across table from $XIAOMEI. Laptop open showing technical architecture diagram. Xiaomei leaning forward with interested expression, headphones around neck. Warm cafe lighting." ;;
    25) generate_frame $i "$STYLE Close-up of $XIAOMEI eyes lighting up with excitement, leaning forward to look at laptop screen. Chinese narration: 「她的眼神变了——从戒备到好奇。被技术点燃的表情。」" ;;
    26) generate_frame $i "$STYLE Medium shot at office door. $LAOZHOU holding cup noodles with big welcoming smile greeting $XIAOMEI entering. Boxes of instant noodles visible. Speech bubble Laozhou: 「欢迎新同事！来吃泡面！」 Speech bubble Xiaomei with deadpan face: 「你们就靠这个活？」 Speech bubble Laozhou: 「这是战略储备！」" ;;
    27) generate_frame $i "$STYLE Wide shot of three people working intensely - $ZJ at center typing backend code, $XIAOMEI on right doing frontend, $LAOZHOU running between them. Desks covered in noodle bowls and coffee cups. Chinese text: 「倒计时开始。」 D-5 countdown on wall." ;;
    28) generate_frame $i "$STYLE Holographic UI skill unlock animation: 「代码加速 Lv1 解锁！」 with blue-green energy wrapping around hands. Effect description: 「打字+30% Bug高亮」. Particle explosion effects." ;;
    29) generate_frame $i "$STYLE Extreme close-up of $ZJ hands typing rapidly on keyboard, faint blue-green holographic glow around fingertips. Code scrolling fast on screen in background. Dynamic speed lines." ;;
    30) generate_frame $i "$STYLE Medium shot of $LAOZHOU standing behind $ZJ with jaw dropped, watching him type at incredible speed. Speech bubble Laozhou: 「你今天开挂了？打字速度快了一倍！」 Thought bubble above Zhujiang head: 「确实开挂了。」" ;;
    31) generate_frame $i "$STYLE Close-up of computer screen showing code with a bug highlighted in translucent blue holographic glow. Debug interface. Chinese narration: 「系统直觉让Bug无所遁形。」" ;;
    32) generate_frame $i "$STYLE Vertical montage of three panels stacked: TOP: $ZJ energetic typing at day, EXP 108/200. MIDDLE: $ZJ tired but determined at night, EXP 118/200. BOTTOM: $ZJ with dark eye circles but code flowing fast, EXP 128/200. Each panel labeled D-5, D-4, D-3." ;;
    33) generate_frame $i "$STYLE Holographic UI celebration: 「经验值 100 达成！」 in large golden glowing text with fireworks effect. Below: 「是否消耗100经验值解锁隐藏线索——陈锋背后势力？」 Blue-green background." ;;
    34) generate_frame $i "$STYLE Holographic UI decision panel: Option A in blue: 「花掉100经验值 → 查看陈锋背后势力」. Option B in red: 「保留 → 解锁更强技能」. Dramatic dark background with energy particles." ;;
    35) generate_frame $i "$STYLE Close-up of $ZJ index finger pressing toward option A on holographic panel, cold determined expression. Chinese narration: 「信息是黑客的命。知道敌人是谁，比自己更强更重要。」" ;;
    36) generate_frame $i "$STYLE Holographic UI reveal with red alert style: 「陈锋背后投资人：方正达集团」in red. 「真实目标：不是你的市场——是你的AI模型专利。」 Warning symbols and data streams. Dramatic red and blue lighting." ;;
    37) generate_frame $i "$STYLE Extreme close-up of $ZJ eyes wide with shock, pupils dilated. Red and blue light reflected in eyes. Chinese narration: 「他们要的不是公司……是我的技术。一切都说通了。」" ;;
    38) generate_frame $i "$STYLE Wide shot of office afternoon. $LINWEI pushes door open, professional and stern. Inside: $LAOZHOU asleep on desk, $XIAOMEI with messy hair, $ZJ_SUIT with crooked tie standing up. Speech bubble Linwei: 「这就是你要打败陈锋的团队？」" ;;
    39) generate_frame $i "$STYLE Medium shot of $ZJ_SUIT showing laptop demo to $LINWEI. Screen light on her face showing expression changing from skepticism to surprise. Chinese narration: 「她看到了。那一瞬间，我知道，有戏。」" ;;
    40) generate_frame $i "$STYLE Holographic UI appraisal of Linwei: 「对demo兴趣值：94」「对朱江评价：有趣但不靠谱 → 可能靠谱」 with arrow animation showing change. Blue-green translucent." ;;
    41) generate_frame $i "$STYLE Medium shot of $LINWEI at office door, looking back over shoulder. Speech bubble: 「明天正式演示。跑通了，我说服合伙人跟投。」 Chinese narration: 「最后一天。」 Dramatic lighting." ;;
    42) generate_frame $i "$STYLE Wide shot of office at night, D-1 final sprint. Suddenly ALL screens flash RED! $LAOZHOU jumping out of chair in panic. $XIAOMEI looking shocked. $ZJ staring at screen. Speech bubble Laozhou: 「挂了挂了全挂了！！」 Red alert atmosphere." ;;
    43) generate_frame $i "$STYLE Close-up of computer screen filled with red alert popups: 「服务器遭受DDoS攻击」「连接中断」「数据异常」 Red warning text on dark background. Urgent, threatening atmosphere." ;;
    44) generate_frame $i "$STYLE Holographic UI red warning: 「检测到外部攻击。来源追踪：方正达集团关联IP」 Red and blue mixed lighting. Chinese narration: 「他们急了。说明demo真的威胁到他们了。」" ;;
    45) generate_frame $i "$STYLE Holographic UI decision panel with urgency: Option A blue: 「连夜迁移备用节点（稳妥）」. Option B red pulsing: 「反向追踪攻击源（高风险黑客打法）」. Alarm lights in background." ;;
    46) generate_frame $i "$STYLE Close-up of $ZJ face changing from shock to cold smirk. Red alert light on one side, blue screen on other. Chinese narration: 「你们先动手的。黑客不只是防守——最好的防守是进攻。」" ;;
    47) generate_frame $i "$STYLE Medium shot of $ZJ typing rapidly, screen showing tracking interface with data streams, IP chains, firewall topology. Blue-green system glow on hands. Behind him $XIAOMEI backing up data, $LAOZHOU asleep on desk with drool on keyboard. Chinese narration: 「反向追踪开始。」" ;;
    48) generate_frame $i "$STYLE Split composition: TOP half is screen close-up showing attack code with a familiar code signature highlighted - recognizable authorship style. BOTTOM half is $ZJ shocked face. Chinese narration: 「这段代码……是我写的。陈锋偷走了我的核心算法。」" ;;
    49) generate_frame $i "$STYLE Holographic UI new quest: 「支线任务：追回被盗知识产权。奖励：？？？」 Side display: 「距离演示：6小时」「攻击状态：进行中」 Tense blue-red mixed lighting." ;;
    50) generate_frame $i "$STYLE Atmospheric wide shot of dark office at deep night. $ZJ staring at screen, face lit half red (tracking) half blue-green (code). $LAOZHOU asleep at next desk. Spilled coffee on $XIAOMEI keyboard. Chinese narration large text: 「我现在同时在打仗、做产品、找Bug、追贼。这就是创业。」 Bottom text: 「第三章《Demo Day》即将开始」" ;;
  esac
done

echo "=== Generation complete ==="
