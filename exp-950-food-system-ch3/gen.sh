#!/bin/bash
set -e
export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"
CHARREF="$HOME/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
SCRIPT="$HOME/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
OUTDIR="$HOME/trinity-v3-content/exp-950-food-system-ch3/images"
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

# P01: Phone countdown timer close-up, 4am apartment
gen 1 "Realistic manga style, vertical 9:16 portrait orientation. Close-up of a smartphone screen showing a red digital countdown timer reading 71:42:18. The phone lies on a bedside table in a tiny Chinese apartment, 4am darkness, faint moonlight through window. A young Chinese man's hand is reaching for the phone. Above the phone, faint holographic system UI floats showing Chinese text: 当前等级Lv.3 → 目标Lv.5. Warm amber tones despite the darkness. NOT looking at camera." ""

# P02: Zhu Jiang in tiny kitchen, food spread, system tasks floating
gen 2 "Realistic manga style, vertical 9:16 portrait. A young Chinese man (late 20s, based on reference photo, wearing white tank top and shorts) standing in a cramped apartment kitchen. The counter is covered with fresh ingredients. A small orange cat-like mascot floats near his shoulder, yawning. Holographic task list floats in the air showing 6 cooking challenges in Chinese. Warm kitchen lighting, cozy but chaotic. NOT looking at camera. Medium shot." ref

# P03: Morning market, Zhu Jiang with cart, ingredient data overlays
gen 3 "Realistic manga style, vertical 9:16 portrait. Early morning Chinese wet market (菜市场), dawn light. A young Chinese man (reference photo face, wearing casual clothes, pushing a small shopping cart) walks between market stalls. Each ingredient has faint holographic data labels floating above them showing freshness percentages in Chinese. Vibrant colors - red tomatoes, green vegetables, silver fish on ice. Busy market atmosphere. Warm golden dawn light. NOT looking at camera. Wide shot." ref

# P04: System task list close-up - 6 dishes
gen 4 "Realistic manga style, vertical 9:16 portrait. Close-up of a holographic interface floating in warm amber light. Shows a list of 6 dishes in Chinese with difficulty ratings: 鱼香肉丝(B级)✅, 清蒸鲈鱼(B+级), 宫保鸡丁(A级), 糖醋里脊(A级), 佛跳墙简化版(A+级), 自由创作菜(S级). Each dish has a small icon. The interface has a game-like aesthetic with progress bars. Clean readable Chinese text. Warm color scheme." ""

# P05: Zhu Jiang on phone while carrying groceries
gen 5 "Realistic manga style, vertical 9:16 portrait. A young Chinese man (reference photo face, casual clothes) walking on a Chinese street in early morning light, one hand holding phone to ear, other hand carrying bags of groceries. His expression is earnest but with a hint of humor. Morning sun creates warm golden tones. Urban Chinese street background with shop signs. NOT looking at camera. Medium shot, slight low angle." ref

# P06: Montage A - cutting meat, knife skills improving
gen 6 "Realistic manga style, vertical 9:16 portrait. Dynamic cooking montage panel. A young Chinese man (reference photo face, wearing apron over t-shirt) is cutting meat into thin julienne strips on a wooden cutting board. His hand movements are fast and precise, with motion blur lines showing speed. A small orange cat mascot holds a tiny flag nearby. A floating score counter shows: 75→82→88. Warm kitchen lighting, steam visible. Action lines emphasize speed. NOT looking at camera." ref

# P07: Montage B - steaming sea bass, steam rising beautifully
gen 7 "Realistic manga style, vertical 9:16 portrait. Beautiful food close-up with character. A bamboo steamer with a perfectly cooked sea bass (清蒸鲈鱼), pure white flesh, green scallion garnish, steam rising elegantly. A young Chinese man's hands are lifting the steamer lid, revealing the fish. Holographic data shows: 最佳蒸制时间7分42秒. Golden warm lighting. The fish looks absolutely delicious - food photography quality. Score floating: 91分! NOT looking at camera." ref

