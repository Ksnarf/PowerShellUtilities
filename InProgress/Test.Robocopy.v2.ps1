# quick and dirtyRobocopy PowerSell script w/email log
# by skheed updated by skheed v2.04 06/08/2020

# v2 with additional modules by Ksnarf 2/08/2021

#robocopy Variables
$src = "C:\Program Files\Discovery\export"
$dest = "C:\temp"

#copy files to /
$cmd = gcm robocopy
$options = "/E","/copt:DAT", "/ZB", "/XO","/r:2","/w:2","/NDL","/NFL"

#robocopy Variables
$cmd = gcm robocopy
$logOptions ="/NP", "/log:C:\~run\logs\itrack_transfer_log.txt" | select -first 15
$options = "/E", "/mov","/copy:DAT", "/ZB", "/XO", "/r:2", "/w:2", "/NDL", "/NFL"

#Robocopy Run
& $cmd $src $dest $options $logOptions

 
#email Variables
$smtpserver = "smtp.wbgames.com"
$emailTo = @('<kris.sanders@wbgconsultant.com>')
$emailFrom = 'DiscoveryTool_SFO@wbgames.com'
$emailSubject = '<SFO> Discovery copy to iTrack'
$body = (Get-Content -Path C:\~run\logs\logfile.txt) -join "`n"

# email report Run
Send-MailMessage -To $emailTo -Subject $emailSubject -Body $body -SmtpServer $smtpserver -From $emailFrom
