#!/bin/bash

BASE_URL="https://raw.githubusercontent.com/StudioGeist/iarbeid-font/main/Lexend"
TEMP_DIR="$HOME/Library/Caches/LexendFonts"
FONT_DIR="$HOME/Library/Fonts"

mkdir -p "$TEMP_DIR"

WEIGHTS=(Thin ExtraLight Light Regular Medium SemiBold Bold ExtraBold Black)

echo "Laster ned Lexend..."
for W in "${WEIGHTS[@]}"; do
    echo " - Lexend-$W.ttf"
    curl -sL "$BASE_URL/Lexend-$W.ttf" -o "$TEMP_DIR/Lexend-$W.ttf"
done

echo ""
echo "Installerer skrifter..."
for W in "${WEIGHTS[@]}"; do
    cp "$TEMP_DIR/Lexend-$W.ttf" "$FONT_DIR/"
done

rm -rf "$TEMP_DIR"

echo ""
echo "Ferdig! Alle Lexend-vektene er installert."