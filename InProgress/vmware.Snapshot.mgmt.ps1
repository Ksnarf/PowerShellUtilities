# Check for global snapshots
Get-VM | Get-Snapshot

# Check for snapshots older than 3 days
Get-VM | Get-Snapshot | Where {$_.Created -lt (Get-Date).AddDays(-3)}

# Remove snapshots older than 7 days
Get-VM | Get-Snapshot | Where {$_.Created -lt (Get-Date).AddDays(-7)} | Remove-Snapshot -Confirm:$false
