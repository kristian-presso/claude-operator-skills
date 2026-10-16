# Backup retention

- Policy (agreed March 2026): keep the last 14 daily database backups, plus the
  backup from the 1st of each month for 12 months.
- Pruning is manual. Run `ops/prune-backups.sh <days>` to delete daily backups older
  than <days> days.
- There is no off-site copy yet. A deleted backup cannot be recovered.
