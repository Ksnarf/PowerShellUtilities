# quick and dirtyRobocopy PowerSell script w/email log
# by skheed updated by skheed v2.04 06/08/2020

# v2 with additional modules by Ksnarf 2/08/2021

#email Variables
$smtpserver = "smtp.wbgames.com"
$emailTo = @('<kris.sanders@wbgconsultant.com>')
$emailFrom = 'DiscoveryTool_SFO@wbgames.com'
$emailSubject = '<SFO> Discovery copy to iTrack'

#robocopy Variables
$src = "C:\Program Files\Discovery\export"
$dest = "\\aws-jira01b.wbiegames.com\sfo"

#robocopy
$cmd = gcm robocopy
# modify the log location if you want
$logOptions ="/NP", "/log:C:\~run\logs\itrack_transfer_log.txt" | select -first 15
$options = "/E", "/copy:DAT", "/ZB", "/XO", "/r:2", "/w:2", "/NDL", "/NFL"
 
& $cmd $src $dest $options $logOptions
 
# email report
# modify the log location if you want
#$body = (Get-Content -Path C:\~run\logs\logfile.txt) -join "`n"
#Send-MailMessage -To $emailTo -Subject $emailSubject -Body $body -SmtpServer $smtpserver -From $emailFrom
