#!/bin/bash
# EXP-905 Silicon Soul Ch7 image generation script
# All panels 9:16 portrait, realistic manga style, characters NOT facing camera
# Zhu Jiang: Chinese man ~30, black swept-back hair, light stubble, medium build

REF="shared/character-reference/zhujiang-photo-original.jpg"
OUTDIR="$HOME/trinity-v3-content/exp905-silicon-soul-ch7/images"
cd /Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator

# Common style prefix
S="Realistic semi-manga illustration, 9:16 portrait orientation, cinematic lighting. Characters look at each other or at objects in the scene, never at the camera/viewer."
ZJ="Chinese man around 30, black swept-back hair, light stubble, medium build, resembling the person in the reference photo"

generate() {
  local num=$1
  local prompt=$2
  echo "=== Generating p${num} ==="
  gemini -f "$REF" "$prompt" --save "$OUTDIR/p${num}.png" 2>&1 | tail -3
  echo "=== Done p${num} ==="
}

# Beat 1: 周弈棋的短信 (深夜客厅, 深蓝调+暖光)
generate "01" "$S Deep blue toned living room at night (NOT pure black, background rgb(35,40,55)), warm desk lamp glow. Three people staring at a phone screen. $ZJ wearing dark gray hoodie and black casual pants, looking at phone with shocked expression. Close-up of phone screen showing Chinese text message. Warm amber light from desk lamp illuminates faces. Modern apartment interior."

generate "02" "$S Same deep blue living room. A young Chinese man (Chen Ming, early 30s, messy hair, hoodie with hood down, different face from Zhu Jiang - rounder face, no stubble) typing furiously on laptop. Blue laptop glow on his face. $ZJ standing behind looking over shoulder. Warm table lamp in background. Characters looking at laptop screen."

generate "03" "$S Laptop screen close-up showing code and network trace data. Green terminal text on dark blue background. Warm amber reflections on the screen edges. Soft glow effect."

generate "04" "$S Modern apartment living room, deep blue ambient + warm desk lamp. A holographic AI interface (Xiao Qi) displayed on a monitor - cute blue digital avatar with concerned expression. $ZJ in dark gray hoodie looking at the monitor thoughtfully from side angle. Warm lighting."

generate "05" "$S Close-up of the AI interface on monitor. The digital avatar (Xiao Qi) has a self-deprecating expression, cartoon-like blue hologram style. Text bubble effect (but no actual text in image). Deep blue background with warm amber edge lighting."

generate "06" "$S Side view of $ZJ in dark gray hoodie, rubbing his temples with one hand, looking tired but determined. Deep blue room, warm desk lamp casting amber light on his face. Energy bar visual overlay showing 45/100 in warm orange gradient."

# Beat 2: 小七自我审查 (书房, 暖色台灯)
generate "07" "$S Warm amber-toned study room. $ZJ in dark gray hoodie sitting at desk, gesturing toward a monitor. Chen Ming (rounder face, hoodie, different from ZJ) operating scanning software on another computer. Warm amber desk lamp dominant lighting. Bookshelves in background. Cozy atmosphere."

generate "08" "$S Close-up of computer screen showing code scanning interface - lines of code with highlighted sections in green and amber. One section glowing golden labeled as 'seed code'. Warm desk lamp reflection on screen. Amber tones."

generate "09" "$S Medium shot in warm study. Chen Ming (round face, hoodie) explaining something with hand gestures, pointing at screen. $ZJ listening intently from side, hand on chin in thinking pose. Warm amber lighting from desk lamp. Both looking at the screen, not at camera."

generate "10" "$S $ZJ in dark gray hoodie, 3/4 side view, deep in thought. Warm amber lamplight on one side of face. His eyes looking downward contemplatively. Background: blurred bookshelf and warm-lit study. Cinematic portrait, moody but warm."

# Decision 8 panel
generate "11" "$S Split composition: left side shows glowing code on screen (golden seed code pattern), right side shows $ZJ's profile in warm amber light, hand hovering near keyboard but not touching. Symbolizing deliberation. Warm study room background."

generate "12" "$S $ZJ in study room, leaning back in chair, arms crossed, looking at ceiling with a contemplative expression. Warm amber desk lamp glow. A notebook with handwritten notes on the desk. Calm, analytical mood. Warm tones throughout."

