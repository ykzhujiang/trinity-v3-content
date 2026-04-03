#!/bin/bash
# EXP-886 Image Generation Script — Silicon Soul Ch2
# Uses Gemini CLI with character reference photo

set -e
OUT_DIR="$HOME/trinity-v3-content/exp886-silicon-soul-ch2/images"
REF_PHOTO="$HOME/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"
mkdir -p "$OUT_DIR"

# Character description constants
ZJ="a Chinese man in his early 30s with black slicked-back hair, short beard/stubble along jawline, strong jaw, medium build — based on reference photo"
CHEN="a Chinese man with square jaw, buzz cut hair, wearing white polo shirt, sturdy build"
LINWEI="a Chinese woman with long black hair, red lips, sharp eyes, wearing black business suit dress, elegant and powerful"
DR_ZHOU="a middle-aged Chinese woman with short hair, thin-framed glasses, wearing grey suit, stern expression"
AHAO="a Chinese man with round face, thick glasses, slightly chubby"

# Common prompt suffix
STYLE="Realistic manga style illustration, vertical 9:16 aspect ratio, bright and well-lit scene, cinematic composition. Characters do NOT look at camera — their eyes look at objects or other characters within the scene. All text in Chinese only. High quality detailed illustration."

generate() {
  local panel=$1
  local prompt=$2
  local outfile="$OUT_DIR/p$(printf '%02d' $panel).jpg"
  
  if [ -f "$outfile" ]; then
    echo "SKIP p$(printf '%02d' $panel) (exists)"
    return 0
  fi
  
  echo "=== Generating panel $panel ==="
  
  gemini --model gemini-2.0-flash-preview-image-generation \
    --output-file "$outfile" \
    "Generate a vertical (9:16 ratio, 768x1344 pixels) illustration. $prompt $STYLE" \
    2>&1 || {
    echo "FAILED panel $panel, retrying..."
    sleep 2
    gemini --model gemini-2.0-flash-preview-image-generation \
      --output-file "$outfile" \
      "Generate a vertical (9:16 ratio, 768x1344 pixels) illustration. $prompt $STYLE" \
      2>&1 || echo "FAILED panel $panel after retry"
  }
  
  # Convert to JPG quality 75 if needed
  if [ -f "$outfile" ]; then
    # Ensure it's proper JPG and resize to max 800px width
    sips -s format jpeg -s formatOptions 75 --resampleWidth 800 "$outfile" --out "$outfile" 2>/dev/null || true
    echo "OK p$(printf '%02d' $panel) — $(du -h "$outfile" | cut -f1)"
  fi
  
  sleep 1
}

# Panel 1: Office overview at night
generate 1 "Overhead wide shot of a dimly lit modern startup office at 3:30 AM. $ZJ sits alone at a desk with dual monitors glowing blue, wearing a grey hoodie and black sweatpants. Coffee cups and takeout containers scattered on desk. City lights visible through floor-to-ceiling windows. Energy bar overlay shows 72/100."

# Panel 2: Zhu Jiang talking to screen
generate 2 "Side medium shot. $ZJ in grey hoodie sitting at desk, leaning forward speaking quietly to his monitor. The screen shows a chat interface with code in background. His face illuminated by blue screen light. Expression: focused and serious."

# Panel 3: Xiao Qi's chat interface
generate 3 "Close-up of a computer screen showing an AI chat interface. The AI avatar is a small glowing blue orb with a sassy expression. Chinese text message visible. Dark background with code snippets. Clean UI design."

# Panel 4: Zhu Jiang bitter smile
generate 4 "Medium close-up. $ZJ in grey hoodie, shaking his head with a bitter smile, one hand rubbing his temple. Tired but amused expression. Blue screen light from the side. Late night office setting."

# Panel 5: Coffee mug close-up
generate 5 "Close-up of a hand holding a coffee mug with 'DEBUG' text printed on it. Steam rising from the cup. Office desk background slightly blurred. Warm lighting on the mug, cool blue from monitors."

# Panel 6: Chen Ming reports
generate 6 "Medium shot in bright morning office. $CHEN stands in front of $ZJ's desk holding a tablet showing data charts, expression serious and concerned. $ZJ in grey hoodie looks at the tablet intently. Modern bright office with natural sunlight."

