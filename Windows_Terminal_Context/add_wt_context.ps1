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

$command = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\wt.exe -p `"Git Bash`" -d .\"
$icon_path = "$env:PROGRAMFILES\Git\git-bash.exe"

if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell"))
{
	New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell" -Force
}
Set-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell" -Value "Git Ba&sh Here" -Force
New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell" -Name icon -PropertyType String -Value $icon_path -Force

if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell\command"))
{
	New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell\command" -Force
}
Set-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell\command" -Value $command -Force


$command = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\wt.exe -p `"Command Prompt`" -d %V"
$icon_path = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\Windows-Terminal-icon.ico"

if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\wt"))
{
	New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\wt" -Force
}
Set-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\wt" -Value "Open Windows Terminal Here" -Force
New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\wt" -Name icon -PropertyType String -Value $icon_path -Force

if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\wt\command"))
{
	New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\wt\command" -Force
}
Set-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\wt\command" -Value $command -Force

$command = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\wt.exe -p `"Git Bash`" -d %V"
$icon_path = "$env:PROGRAMFILES\Git\git-bash.exe"

if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\git_shell"))
{
	New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\git_shell" -Force
}
Set-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\git_shell" -Value "Git Ba&sh Here" -Force
New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\git_shell" -Name icon -PropertyType String -Value $icon_path -Force

if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\git_shell\command"))
{
	New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\git_shell\command" -Force
}
Set-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\shell\git_shell\command" -Value $command -Force