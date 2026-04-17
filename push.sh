#!/bin/bash
# Quick push — commit all changes and push to GitHub Pages
cd ~/Downloads/TFTT

echo "📦 Staging all changes..."
git add -A

echo "💾 Committing..."
git commit -m "✨ Update: animated logo video, team corrections, today's event, workshop tentative

Changes:
- Hero: animated Logo_Animation_For_Website.mp4 replaces static logo
- Team: updated names/roles (Dr. Sanjay Anant, Anupam Sahai, Smt. Sunanda Saxena, Prof. Prabhat Srivastava)
- Workshop: marked as Proposed/Tentative — 3 May 2026
- NEW: Today's Event section — National Dialogue & Book Launch
  - Hindi Bhavan, 17 April 2026, 1PM
  - Joint: TFFT, Anang Prakashan, Syahi Blue Books, Sahitya Unnayan Sansthan, Bundelkhand Sahitya Unnayan Samiti
- Nav: Events link with live dot added"

echo "🚀 Pushing to GitHub..."
git push origin main

echo ""
echo "✅ Live at: https://bhanu-pratap-rana.github.io/TFTT/"
