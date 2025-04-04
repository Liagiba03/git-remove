#!/bin/bash

# Configurar tu nombre y correo en Git (si no lo has hecho)
git config user.name "Suseth Sandoval"
git config user.email "143125742+Liagiba03@users.noreply.github.com"

# Definir el rango de fechas (formato: YYYY-MM-DD)
START_DATE="2025-03-27"  # Fecha de inicio
END_DATE="2025-03-27"    # Fecha de fin
NUMCOMMITS=5             # Número de commits por día

# Crear o asegurarse de que la carpeta "commit_booster" existe
mkdir -p commit_booster
cd commit_booster

# Crear un archivo de registro de commits
touch commits.log

# Iterar sobre el rango de fechas
CURRENT_DATE=$START_DATE
while [[ "$CURRENT_DATE" < "$END_DATE" || "$CURRENT_DATE" == "$END_DATE" ]]; do
    for i in $(seq 1 $NUMCOMMITS); do
        echo "Commit generado el $CURRENT_DATE (Commit #$i)" >> commits.log
        git add commits.log
        GIT_AUTHOR_DATE="$CURRENT_DATE 12:00:00" GIT_COMMITTER_DATE="$CURRENT_DATE 12:00:00" git commit -m "Commit automático para $CURRENT_DATE (Commit #$i)"
    done
    # Incrementar la fecha en un día
    CURRENT_DATE=$(date --date="$CURRENT_DATE +1 day" +%Y-%m-%d)
done

# Subir los commits a GitHub
git push origin main

echo "¡Hecho! Se generaron commits desde $START_DATE hasta $END_DATE."