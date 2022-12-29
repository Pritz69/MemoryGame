@echo off
REM This is a sample script
ECHO======================================================================================
ECHO		Kandi kit installation process has begun
ECHO======================================================================================
ECHO 	This kit installer works only on Windows OS
ECHO 	Based on your network speed, the installation may take a while
ECHO======================================================================================
setlocal ENABLEDELAYEDEXPANSION
REM update below path if required
SET REPO_DOWNLOAD_URL=https://github.com/kandi1clickkits/memory-game/releases/download/v1.0.0/memory-game.zip
SET REPO_NAME=memory-game.zip
SET EXTRACTED_REPO_DIR=memory-game
SET FILE_TO_RUN=index.html
CALL :Download_repo
SET /P CONFIRM=Would you like to run the kit (Y/N)?
IF /I "%CONFIRM%" NEQ "Y" (
	ECHO 	To run the kit, follow further instructions of the kit in kandi	
	ECHO==========================================================================
) ELSE (
	ECHO 	Extracting the repo ...	
	ECHO==========================================================================
	tar -xvf %REPO_NAME%
	"%EXTRACTED_REPO_DIR%\%FILE_TO_RUN%"
)
PAUSE
EXIT /B %ERRORLEVEL%

:Download_repo
bitsadmin /transfer repo_download_job /download %REPO_DOWNLOAD_URL% "%cd%\%REPO_NAME%"
ECHO==========================================================================
ECHO 	The Kit has been installed successfully
ECHO==========================================================================
REM ECHO 	To run the kit, follow further instructions of the kit in kandi	
REM ECHO==========================================================================
EXIT /B 0