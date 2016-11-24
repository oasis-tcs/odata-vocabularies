@echo off 
setlocal

@rem XSLT command-line see https://xml.apache.org/xalan-j/commandline.html

set CLASSPATH=%CLASSPATH%;C:\eclipse-Neon\plugins\org.apache.xml.serializer_2.7.1.v201005080400.jar;C:\eclipse-Neon\plugins\org.apache.xalan_2.7.1.v201005080400.jar
set done=false

for %%F in (..\vocabularies\*.xml) do (
  echo %%~nF
  java.exe org.apache.xalan.xslt.Process -XSL Vocab-to-MarkDown.xsl -IN %%F -OUT ..\vocabularies\%%~nF.md
  git.exe --no-pager diff ..\vocabularies\%%~nF.md
)

endlocal
exit /b