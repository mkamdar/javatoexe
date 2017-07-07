# Javatoexe
Creating exe from java

This is a small sample that would help you create an exe from java jar file.

# Execute.nsi

execute.nsi script is for executing the jar file. 
It also finds the installed JRE and executes the runnable jar file
<code> java -jar <jarfilename.jar> </code>

# Installer.nsi

Installer.nsi creates installer and uninstaller.


# Getting started:

1. Install NSIS (Nullsoft Scriptable Install System) 
   Download: http://nsis.sourceforge.net/Download
2. Modify the scripts to match you emvironments(Filepaths, jarfilenames etc)
3. compile the scripts using nsis compiler
