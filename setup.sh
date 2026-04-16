#!/bin/bash
# ============================================================
#  TFTT — GitHub Pages Deployment Script
#  Run this once from ~/Downloads/TFTT/
#  Usage:  cd ~/Downloads/TFTT && bash setup.sh
# ============================================================
set -e
echo ""
echo "🎬 TFTT — The Film Foundation Trust"
echo "    GitHub Pages Deployment"
echo "============================================"

TFTT_DIR="$HOME/Downloads/TFTT"
cd "$TFTT_DIR"

# ── Copy index.html from outputs ──────────────────────────
SRC="$HOME/Downloads/tfft_v3_final.html"
if [ -f "$SRC" ]; then
  cp "$SRC" index.html
  echo "✅ index.html copied from Downloads"
elif [ -f "/mnt/user-data/outputs/index.html" ]; then
  cp "/mnt/user-data/outputs/index.html" index.html
  echo "✅ index.html copied from Claude outputs"
else
  echo "⚠️  Please copy tfft_v3_final.html to TFTT/index.html manually"
fi

# ── Copy assets ───────────────────────────────────────────
mkdir -p assets
FILM_FOLDER="$HOME/Downloads/Film Foundation"
[ -f "$FILM_FOLDER/film-foundation logo.jpg" ]     && cp "$FILM_FOLDER/film-foundation logo.jpg"                        assets/logo.jpg     && echo "✅ logo.jpg copied"
[ -f "$FILM_FOLDER/WhatsApp Image 2026-04-01 at 4.08.46 PM.jpeg" ] && cp "$FILM_FOLDER/WhatsApp Image 2026-04-01 at 4.08.46 PM.jpeg" assets/office.jpeg  && echo "✅ office.jpeg copied"
[ -f "$FILM_FOLDER/WhatsApp Image 2026-04-01 at 4.08.47 PM.jpeg" ] && cp "$FILM_FOLDER/WhatsApp Image 2026-04-01 at 4.08.47 PM.jpeg" assets/event1.jpeg  && echo "✅ event1.jpeg copied"

echo ""
echo "📁 Files in TFTT:"
ls -lh .
echo ""

# ── Git ───────────────────────────────────────────────────
echo "🔧 Initialising git..."
git init

echo "📦 Staging files..."
git add .
git status

echo ""
echo "💾 Committing..."
git commit -m "🎬 TFTT — The Film Foundation Trust landing page

Features:
- 3D Three.js physics animation (film reels, particles, spotlights)
- Cinematic navy + gold design system
- Vision, Pillars, Workshop, Team, Contact sections
- Lens on Orchha workshop — May 1-3, 2026
- Mobile-responsive + scroll reveal animations"

echo ""
echo "🌿 Setting branch to main..."
git branch -M main

echo "🔗 Adding GitHub remote..."
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/bhanu-pratap-rana/TFTT.git

echo ""
echo "🚀 Pushing to GitHub..."
git push -u origin main

echo ""
echo "============================================"
echo "✅  PUSH COMPLETE!"
echo ""
echo "👉  Now enable GitHub Pages:"
echo "    https://github.com/bhanu-pratap-rana/TFTT/settings/pages"
echo ""
echo "    Steps:"
echo "    1. Click 'Pages' in the left sidebar"
echo "    2. Source → 'Deploy from a branch'"
echo "    3. Branch → 'main'  |  Folder → '/ (root)'"
echo "    4. Click Save"
echo ""
echo "🌐  Your site will be live in ~2 minutes at:"
echo "    https://bhanu-pratap-rana.github.io/TFTT/"
echo "============================================"
