

#https://www.microsoft.com/en-us/download/details.aspx?id=45520


$FilePath = 'C:\data\userlist.xlsx'
$objExcel = New-Object -ComObject Excel.Application
$WorkBook = $objExcel.Workbooks.Open($filepath)

# get data from column 2
$data = $WorkBook.Worksheets['Sheet1'].UsedRange.Rows.Columns[1].Value2

$WorkBook | Get-Member -Name *Sheet1*
# display results
$data | Select-Object # remove header 
# cleanup
$wb.close()
$xl.Quit()
While ([System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb) -ge 0) { }
while ([System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl) -ge 0) { } 
Remove-Variable xl, wb # this is optional



# param (
#   [string]$groupName = $(Read-Host "Input Group Name"),
#   [string]$workingdir = "C:\data\*.csv",
#   [string]$exportFilename = "ActiveDirectoryDetails"
# )

# $Groups = get-adgroup -filter "name -like '*$groupName*'" -Properties *

# foreach ( $Group in $Groups ) {
#   $gName = $Group.Name
#   Get-ADGroupMember $Group | Get-ADUser -Properties name, samAccountName, emailAddress, department | select name, samAccountName, emailAddress, department | export-csv -Path c:\data\$gName.csv -NoTypeInformation
# }

# $csvs = dir -path $workingdir
# $y = $csvs.Count

# $outputfilename = "C:\data\" + $exportFilename + ".xlsx"
# ### Create a new Excel Workbook with one empty sheet
# $excelapp = new-object -comobject Excel.Application
# $excelapp.sheetsInNewWorkbook = $csvs.Count
# $xlsx = $excelapp.Workbooks.Add()
# $sheet = 1

# foreach ($csv in $csvs) {
#   $row = 1
#   $column = 1
#   $worksheet = $xlsx.Worksheets.Item($sheet)
#   $worksheet.Name = $csv.Name
#   #$file = (Get-Content $csv)
# $TxtConnector = ("TEXT;" + $csv)
# $Connector = $worksheet.QueryTables.add($TxtConnector,$worksheet.Range("A1"))
# $query = $worksheet.QueryTables.item($Connector.name)

# ### Set the delimiter (, or ;) according to your regional settings
# ### $Excel.Application.International(3) = ,
# ### $Excel.Application.International(5) = ;
# #$query.TextFileOtherDelimiter = $Excel.Application.International(5)
# $query.TextFileOtherDelimiter = ","

# ### Set the format to delimited and text for every column
# ### A trick to create an array of 2s is used with the preceding comma
# $query.TextFileParseType  = 1
# $query.TextFileColumnDataTypes = ,2 * $worksheet.Cells.Columns.Count
# $query.AdjustColumnWidth = 1

# ### Execute & delete the import query
# $query.Refresh()
# $query.Delete()
#   $sheet++
# }

# $xlsx.SaveAs($outputfilename)
# $excelapp.quit()

# remove-item -path $workingdir -exclude *Crab4dq.csv
# #Get-ADGroupMember -Identity groupname |
# #Where-Object { $_.objectClass -eq 'user' } |
# #Get-ADUser -Properties *
