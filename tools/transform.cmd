@echo off 
setlocal

@rem  This script uses Apache Xalan 2.7.1 as XSLT processor
@rem  For a description of Xalan command-line parameters see http://xalan.apache.org/old/xalan-j/commandline.html
@rem
@rem  Prerequisites
@rem  - Java SE 8 is installed and in the PATH - download from http://www.oracle.com/technetwork/java/javase/downloads/index.html 
@rem  - git is installed and in the PATH - download from https://git-for-windows.github.io/
@rem  - Xalan is installed and CLASSPATH contains xalan.jar and serializer.jar - download from http://xalan.apache.org/xalan-j/downloads.html
set CLASSPATH=%XALAN_HOME%/xalan.jar;%XALAN_HOME%/serializer.jar
@rem  - YAJL's json_reformat from https://github.com/lloyd/yajl has been compiled and is in the PATH

set done=false
set here=%~dp0

if /I [%1]==[/json] (
  set done=true
  for %%F in (%*) do (
    if /I [%%F]==[/json] (
      rem skip /json
    ) else if exist "%%F" (
      call :process "%%F" /JSON
    ) else (
      echo Couldn't find %%F
    )
  )
) else (
  for %%F in ("%here%..\vocabularies\*.xml") do (
    if /I [%~n1]==[%%~nF] (
      set done=true
      call :process "%%F" 
    ) else if /I [Org.OData.%1.V1]==[%%~nF] (
      set done=true
      call :process "%%F"
    ) else if [%1]==[] (
      set done=true
      call :process "%%F"
    )
  )
)

if %done%==false (
  echo Don't know how to %~n0 %1
  echo:
  echo Usage: transform [/JSON] [FILE]...
)

endlocal
exit /b


:process
  echo %~n1
  set FILENAME=%~dpn1

  if not "%2" == "/JSON" (
    java.exe org.apache.xalan.xslt.Process -L -XSL "%here%Vocab-to-MarkDown.xsl" -IN %1 -OUT "%FILENAME%.md"
    git.exe -C %~dp1 --no-pager diff --color-words="[^[:space:]]|^(#L[0-9]+)" "%FILENAME%.md" 2>nul
  )

  java.exe org.apache.xalan.xslt.Process -L -XSL "%here%V4-CSDL-normalize-Target.xsl" -IN %1 -OUT "%FILENAME%.normalized.xml"
  java.exe org.apache.xalan.xslt.Process -L -XSL "%here%V4-CSDL-to-JSON.xsl" -IN "%FILENAME%.normalized.xml" -OUT "%FILENAME%.tmp.json"
  json_reformat.exe < "%FILENAME%.tmp.json" > "%FILENAME%.json"
  if not errorlevel 1 (
    del "%FILENAME%.normalized.xml" "%FILENAME%.tmp.json"
    git.exe -C %~dp1 --no-pager diff "%FILENAME%.json"  2>nul
  )

exit /b