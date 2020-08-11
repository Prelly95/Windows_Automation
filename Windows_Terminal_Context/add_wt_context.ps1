$command = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\wt.exe -p `"Command Prompt`" -d .\"
$icon_path = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\Windows-Terminal-icon.ico"

if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt"))
{
	New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt" -Force
}
Set-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt" -Value "Open Windows Terminal Here" -Force
New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt" -Name icon -PropertyType String -Value $icon_path -Force

if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt\command"))
{
	New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt\command" -Force
}
Set-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\wt\command" -Value $command -Force