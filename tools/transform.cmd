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
@rem  - YAJL's json_reformat from https://github.com/lloyd/yajl has been compiled and environment variable YAJL_REFORMAT set to its location
set YAJL_REFORMAT=c:\git\yajl\build\yajl-2.1.1\bin\json_reformat.exe

set done=false

for %%F in (..\vocabularies\*.xml) do (
  echo %%~nF
  java.exe org.apache.xalan.xslt.Process -XSL Vocab-to-MarkDown.xsl -L -IN %%F -OUT ..\vocabularies\%%~nF.md
  git.exe --no-pager diff ..\vocabularies\%%~nF.md
  
  java.exe org.apache.xalan.xslt.Process -XSL V4-CSDL-normalize-Target.xsl -L -IN %%F -OUT %%~nF.normalized.xml
  java.exe org.apache.xalan.xslt.Process -XSL V4-CSDL-to-JSON.xsl -L -IN %%~nF.normalized.xml -OUT %%~nF.json
  %YAJL_REFORMAT% < %%~nF.json > ..\vocabularies\%%~nF.json
  if not errorlevel 1 (
    del %%~nF.normalized.xml %%~nF.json
    git.exe --no-pager diff ..\vocabularies\%%~nF.json  
  )
)

endlocal
exit /b