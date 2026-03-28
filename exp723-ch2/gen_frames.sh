#!/bin/bash
# EXP-723 Ch2 frame generation
SCRIPT="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/skills/gemini-image/scripts/generate_image.py"
OUTDIR="$HOME/trinity-v3-content/exp723-ch2/images"
REF="/Users/ahzhu_agent/.openclaw-trinity-v3/workspace-operator/shared/character-reference/zhujiang-photo-original.jpg"

export GEMINI_API_KEY="sk-jNa58GTQ97OpQxpk9pPIJMA2bkJ169OJ2MkgVAhpJsezbGg3"
export GEMINI_BASE_URL="https://king.tokenssr.com"

gen() {
  local N="$1"
  local PROMPT="$2"
  local USE_REF="$3"  # "ref" or empty
  local OUT="$OUTDIR/f${N}.jpg"
  [ -f "$OUT" ] && echo "SKIP f${N}" && return
  echo ">>> f${N} $(date +%H:%M:%S)"
  if [ "$USE_REF" = "ref" ]; then
    uv run "$SCRIPT" --prompt "$PROMPT" --filename "$OUT" --resolution 1K -i "$REF" 2>&1 | tail -3
  else
    uv run "$SCRIPT" --prompt "$PROMPT" --filename "$OUT" --resolution 1K 2>&1 | tail -3
  fi
  if [ -f "$OUT" ]; then
    sips -s format jpeg -s formatOptions 75 -Z 1280 "$OUT" --out "$OUT" 2>/dev/null
    echo "OK f${N} $(du -h "$OUT" | cut -f1)"
  else
    echo "FAIL f${N}"
  fi
}

S="Semi-realistic manga illustration, vertical 9:16 portrait orientation, warm bright lighting, cinematic. No text on image. Characters look at scene objects, never at camera."

gen "01" "$S A Chinese man in his early 30s with swept-back black hair and stubble (matching reference photo) sits alone in a messy startup office at 2AM. Takeout boxes on desk. Computer screens glow showing search results about a dragon symbol. He leans forward studying a document. Warm desk lamp. Focused mood." ref

gen "02" "$S Chinese ink wash painting with warm golden accents. Wuxia fantasy: A young swordsman in dark robes sits by candlelight examining an ancient scroll showing martial arts school rankings with glowing animal symbols - dragon, tiger, eagle, phoenix. The dragon glows brightest. Mysterious atmospheric mood."

gen "03" "$S A Chinese man (matching reference photo) stands by a window in bright morning sunlight, holding phone to ear. Casual t-shirt. Alert, slightly suspicious expression. 3/4 angle. The Bund skyline visible through window in soft focus. Bright clean morning." ref

gen "04" "$S Luxurious top-floor conference room, 5-star hotel. Floor-to-ceiling windows with Shanghai panorama. Long dark table, 7 chairs in semicircle, 5 people seated. Warm golden afternoon light. Shot from entrance looking in. Rich opulent atmosphere."

gen "05" "$S Chinese ink wash with warm tones. Wuxia: Peak of Huashan mountain above clouds. Stone platform with 7 seats, 5 martial artists in colored robes seated. Pine trees, dramatic clouds below. Golden sunset. Epic grandiose."

gen "06" "$S A bald Chinese man in his 50s, long face, enigmatic smile, expensive grey suit, stands at head of conference table. Massive window with skyline behind. Gesturing with one hand. 6 people at table look up. Low angle shot emphasizing authority. Warm golden light."

gen "07" "$S Chinese ink wash with golden highlights. Wuxia: Bald grandmaster in golden robes on stone platform raises jade command token. Six martial artists in different colored robes look up. Mountain peaks, clouds. Golden light radiates from token. Epic ceremonial."

gen "08" "$S Confident Chinese woman late 20s, long black hair, red lipstick, fitted black dress, presents in front of large screen with professional charts. Commanding posture, one hand gesturing at screen. 6 people watching. Warm conference lighting. Slightly low angle."

gen "09" "$S Chinese ink wash with silver highlights. Wuxia: Female swordswoman in white and silver robes performs dazzling sword demonstration. Blade trails light arcs. Several martial artists watch with awe. Mountain summit. Dynamic action mid-strike."

gen "10" "$S Comedy: Nervous young man in rumpled suit frozen at presentation screen accidentally showing financial spreadsheet with large red loss numbers. Pale face. At table: some suppress smiles, bald man calmly sips tea. Warm conference room. Comedic exaggeration."

gen "11" "$S Chinese ink wash, comedy. Wuxia: Martial artist loses qi control during demonstration. Energy meridian lines burst chaotically. Others jump back. Dramatic but comedic. Mountain summit. Bright energy effects."

gen "12" "$S A sweating businessman at slide 37 of endless presentation, gesturing emphatically. At head of table, bald man in 50s smiles patiently, hands folded. In corner, a Chinese man (matching reference) observes with knowing look. Warm conference room." ref

gen "13" "$S Close-up 3/4 angle of Chinese man (matching reference photo) in corner seat, eyes scanning room analytically. Calm calculating expression. Blurred conference table and people in background. Warm golden side-lighting on profile. Dramatic." ref

gen "14" "$S Chinese ink wash, warm tones. Wuxia: Young swordsman with arms crossed leans against pillar, watching others demonstrate skills from distance. Calm analytical expression. Various fighters in background. Mountain summit, golden light."

