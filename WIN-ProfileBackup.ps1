# Create Temporary Location if not already created

mkdir C:\Temp\UserBackup
Set-Location C:\Temp\UserBackup

# Create an Exclude List
$env:USERPROFILE
($env:USERPROFILE + "\appdata\temp") | Out-File -FilePath C:\excludelist.txt -Append
($env:USERPROFILE + "\appdata\local\temp") | Out-File -FilePath C:\excludelist.txt -Append

# XCopy the files, all directories from the users profile to the temporary location
$env:USERPROFILE
$Destination = "C:\Temp\UserBackup"
xcopy $env:USERPROFILE $Destination /s /c /h /EXCLUDE:c:\excludelist.txt
