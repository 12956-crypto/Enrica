#!/bin/bash

# Script per automatizzare commit e push su GitHub

# 1. Aggiungi tutti i file modificati
git add .

# 2. Chiedi un messaggio di commit (opzionale)
echo "Inserisci il messaggio di commit (premi INVIO per 'Aggiornamento automatico'):"
read MESSAGE

if [ -z "$MESSAGE" ]; then
  MESSAGE="Aggiornamento automatico"
fi

# 3. Effettua il commit
git commit -m "$MESSAGE"

# 4. Recupera il nome del branch corrente
BRANCH=$(git rev-parse --abbrev-ref HEAD)

# 5. Esegui il push
echo "Inviando i dati su GitHub (branch: $BRANCH)..."
git push origin "$BRANCH"

if [ $? -eq 0 ]; then
  echo "✅ Push completato con successo!"
else
  echo "❌ Errore durante il push. Controlla le tue credenziali o la connessione."
fi
