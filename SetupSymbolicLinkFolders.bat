@echo off
:: Cache the Batch Directory
set BATCH_DIR=%~dp0
set CORE_DIR=%BATCH_DIR%..\core\
::
@echo Setup Symbolic Links
::
setlocal enabledelayedexpansion
::
set PLUGIN_NAMES[0]=CsPlugin
set PLUGIN_NAMES[1]=CsProjectile
set PLUGIN_NAMES[2]=CsWeapon
::
set PLUGIN_SCRIPT_NAMES[0]=Cs
set PLUGIN_SCRIPT_NAMES[1]=CsPrj
set PLUGIN_SCRIPT_NAMES[2]=CsWp
::
for /l %%i in (0,1,2) do (
	set PLUGIN_NAME=!PLUGIN_NAMES[%%i]!
	set PLUGIN_SCRIPT_NAME=!PLUGIN_SCRIPT_NAMES[%%i]!
	@echo -- Remove Link with Content\Scripts\!PLUGIN_SCRIPT_NAME!
	if exist "%BATCH_DIR%Content\Scripts\!PLUGIN_SCRIPT_NAME!" rmdir /s /q "%BATCH_DIR%Content\Scripts\!PLUGIN_SCRIPT_NAME!"
	@echo -- Set Link with %CORE_DIR%!PLUGIN_NAME!\Content\Scripts\!PLUGIN_SCRIPT_NAME!
	call mklink /j "%BATCH_DIR%Content\Scripts\!PLUGIN_SCRIPT_NAME!" "%CORE_DIR%!PLUGIN_NAME!\Content\Scripts\!PLUGIN_SCRIPT_NAME!"
)
::
endlocal