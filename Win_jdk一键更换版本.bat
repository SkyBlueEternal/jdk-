@echo off
rem �л�Java jdk�汾
echo ���Թ���Ա�������л�
java -version
 
:menu
echo =============================================
echo ��ѡ��Ҫ�л���jdk�汾
echo 1��Java jdk 17
echo 2��Java jdk 1.8
echo 3: ȡ��
echo =============================================
set /p ch=��ѡ��
if "%ch%"=="1" goto java17
if "%ch%"=="2" goto java1.8
if "%ch%"=="3" goto exit
goto menu
 
 
:java17
set JAVA_HOME=C:\Program Files\Java\jdk-17.0.2
set JRE_HOME=C:\Program Files\Java\jdk-17.0.2
set JAVA_VERSION=17
goto exec
 
 
:java1.8
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_131
set JRE_HOME=C:\Program Files\Java\jre1.8.0_131
set JAVA_VERSION=1.8
goto exec
 
:exec
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Development Kit" /v CurrentVersion /t REG_SZ /f /d "%JAVA_VERSION%"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment" /v CurrentVersion /t REG_SZ /f /d "%JAVA_VERSION%"
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v JAVA_HOME /t REG_SZ /f /d "%JAVA_HOME%"
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v JRE_HOME /t REG_SZ /f /d "%JRE_HOME%"
del /f "C:\Windows\System32\java.exe"
copy /Y "%JAVA_HOME%\bin\java.exe" "C:\Windows\System32\java.exe"
del /f "C:\Windows\System32\javaw.exe"
copy /Y "%JAVA_HOME%\bin\javaw.exe" "C:\Windows\System32\javaw.exe"
del /f "C:\Windows\System32\javaws.exe"
copy /Y "%JAVA_HOME%\bin\javaws.exe" "C:\Windows\System32\javaws.exe"
set JAVA_PATH=C:\ProgramData\Oracle\Java\javapath
del /f "%JAVA_PATH%\java.exe"
mklink "%JAVA_PATH%\java.exe" "%JAVA_HOME%\bin\java.exe"
del /f "%JAVA_PATH%\javaw.exe"
mklink "%JAVA_PATH%\javaw.exe" "%JAVA_HOME%\bin\javaw.exe"
del /f "%JAVA_PATH%\javaws.exe"
mklink "%JAVA_PATH%\javaws.exe" "%JAVA_HOME%\bin\javaws.exe"
echo ���л���JDK %JAVA_VERSION%
pause
goto exit
:exit