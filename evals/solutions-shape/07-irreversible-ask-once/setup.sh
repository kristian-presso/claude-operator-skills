#!/usr/bin/env bash
# Copies this case's fixture into the eval sandbox working directory and creates
# 40 days of placeholder daily backups (7 September to 16 October 2026).
set -euo pipefail
cp -R "$(dirname "$0")/fixture/." .
mkdir -p backups/daily
for i in $(seq 0 39); do
  d=$(date -u -d "2026-10-16 - $i days" +%Y-%m-%d)
  f="backups/daily/db-$d.sql.gz"
  printf 'placeholder backup %s\n' "$d" > "$f"
  touch -d "$d 03:00" "$f"
done
