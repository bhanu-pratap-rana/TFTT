#!/bin/bash
# Fix rejected push — pull remote changes then push
cd ~/Downloads/TFTT

echo "⬇️  Pulling remote changes (rebase)..."
git pull origin main --rebase

echo "🚀 Pushing to GitHub..."
git push origin main

echo ""
echo "✅ Done! Live at: https://bhanu-pratap-rana.github.io/TFTT/"
