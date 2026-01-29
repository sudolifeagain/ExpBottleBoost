@REM Maven wrapper for Windows
@REM Downloads and runs Maven if not installed

@echo off
setlocal

set MAVEN_VERSION=3.9.6
set MAVEN_HOME=%USERPROFILE%\.m2\wrapper\apache-maven-%MAVEN_VERSION%
set MAVEN_BIN=%MAVEN_HOME%\bin\mvn.cmd

if exist "%MAVEN_BIN%" goto run

echo Downloading Apache Maven %MAVEN_VERSION%...
mkdir "%USERPROFILE%\.m2\wrapper" 2>nul
powershell -Command "& { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/%MAVEN_VERSION%/binaries/apache-maven-%MAVEN_VERSION%-bin.zip' -OutFile '%TEMP%\maven.zip' }"
powershell -Command "& { Expand-Archive -Path '%TEMP%\maven.zip' -DestinationPath '%USERPROFILE%\.m2\wrapper' -Force }"
del "%TEMP%\maven.zip" 2>nul

:run
"%MAVEN_BIN%" %*
