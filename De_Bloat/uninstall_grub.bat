@echo off
goto check_Permissions

:check_Permissions
	echo Administrative permissions required. Detecting permissions...

	net session >nul 2>&1
	if %errorLevel% == 0 (
		echo Success: Administrative permissions confirmed.
		goto restore_bootmanager
	) else (
		echo Failure: Current permissions inadequate.
		goto end
	)

:restore_bootmanager
	echo Restoring Windows Boot Manager
	bcdedit /set {bootmgr} path \EFI\Microsoft\Boot\bootmgfw.efi
	echo --
	echo Listing all boot managers avaiable
	mountvol S: /s
	dir S:\EFI

:end
	pause