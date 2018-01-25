@echo off 
setlocal

@rem  This script uses Apache Xalan 2.7.1 as XSLT processor
@rem  For a description of Xalan command-line parameters see http://xalan.apache.org/old/xalan-j/commandline.html
@rem
@rem  Prerequisites
@rem  - Java SE 8 is installed and in the PATH - download from http://www.oracle.com/technetwork/java/javase/downloads/index.html 
@rem  - git is installed and in the PATH - download from https://git-for-windows.github.io/
@rem  - Eclipse is installed with Xalan (contained in Eclipse Web Tools Platform), and ECLIPSE_HOME environment variable is set
set CLASSPATH=%CLASSPATH%;%ECLIPSE_HOME%\plugins\org.apache.xml.serializer_2.7.1.v201005080400.jar;%ECLIPSE_HOME%\plugins\org.apache.xalan_2.7.1.v201005080400.jar
@rem  - YAJL's json_reformat from https://github.com/lloyd/yajl has been compiled and is in the PATH

set done=false

for %%F in (..\vocabularies\*.xml) do (
	if /I [%~n1]==[%%~nF] (
	  set done=true
		call :process %%F
	) else if /I [Org.OData.%1.V1]==[%%~nF] (
	  set done=true
		call :process %%F
	) else if [%1]==[] (
	  set done=true
		call :process %%F
	)
)

if %done%==false echo Don't know how to %~n0 %1

endlocal
exit /b


:process
  echo %~n1
  
  java.exe org.apache.xalan.xslt.Process -L -XSL Vocab-to-MarkDown.xsl -IN %1 -OUT ..\vocabularies\%~n1.md
  git.exe --no-pager diff --color-words="[^[:space:]]|^(#L[0-9]+)" ..\vocabularies\%~n1.md
  
  java.exe org.apache.xalan.xslt.Process -L -XSL V4-CSDL-normalize-Target.xsl -IN %1 -OUT %~n1.normalized.xml
  java.exe org.apache.xalan.xslt.Process -L -XSL V4-CSDL-to-JSON.xsl -IN %~n1.normalized.xml -OUT %~n1.json
  json_reformat.exe < %~n1.json > ..\vocabularies\%~n1.json
  if not errorlevel 1 (
    del %~n1.normalized.xml %~n1.json
    git.exe --no-pager diff ..\vocabularies\%~n1.json  
  )

exit /b