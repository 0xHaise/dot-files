#!/bin/bash

# Verifica si se está ejecutando como root
if [[ "$EUID" -ne 0 ]]; then
  echo "Este script debe ejecutarse como root. Usa: sudo $0"
  exit 1
fi

# Sitios a bloquear
SITES=(
  "127.0.0.1 instagram.com"
  "127.0.0.1 www.instagram.com"
  "127.0.0.1 facebook.com"
  "127.0.0.1 www.facebook.com"
)

# Ruta del archivo hosts
HOSTS_FILE="/etc/hosts"

# Realiza una copia de seguridad
cp "$HOSTS_FILE" "${HOSTS_FILE}.bak"
echo "Se ha creado una copia de seguridad en ${HOSTS_FILE}.bak"

# Añadir las entradas si no existen
for SITE in "${SITES[@]}"; do
  if ! grep -q "$SITE" "$HOSTS_FILE"; then
    echo "$SITE" >> "$HOSTS_FILE"
    echo "Agregado: $SITE"
  else
    echo "Ya existe: $SITE"
  fi
done

echo "Bloqueo completado. Verifica con: cat /etc/hosts"

