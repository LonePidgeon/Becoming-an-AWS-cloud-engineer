# Bash Backup Script

A short AWS/Linux lab: writing a Bash shell script on an EC2 instance to automate backing up a folder into a timestamped compressed archive.

## What this covers

- Connecting to an Amazon Linux EC2 instance via SSH
- Writing a Bash script with the `vi` editor
- Using `date` to generate a timestamped filename
- Archiving a folder with `tar`
- Making a script executable with `chmod`

## Repo structure

```
├── backup.sh     # The backup script
└── README.md
```

## The script

```bash
#!/bin/bash
DAY="$(date +%Y_%m_%d)"
BACKUP="/home/$USER/backups/$DAY-backup-CompanyA.tar.gz"
tar -csvpzf $BACKUP /home/$USER/CompanyA
```

## Usage

```bash
chmod 755 backup.sh
./backup.sh
```

This creates a compressed, timestamped archive of the `CompanyA` folder in `~/backups/`. It could be scheduled with `cron` to run as a daily backup job.
