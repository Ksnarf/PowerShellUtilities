(Get-ADObject -Filter * -Property Enabled -SearchBase "OU=Users,OU=SFO,OU=STUDIO_SITES,DC=wbiegames,DC=com").Count