# P08: Comedy - smell sensitivity upgrade, Zhu Jiang gagging
gen 8 "Realistic manga style, vertical 9:16 portrait. Comedy panel. A young Chinese man (reference photo face, wearing apron) is clutching his nose with both hands, face scrunched in exaggerated disgust. He's leaning over the kitchen window trying to breathe fresh air. Through the window, a neighbor's stinky tofu stall is visible with visible stink waves. A system popup shows: 嗅觉灵敏度+300%. A small orange cat mascot is laughing so hard its hat is falling off. Bright warm colors, manga-style comedy effects (skull symbols, dizzy spirals). NOT looking at camera." ref

# P09: Late night, exhausted, failed attempts on floor
gen 9 "Realistic manga style, vertical 9:16 portrait. Late night scene in a tiny apartment kitchen. A young Chinese man (reference photo face, hair messy, apron covered in sauce stains, visible exhaustion) stands at the counter, sweat on his forehead. On the floor: several plates of failed 糖醋里脊 (sweet and sour pork) attempts. The wall shows a clock reading 2:00 AM. A small orange cat mascot sighs nearby. Despite exhaustion, his eyes still burn with determination. Warm but dim kitchen lighting. NOT looking at camera. Full body shot." ref

# P10: Breakthrough - eyes closed, flipping wok by instinct
gen 10 "Realistic manga style, vertical 9:16 portrait. Dynamic action shot. A young Chinese man (reference photo face, eyes CLOSED, serene expression despite sweat) is flipping a wok with confident motion. In mid-air: perfectly battered sweet and sour pork pieces catching golden light. The system hologram is deliberately turned OFF (fading out). His body posture shows complete confidence and flow state. Manga-style dynamic action lines, golden light rays. Score appearing: 90! Warm dramatic lighting. NOT looking at camera." ref

# P11: Lin Xiaoyu at newspaper office, waiting with documents
gen 11 "Realistic manga style, vertical 9:16 portrait. A young Chinese woman (early 20s, simple and pretty, long black hair in ponytail, wearing her best outfit - white blouse and jeans) stands nervously outside a Chinese newspaper office building. She holds a thick folder of documents. Her expression shows nervousness but determination. Modern Chinese urban street, warm daylight. A sign reads 城市晨报. NOT looking at camera. Medium shot." ""

# P12: Lin Xiaoyu meeting young reporter at cafe
gen 12 "Realistic manga style, vertical 9:16 portrait. Interior of a simple Chinese cafe. A young Chinese woman (ponytail, white blouse) is spreading documents on a cafe table, showing them to a female reporter (late 20s, short hair, casual professional dress, holding a recorder). The reporter's eyes are wide with interest, leaning forward. Documents and a phone screen visible on the table. Warm cafe lighting, cups of tea. NOT looking at camera. Medium shot from side angle." ""

# P13: Night kitchen, ingredients for Buddha Jumps Over Wall
gen 13 "Realistic manga style, vertical 9:16 portrait. A cramped apartment kitchen at night, the counter completely covered with premium ingredients: abalone, sea cucumber, fish maw, mushrooms, pork ribs, all beautifully lit. A young Chinese man (reference photo face, wearing fresh apron, looking serious and focused) surveys the spread. A holographic system display shows: 佛跳墙(A+级)—需协调12种食材. A small orange cat mascot looks uncharacteristically serious. Warm golden lighting emphasizing the luxury of ingredients. NOT looking at camera. Wide angle." ref

# P14: NASA-style control dashboard - 12 ingredient monitors
gen 14 "Realistic manga style, vertical 9:16 portrait. First-person POV style. Multiple holographic status panels floating in the air showing 12 different ingredient monitoring dashboards - each with temperature, moisture level, and protein state data in Chinese. Like a NASA mission control. Through the panels, a kitchen is visible with multiple pots on stoves. The overall feel is high-tech meets traditional cooking. Warm amber tones. Dramatic and impressive." ""

# P15: Cooking montage - running between 3 stoves
gen 15 "Realistic manga style, vertical 9:16 portrait. Dynamic multi-panel composition within one image. Shows a young Chinese man (reference photo face, apron, sweating) in multiple positions - left stove flipping abalone, center stirring fish maw, right checking simmering ribs. Motion blur between positions suggesting frantic movement. A small orange cat mascot calls out timing like a project manager. Steam everywhere. Energy lines and cooking action effects. Warm kitchen tones. NOT looking at camera." ref

