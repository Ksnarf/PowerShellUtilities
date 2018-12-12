Import-Module ActiveDirectory

Function GMembership {
 Get-ADGroupMember -Identity "Group Name" | 
  foreach {
  Get-ADUser -Identity $_.distinguishedname -Properties displayname, samaccountname, lastlogondate
  }
 
 Export-Csv C:\tmp\LastLogonGroupName.csv -NoTypeInformation
 
 }
 
