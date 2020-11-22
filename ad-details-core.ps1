$Groups = Get-AdGroup -filter "name -like '*GroupName'" -Properties * 

foreach ( $Group in $Groups ) { 
    $gName = $Group.Name 
    Write-Output $gName 
    # Get-ADGroupMember $Group | Get-ADUser -Properties name, samAccountName, emailAddress, department, city | select name, samAccountName, emailAddress, department, city | export-csv -Path c:\data\$gName.csv -NoTypeInformation 
    # Get-ADGroupMember $Group
    # Get-ADUser -Properties name, samAccountName, emailAddress, department, ci| Get-ADUser -Properties name, samAccountName, emailAddress, department, city | select name, samAccountName, emailAddress, department, city ty 
    Get-ADGroupMember -Identity "$gName"   | Select -ExpandProperty samaccountname | Get-Aduser | select  Name, SamAccountName, UserPrincipalName | ft 
}