# Beat 3: 赴约决策 (凌晨→天亮)
generate "13" "$S Living room transitioning from night to dawn. Three people in discussion. $ZJ standing by window, dawn light starting to glow orange through curtains. Chen Ming sitting on couch arguing. AI interface glowing blue on monitor in background. Mixed deep blue and warm dawn colors."

generate "14" "$S $ZJ standing at window, back to viewer (3/4 back view), looking out at early morning sky. Dawn light - warm orange and gold - streaming through window onto his face in profile. Deep gray hoodie silhouetted against warm dawn. Powerful, contemplative moment."

generate "15" "$S Close-up of $ZJ's face in profile, warm dawn light painting half his face golden. Determined expression, slight smile. Eyes looking toward the horizon through window. Early morning atmosphere. Warm gold and amber tones."

# Decision 9 panel
generate "16" "$S Bird's eye view of a desk with items spread out: a phone, earbuds, a notepad with strategy diagrams, a coffee cup. Dawn light casting long warm shadows. Planning/preparation atmosphere."

generate "17" "$S Three-way split: $ZJ looking determined (warm lit), Chen Ming at computer screens (blue glow + warm lamp), AI interface (Xiao Qi) showing tactical analysis overlay. Team preparation visual. Dawn light mixing with tech glow. Warm overall tone."

# Beat 4: 准备出发 (上午, 明亮)
generate "18" "$S Bright morning sunlight. $ZJ has changed into a dark blue dress shirt and black casual trousers. He's putting in a modified Bluetooth earpiece. Modern apartment entrance. Warm bright daylight flooding in. Clean, sharp look."

generate "19" "$S Medium shot of $ZJ in dark blue shirt, adjusting earpiece in mirror (we see his reflection, he's looking at himself in mirror not at camera). Bright warm morning light from window. Confident, getting-ready-for-battle mood."

generate "20" "$S Bright urban street scene, warm morning sunlight. $ZJ in dark blue shirt walking confidently down a tree-lined street. City buildings, pedestrians, cars. Warm golden morning light. He's walking toward camera but looking slightly to the side at his phone. Energetic, daytime atmosphere."

generate "21" "$S $ZJ walking on bright city street, side view. He has a slight amused smile (just laughed). Warm sunshine, urban scenery - shops, trees, people in background. Blue shirt crisp against warm city tones. Natural, lively scene."

# Beat 5: 咖啡馆初见 (暖色调)
generate "22" "$S Interior of a warm, cozy coffee shop. Wooden tables, pendant warm yellow lights, large windows with sunlight. $ZJ in dark blue shirt pushing open the glass door, stepping inside. Warm amber interior lighting. Inviting atmosphere."

generate "23" "$S Coffee shop interior. A man (Zhou Yiqi, early 30s, thin wire-frame glasses, neat short hair, wearing a beige/cream sweater, intellectual professor look, DIFFERENT face from ZJ - thinner, more angular) sitting at corner table with two coffee cups. Backlit by window, gradually becoming clear. Warm wood and amber tones."

generate "24" "$S Two men sitting across from each other at a wooden coffee table. $ZJ in dark blue shirt, Zhou Yiqi in cream sweater with glasses. Both looking at each other (not at camera). Warm pendant light above. Two coffee cups on table. Tense but civilized meeting atmosphere."

generate "25" "$S Close-up of a hand reaching for a coffee cup (americano, black). Wooden table surface, another cup nearby. Warm overhead light. Deliberate, symbolic gesture."

generate "26" "$S Side profile of $ZJ in dark blue shirt, holding coffee cup near his lips, eyes looking sideways (toward Zhou Yiqi off-frame). Warm coffee shop lighting, bokeh background of pendant lights. Analytical, guarded expression."

# Beat 6: 对话第一回合
generate "27" "$S Coffee shop, over-shoulder shot from behind $ZJ. Zhou Yiqi (cream sweater, glasses) across the table speaking, gesturing with one hand. Warm lighting, wooden interior. Serious discussion mood."

generate "28" "$S Close-up of Zhou Yiqi: thin wire-frame glasses, angular face, cream sweater. He's pushing up his glasses while speaking. Warm coffee shop background blurred. Intellectual, passionate expression. Not looking at camera - looking at the person across the table."

generate "29" "$S $ZJ listening intently, 3/4 view, one hand on the table. Coffee cup beside him. Warm amber light. His expression shows processing complex information - slight frown, focused eyes. Coffee shop background."

generate "30" "$S Split focus: foreground shows $ZJ's face in warm light processing information, background (slightly blurred) shows Zhou Yiqi speaking. Between them, coffee cups and warm pendant lights. Tense intellectual exchange."