# P16: Final step - pouring golden broth into clay pot
gen 16 "Realistic manga style, vertical 9:16 portrait. Dramatic close-up from overhead angle. A pair of steady hands pouring golden chicken broth from a ladle into a large clay pot (砂锅). Inside the pot: 12 kinds of beautifully arranged ingredients already layered. The golden broth pours in a perfect stream, catching the light. Steam rises. A system score counter ticks up: 84...85...86... The clay pot glows warmly. Food photography quality, extremely appetizing. NOT looking at camera." ref

# P17: Waiting 45 min - sitting on floor with system recipes
gen 17 "Realistic manga style, vertical 9:16 portrait. A young Chinese man (reference photo face, exhausted but alert eyes, sitting on kitchen floor, back against wall) browses through a holographic recipe library floating in front of him. His legs are stretched out, apron stained, but his expression shows intense creative thinking. Nearby the sealed clay pot gently steams. A timer shows 45:00. Warm, cozy kitchen atmosphere. NOT looking at camera. Medium shot." ref

# P18: Buddha Jumps Over Wall unveiled - golden steam
gen 18 "Realistic manga style, vertical 9:16 portrait. Dramatic reveal shot. Hands lifting the lid off a clay pot - an explosion of golden fragrant steam billows upward. The contents are visible: perfectly cooked abalone, sea cucumber, mushrooms in a rich golden broth. A floating score reads: 92分! Lv.4→Lv.5达成! The steam catches warm light beautifully. Extreme food photography quality - the dish looks absolutely divine. Celebratory manga effects (sparkles, light rays). NOT looking at camera." ref

# P19: Exam hall - 10 cooking stations, Zhu Jiang arrives exhausted
gen 19 "Realistic manga style, vertical 9:16 portrait. A large Chinese government building multi-purpose hall converted into a cooking exam venue. Ten cooking stations in a row, each with a wok, cutting board, and ingredients. Other examinees stand ready, well-rested and confident. A young Chinese man (reference photo face, wearing a white chef's uniform slightly too large, prominent dark circles under eyes) enters from the doorway looking tired but determined. Bright fluorescent lighting, official atmosphere. NOT looking at camera. Wide establishing shot." ref

# P20: Master Zhou appears - authoritative old man
gen 20 "Realistic manga style, vertical 9:16 portrait. A distinguished elderly Chinese man (65, white hair combed back neatly, square face, deep wrinkles, wearing a gray Zhongshan suit/Mao suit, reading glasses pushed up on forehead). He stands at the front of the exam hall with commanding presence despite being short. His expression is stern but fair. Behind him: a banner in Chinese reads 区级烹饪资格考核. Bright warm lighting. NOT looking at camera. Medium shot, slight low angle to emphasize authority." ""

# P21: Knife skills test - Zhu Jiang vs Chen Jie
gen 21 "Realistic manga style, vertical 9:16 portrait. Side-by-side cooking competition. Left: a young Chinese man (reference photo face, white chef uniform, focused intense cutting with incredible precision, motion blur on knife). Right: a sturdy Chinese woman (40s, short hair, strong build, pulling noodles with fluid expert motion, 15 years of skill evident). Both are fully concentrated on their craft. Speed lines and action effects. Bright exam hall lighting. NOT looking at camera. Split composition." ref

# P22: Comedy - Chen Jie's shocked reaction to '3 days'
gen 22 "Realistic manga style, vertical 9:16 portrait. Comedy panel. A sturdy Chinese woman (40s, short hair, strong build, chef uniform) with an extremely exaggerated shocked expression - mouth wide open, eyes bulging, noodle dough stretching out of control from her hands. Behind her, the elderly examiner (white hair, gray Zhongshan suit) is adjusting his glasses, hiding a slight smile. Manga comedy effects: shock lines, sweat drops, exclamation marks. Bright warm lighting. NOT looking at camera." ""

# P23: Zhu Jiang making egg fried rice while everyone makes fancy dishes
gen 23 "Realistic manga style, vertical 9:16 portrait. A cooking exam hall. In the foreground, a young Chinese man (reference photo face, white chef uniform, calm confident smile) cracks eggs into a wok with rice. His motions are fluid and masterful. In the background, other examinees are making elaborate dishes - red braised pork, boiled fish, visible complex preparations. The contrast is stark - simplicity vs complexity. All other examinees glance over with confusion. Golden wok fire. Warm lighting. NOT looking at camera. Wide angle." ref

