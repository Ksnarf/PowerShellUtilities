# quick and dirtyRobocopy PowerSell script w/email log
# by skheed updated by skheed v2.04 06/08/2020
 
 
# Variables
#$smtpserver = 'smtp.wbgames.com'
# set your target email addresses here. Replace the brackets and everything in between with the email address.
#$emailTo = @('<recipient@wbgames.com>')
# set this to whatever you want. it doesn't need to be a real address
#$emailFrom = 'DiscoveryTool@wbgames.com'
# replace the brackets and everything in between with your studio name
#$emailSubject = '<StudioName> Discovery copy to iTrack'
## this should be the same for every studio
$src = "C:\Program Files\Discovery\export"
# replace AAA with the three characters that represent your studio. see the table below.
$dest = "\\aws-jira01b.wbiegames.com\sfo"
 
 
# robocopy
$cmd = gcm robocopy
# modify the log location if you want
$logOptions ="/NP", "/log:C:\~run\logs\logfile.txt" | select -first 15
$options = "/E", "/copy:DAT", "/ZB", "/XO", "/r:2", "/w:2", "/NDL", "/NFL"
 
& $cmd $src $dest $options $logOptions
 
# email report
# modify the log location if you want
#$body = (Get-Content -Path C:\~run\logs\logfile.txt) -join "`n"
#Send-MailMessage -To $emailTo -Subject $emailSubject -Body $body -SmtpServer $smtpserver -From $emailFrom
