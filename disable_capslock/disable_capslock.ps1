$path = "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout"

if (-not (Test-Path -Path "$path"))
{
	New-Item -Path $path -Force
}
New-ItemProperty -Path $path -Name "Scancode Map" -Type Binary -Value ([byte[]](00, 00, 00, 00, 00, 00, 00, 00, 02, 00, 00, 00, 00, 00, 58, 00, 00, 00, 00, 00)) -Force