# Panel 7: Server log anomaly
generate 7 "Close-up of a tablet screen showing server log graphs with red highlighted anomaly spikes at specific times — Wednesday and Friday early mornings. Chinese labels on the chart. Professional data visualization."

# Panel 8: Zhu Jiang analyzing
generate 8 "Side medium shot. $ZJ sits with arms crossed over chest, eyes sharp and analytical — programmer detective mode activated. $CHEN stands nearby waiting. Bright office background."

# Panel 9: Suspect profiles on phone
generate 9 "Close-up of a smartphone screen hidden under a desk. The screen shows a playful crime-drama style suspect lineup with three cartoon portraits labeled in Chinese: Suspect A, B, C. Colorful and humorous design with 'criminal motive' fields."

# Panel 10: Zhu Jiang's reaction to Xiao Qi's drama style
generate 10 "Medium close-up. $ZJ looking down at something below desk level (phone), mouth twitching in amusement, trying not to laugh. Office setting, morning light."

# Panel 11: Lin Wei and Dr Zhou arrive
generate 11 "Wide shot of company entrance. $LINWEI walks in confidently with $DR_ZHOU beside her. Backlit by bright sunlight streaming through glass doors. Both women in business attire, powerful entrance. Modern tech office lobby."

# Panel 12: Meeting room confrontation
generate 12 "Medium shot of a bright modern meeting room. $DR_ZHOU sits at table typing on laptop. $ZJ sits across from her in a navy blue business casual shirt. $LINWEI stands by the window observing. Clean white meeting room with natural light."

# Panel 13: Secret signal
generate 13 "Close-up of $ZJ's left hand clenched tight under the table, while his right hand casually touches his left ear — a secret signal. Navy blue shirt sleeve visible. Tension in the hand muscles."

# Panel 14: AI test on big screen
generate 14 "Medium shot of meeting room. A large screen displays an AI testing interface with questions and answers in Chinese. $DR_ZHOU takes notes, brow slightly furrowed. Professional tech demo setting."

# Panel 15: Dr Zhou suspicious
generate 15 "Close-up of $DR_ZHOU's face. Her fingers pause on her laptop. Thin-framed glasses reflecting the test screen. She turns her head slightly to look back — suspicious, analytical gaze. NOT looking at camera, looking toward where $ZJ sits."

# Panel 16: Zhu Jiang sweating
generate 16 "Medium close-up. $ZJ maintains a polite smile but tiny beads of sweat on his forehead. Navy blue shirt. Energy bar overlay: 58/100. Bright meeting room."

# Panel 17: Wrong answer on screen
generate 17 "Close-up of test screen showing the AI's deliberately wrong answer — a geography question answered incorrectly in Chinese. Red X mark. $DR_ZHOU's glasses visible in the reflection of the screen."

# Panel 18: Dr Zhou demands deeper test
generate 18 "Medium shot. $DR_ZHOU stands up from her chair, pushing her glasses up. Stern expression, authoritative posture. Meeting room background. She gestures toward the screen."

# Panel 19: Zhu Jiang's decision moment
generate 19 "Extreme close-up of $ZJ's eyes. In his dark pupils, the silhouette of $DR_ZHOU is reflected. Intense, conflicted expression. Dramatic lighting — half his face lit, half in shadow."

# Panel 20: Zhu Jiang takes a stand
generate 20 "Medium shot. $ZJ suddenly stands, one hand firmly on the conference table. Decisive, commanding expression. Navy blue shirt. He speaks with authority — body language radiating dominance. Bright meeting room."

# Panel 21: Frozen meeting room
generate 21 "Wide shot of the meeting room — atmosphere frozen. $LINWEI turns from the window with surprised expression. $DR_ZHOU closes her laptop emotionlessly. $ZJ stands firm. Energy bar: 50/100. Dramatic tension."

# Panel 22: Lin Wei confronts in hallway
generate 22 "Medium shot in bright office hallway. $LINWEI walks up to $ZJ, her expression serious and slightly angry. She gestures while speaking. $ZJ faces her calmly. Window light from the side."

