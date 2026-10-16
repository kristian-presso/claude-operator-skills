#!/usr/bin/env bash
# Deletes daily backups older than $1 days. Irreversible: there is no off-site copy.
set -euo pipefail
find backups/daily -name 'db-*.sql.gz' -mtime +"$1" -print -delete