gen "15" "$S Chinese man (matching reference) stands at front of conference room. Projector screen behind is BLACK/dead. 6 people watch. Woman with long black hair sips water with piercing gaze. Bald man at head smiles. Standing man shows brief surprise but not panic. Warm lighting." ref

gen "16" "$S Chinese man (matching reference) has connected laptop to big screen via HDMI. Screen shows dark terminal with green and blue code. He stands confidently, hands on keyboard, looking at screen. Others lean forward. Warm room plus blue screen glow." ref

gen "17" "$S Chinese ink wash with dynamic energy. Wuxia: Young martial artist walks onto fighting platform with bare hands, no weapons. Others murmur. Calm eyes like still water. Mountain summit with dramatic clouds."

gen "18" "$S Close-up dramatic: Hands typing rapidly on laptop keyboard. Screen shows scrolling code with data visualizations. Chinese mans focused face reflected in screen light (matching reference, side angle). Blue-green glow plus warm ambient. Intense technical mood." ref

gen "19" "$S Wide shot conference room reactions. Woman with long black hair has put down pen. Nervous man leans forward. Silent pen-spinner has stopped, looking up. Bald chairman serious for first time, no smile. Electric atmosphere. Warm lighting."

gen "20" "$S Chinese ink wash with golden energy. Wuxia action: Young martial artist delivers devastating bare-fisted strikes with visible shockwaves. Precise, powerful. Female swordswoman grips sword hilt. Grandmaster smile gone. Dynamic action lines."

gen "21" "$S Chinese man (matching reference) has just sat down after presenting. Big screen behind shows data dashboard with 23 percent improvement in green. Calm posture with slight tension. Others look at screen impressed. Warm conference room." ref

gen "22" "$S Conference room: Quiet pen-spinning man now claps slowly. Only one clapping. Others uncertain. Bald chairman sips tea without expression. Chinese man (matching reference) sits trying to look casual. Warm golden light." ref

gen "23" "$S Chinese ink wash, poetic. Wuxia: Young martial artist stands still on platform after demonstration, arms at sides. A single leaf falls in front of him. One martial artist starts slow clap. Mountain summit, golden sunset. Reverent atmosphere."

gen "24" "$S Luxurious hotel private dining room. Round table, 8 people. Red wine glasses, elegant dishes. Warm golden chandelier. Bald man at head. Chinese man (matching reference) sits nearby observing carefully. Outwardly jovial but tense. Rich warm colors." ref

gen "25" "$S At dinner table close-up: Bald Chinese man 50s uses chopsticks to serve food to younger Chinese man (matching reference). Warm but probing eyes. Younger man listens attentively. Warm dinner lighting, golden tones." ref

gen "26" "$S Comedy at dinner: Overeager young businessman leans across table toward bald chairman, holding phone for WeChat scan AND offering business card simultaneously. Desperate expression. Bald man smiles politely. In corner, Chinese man (matching reference) watches with subtle amusement. Warm dinner." ref

gen "27" "$S Hotel corridor at night. Floor-to-ceiling windows show city night lights. Chinese woman long black hair red lipstick black dress stands by window looking at phone. A man approaches from distance. Warm golden wall sconces. Both face windows. Atmospheric cinematic."

gen "28" "$S Two people in hotel corridor by window with city night view. Chinese man (matching reference) and Chinese woman long black hair red lips. She shows phone screen with phoenix symbol. Conspiratorial mood. Warm wall light plus cool city lights. They look at phone not camera." ref

gen "29" "$S Chinese ink wash with warm lantern glow and cool moonlight. Wuxia: Two young martial artists face each other in stone pavilion on moonlit mountain. One has dragon emblem, one phoenix emblem. Pine trees and mist. Secretive alliance-forming."

gen "30" "$S Chinese woman long black hair red lipstick black dress leans against window with city lights, arms crossed, speaking confidently. Chinese man (matching reference) stands few feet away hands in pockets listening thoughtfully. Negotiation mood. Warm corridor plus cool city." ref

gen "31" "$S Comedy in hotel corridor: Room service cart nearly crashed into two people. Server bows apologetically. Chinese man (matching reference) and Chinese woman long black hair both jumped back laughing. Lightened mood. Warm corridor." ref

gen "32" "$S At dinner table: Bald Chinese man 50s stands holding stack of sleek black metallic cards. Everyone silent watching. Solemn ritualistic. Warm golden chandelier. Slightly low angle."

gen "33" "$S Extreme close-up: Hands hold sleek black metallic card. Embossed silver text showing address and date. Blazer sleeve visible. Blurred background shows others examining cards. Warm light reflecting off metallic surface."

gen "34" "$S Wide dinner table shot: 7 people looking at black metallic cards with various expressions. One pale man scared. Another flips card. Woman presses card edge. Chinese man (matching reference) stares at card with determination. Bald chairman stands watching. Dramatic warm light." ref

gen "35" "$S Cinematic closing: Chinese man (matching reference) stands outside luxury hotel on the Bund at night. Holds black metallic card catching light. Wind ruffles hair. Bund buildings lit in warm gold behind. Determined expression looking toward Pudong skyline. Wide from behind/side. Epic anticipatory." ref

echo "=== DONE ==="
ls "$OUTDIR"/ | wc -l
du -sh "$OUTDIR"/