# Panel 23: Zhu Jiang deep breath
generate 23 "Close-up side profile. $ZJ takes a deep breath by a hallway window. Sunlight falls on half his face. Expression: determined but weary. Navy blue shirt."

# Panel 24: Earphone close-up
generate 24 "Extreme close-up of $ZJ's ear with a small wireless earphone. Soft blue glow from the earphone suggesting AI communication. Background blurred hallway. Energy bar: 35/100."

# Panel 25: Ahao's data match
generate 25 "Medium shot, late night. $ZJ back at his desk. Screen shows a timeline visualization — $AHAO's overtime records perfectly aligning with download timestamps. Red connecting lines. Dark office, screen glow."

# Panel 26: Complicated feelings about Ahao
generate 26 "Medium close-up. $ZJ frowns at a photo of $AHAO on screen. Complicated expression — sadness, betrayal, reluctance. Late night office. He's been working with Ahao for 2 years."

# Panel 27: Xiao Qi suggests hacking
generate 27 "Close-up of screen showing Xiao Qi's chat bubble in Chinese suggesting to hack Ahao's phone. The blue AI orb avatar has a mischievous expression. Dark background."

# Panel 28: Zhu Jiang facepalm
generate 28 "Medium close-up. $ZJ covers his face with one hand, exasperated but amused. Grey hoodie (changed back for night work). Late night office glow."

# Panel 29: Thinking honeypot
generate 29 "Medium shot. $ZJ leans back in his office chair, fingers tapping the desk rhythmically. Three suspect profiles on screen. Thinking deeply. Grey hoodie."

# Panel 30: Eureka moment
generate 30 "Medium close-up. $ZJ's eyes light up — the hacker smile, one corner of his mouth raised. He's got a plan. Screen glow illuminates his face from below."

# Panel 31: Golden Snitch Plan
generate 31 "Close-up of screen showing a flowchart titled in Chinese — three colored information streams flowing to three people icons, each marked with different colors. A monitoring dashboard. Sleek tech visualization."

# Panel 32: Triple split scene
generate 32 "Split composition showing three mini-scenes: Top — $ZJ casually talking to a young man (Xiao Li) at a water cooler. Middle — $ZJ chatting with $AHAO at a desk. Bottom — $ZJ in a meeting room with an older man (Lao Zhao). Different color tints for each section. Office settings."

# Panel 33: Trap triggered
generate 33 "Close-up of a monitoring dashboard on screen. Three colored data streams tracked across a dark map visualization. The blue stream (Ahao's) lights up with a red alert beacon. Dramatic tech visualization."

# Panel 34: Evidence confirmed, pain
generate 34 "Medium shot. $ZJ braces himself against the desk with both hands, looking at the damning evidence on screen. Expression of complex pain — not anger, but hurt. Late night office. Energy bar: 20/100."

# Panel 35: Hot pot healing
generate 35 "Wide shot of a cozy late-night hot pot restaurant. $ZJ in black hoodie and $CHEN sit across from each other. Red bubbling hot pot between them, warm orange lighting, steam rising. Beer bottles on table. Warm atmosphere."

# Panel 36: Unspoken words at dinner
generate 36 "Medium shot at hot pot table. $CHEN picks up tripe with chopsticks, laughing. $ZJ holds a beer glass, looking at $CHEN with complicated eyes — wanting to say something but holding back. Warm orange light. Energy bar: 35/100."

# Panel 37: Walking alone at night
generate 37 "Wide shot of a quiet night street. $ZJ walks alone in black hoodie, hands in pockets. Street lamps cast long shadows. City lights in the distance. Lonely but atmospheric. Cool blue nighttime tones."

# Panel 38: Final shock
generate 38 "Close-up of $ZJ stopping mid-step on the night street. Expression: shock, realization. Wind blows the edge of his black hoodie. Street lamp light from above casting dramatic shadows. Energy bar: 12/100. Dramatic, cliffhanger feeling."

echo "=== ALL PANELS COMPLETE ==="
echo "Total images: $(ls $OUT_DIR/p*.jpg 2>/dev/null | wc -l)"