# P24: Master Zhou tasting egg fried rice - frozen mid-bite
gen 24 "Realistic manga style, vertical 9:16 portrait. Close-up of the elderly examiner (65, white hair, square face, deep wrinkles, reading glasses). He has just taken a spoonful of golden egg fried rice and stopped mid-chew. His expression transitions from professional neutrality to genuine surprise and... respect. The golden rice is visible on the spoon, perfectly coated, each grain distinct. Warm golden lighting reflecting off the rice. Intimate close-up. NOT looking at camera - he looks at the rice." ""

# P25: Free creation round - Zhu Jiang standing still, eyes closed, others already cooking
gen 25 "Realistic manga style, vertical 9:16 portrait. A cooking exam hall. Other examinees are already cooking frantically at their stations with various complex dishes. In the center, a young Chinese man (reference photo face, white chef uniform) stands completely still with eyes closed, deep in thought. A small orange cat mascot floats nearby, panicking. Around his head: faint holographic fragments showing principles: 借味, 减法, 反差, 简单极致, 融合 - all converging. Meditative pose amid chaos. Warm bright lighting. NOT looking at camera." ref

# P26: Creating Five-Flavor Unity Soup - simple ingredients arranged beautifully
gen 26 "Realistic manga style, vertical 9:16 portrait. Beautiful overhead food photography composition. On a clean cutting board: five simple ingredients perfectly prepared - a bowl of beaten egg (金黄), thin tofu slices (白), fresh mushrooms (棕), pink shrimp, and green scallions. Each ingredient glows with its own color. A pair of hands begins placing them into a pot of clear simmering water. The final step: a ladle of golden chicken broth being poured, turning the soup from clear to shimmering gold. Food photography lighting, extremely appetizing. NOT looking at camera." ref

# P27: Master Zhou drinking the soup - takes a second sip
gen 27 "Realistic manga style, vertical 9:16 portrait. The elderly examiner (65, white hair, square face, Zhongshan suit) holds a bowl of golden soup. He has just taken a sip. His expression shows genuine surprise turning to appreciation - for the first time his stern facade has cracked into something warm. His glasses are removed, set on the table. He raises the bowl again for a second sip - this is significant, as examiners only need one taste. Warm golden light from the soup illuminates his face. NOT looking at camera - he looks at the soup." ""

# P28: Walking out of exam center, permit in hand, Lin Xiaoyu waiting
gen 28 "Realistic manga style, vertical 9:16 portrait. Bright sunlight exterior of a Chinese government building. A young Chinese man (reference photo face, white chef uniform, exhausted but triumphant) walks down the steps holding an official certificate/permit. The sun is behind him creating a warm backlit glow. At the bottom of the steps, a young woman (ponytail, casual clothes) waits with a newspaper in her hand, waving. Green trees, blue sky, warm golden sunlight. Hopeful and victorious atmosphere. NOT looking at camera. Full body shot." ref

# P29: Looking at newspaper together - exposé headline
gen 29 "Realistic manga style, vertical 9:16 portrait. Two young Chinese people standing close together looking at a newspaper. The man (reference photo face, chef uniform) smiles and pats the woman's shoulder. The woman (ponytail, casual) looks proud. The newspaper headline is visible in large Chinese characters: 知名餐饮集团涉嫌违规举报个体户. Warm afternoon sunlight, trees and building in background. Companionship and teamwork feeling. NOT looking at camera. Medium shot." ref

# P30: Final cliffhanger - ominous text message + system warning
gen 30 "Realistic manga style, vertical 9:16 portrait. Dramatic close-up of a smartphone screen showing a threatening text message in Chinese: 许可证只是入场券。厨艺大赛的评委名单我已经打过招呼了。——赵. Above the phone, a red holographic system warning flashes: S级威胁! 14天内需提升至Lv.8! A hand holds the phone - the background is the warm sunlit street, but the phone screen casts an ominous blue-red glow. Contrast between warm world and cold digital threat. NOT looking at camera." ref

echo "=== ALL DONE ==="
