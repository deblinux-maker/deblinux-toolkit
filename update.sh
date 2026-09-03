#!/bin/bash

# Script di aggiornamento Git intelligente

cd "$(dirname "$0")"

echo "Inserisci il messaggio del commit:"
read msg

git add .
git commit -m "$msg"

# Controllo se il branch ha un upstream
UPSTREAM=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)

if [ -z "$UPSTREAM" ]; then
    echo "Nessun upstream trovato. Lo imposto automaticamente..."
    git push --set-upstream origin main
else
    git push
fi

echo "Aggiornamento completato."

