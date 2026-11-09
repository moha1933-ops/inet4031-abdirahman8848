# Week 9: Data Observability and Backup

## What I built

This week I added database backups, restore tooling, and PostgreSQL monitoring to the incident application.

The database is backed up automatically every five minutes. Backups are stored in ~/backups, and the backup script keeps the newest 12 backups.

I also added the PostgreSQL exporter so Prometheus can monitor database health, database size, and table row estimates.

## Backup

Run a manual backup with ./week-9/backup.sh.

The backup cron job runs every five minutes.

## Restore

Restore the newest backup with ./week-9/restore.sh.

## Database checks

Run ./week-9/sql.sh to show the row count for every table.

## Measured recovery

- Rows before the drill: tickets: 1
- Age of the backup used: 122 seconds
- Recovery time: 164 seconds

## Verification

Run ./week-9/check.sh to verify the cluster, database, exporter, backups, and database tables.
