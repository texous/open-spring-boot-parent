@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

:: 获取脚本文件名
set file_name=%~nx0

for /f "tokens=2 delims=-" %%a in ("%file_name%") do (
	::输出第一个分段(令牌)
	set java_version=%%a
)

set "java_home_str=JAVA_HOME_%java_version%"

if "%java_version%" == "" (
    set java_home_str=JAVA_HOME
)

echo ---- JAVA_HOME name: %java_home_str%

set JAVA_HOME=!%java_home_str%!

set "profile=-Pjdk%java_version%"

echo ---- JAVA_HOME: %JAVA_HOME%
echo ---- PROFILE: %profile%

cd ../
mvn clean deploy %profile%