# Beat 7: 真相揭露
generate "31" "$S Dramatic moment in coffee shop. Zhou Yiqi has taken off his glasses, placed them on the table. His expression is vulnerable, genuine. $ZJ across from him looks shocked - coffee cup frozen midway. Warm lighting but a cloud has dimmed the window light slightly. Emotional pivot."

generate "32" "$S Close-up of $ZJ's face showing shock transitioning to understanding. Warm amber side lighting. His eyes wide, then narrowing with realization. Coffee shop background softly blurred."

generate "33" "$S Window view of coffee shop from outside - two silhouettes at the table, warm interior glow. Outside is bright daylight. A cloud has partly covered the sun, creating dramatic light. Moody but still warm overall."

generate "34" "$S Return to warm bright: sunlight breaks through again. $ZJ and Zhou Yiqi at the table, both leaning forward. The conversation has deepened. Coffee cups nearly empty. Warm golden light restored. Intimate, conspiratorial feeling."

generate "35" "$S Energy bar overlay: 38/100 in red-orange gradient. Background: blurred warm coffee shop scene with $ZJ looking overwhelmed but processing. Warm tones maintained."

# Beat 8: 中场消化 (户外明亮)
generate "36" "$S $ZJ in dark blue shirt walking out of coffee shop onto bright sunny street. Head tilted up looking at the sky (not at camera). Taking a deep breath. Bright warm sunlight, blue sky. Modern city street with shops and trees. Relief and processing."

generate "37" "$S $ZJ leaning against a wall outside the coffee shop, one hand holding phone to ear, other hand running through his hair. Bright daylight, warm shadows. Passersby walking around him. He looks like a stressed businessman on a call. Warm urban scene."

generate "38" "$S Through the coffee shop glass window, we see Zhou Yiqi still sitting at the table, sipping coffee calmly. Reflection of $ZJ on the glass. Warm interior contrasts with bright exterior. Voyeuristic angle."

# Decision 10 panel
generate "39" "$S $ZJ standing at coffee shop entrance, hand on door handle, determined expression. Bright warm sunlight behind him. He's about to go back in. Power pose, back-lit by golden sun. Decision moment."

# Beat 9: 谈判 (回到咖啡馆)
generate "40" "$S Low angle shot of $ZJ sitting back down at coffee table. He now has a commanding presence - leaning forward, both hands on the table. Zhou Yiqi across looking surprised and slightly impressed. Warm pendant light above. Power dynamic shifted."

generate "41" "$S Close-up of Zhou Yiqi's face - first genuine emotional reaction: a slight, surprised smile. His glasses are still on the table. Warm amber light. Respect in his eyes. Not looking at camera."

generate "42" "$S Both men at the table in a more relaxed posture now. $ZJ slightly leaning back with confident expression. Zhou Yiqi putting his glasses back on, a small genuine smile. Two empty coffee cups. Warm golden afternoon light through window. Alliance forming."

generate "43" "$S Energy bar: 55/100 climbing up in warm orange-green gradient. Background: the two men shaking hands or nodding to each other across the coffee table. Warm, positive, alliance-sealed moment."

# Beat 10: 章末炸弹 (街道夕照)
generate "44" "$S Both men walking out of coffee shop together into golden afternoon/early evening light. $ZJ in blue shirt, Zhou Yiqi in cream sweater. Walking in same direction but about to part ways. Warm golden hour city street. Trees casting long shadows."

generate "45" "$S Zhou Yiqi walking away down the street, turning his head slightly to look back at $ZJ (not at camera). Golden sunset light. His cream sweater glowing warm. A small wave goodbye. Cinematic farewell moment."

generate "46" "$S $ZJ alone on city street, standing still, processing everything. Golden sunset light on his face. Pedestrians passing by in soft focus. He's looking down the street where Zhou Yiqi disappeared. Contemplative, warm."

generate "47" "$S Close-up of $ZJ's phone screen vibrating - incoming call from unknown number. The phone screen glows cold blue-white against the warm golden evening light around it. $ZJ's hand holding the phone. Dramatic contrast."

generate "48" "$S Wide shot: $ZJ standing in the middle of a golden-lit city street, phone in hand, looking at the screen (not at camera). Long shadows. The warm golden light is dominant but the phone casts a small cold glow on his face. Tension meets beauty. Final panel - cinematic wide."

echo "=== ALL DONE ==="
