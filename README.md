Basis Source
============

Something like Spirit of Half-Life.


How to fork this without using GitHub's forking
-----------------------------------------------

```
# clone the repo
git clone --mirror https://github.com/tschumann/basis-source
cd basis-source
# push the checkout of Basis Source into a repo that you have created
git push --mirror https://github.com/you/repo
```

```
# clone your repo
git clone https://github.com/you/repo
# note that similar steps below in update.bat too
# create a new remote that points to Basis Source
git remote add basis https://github.com/tschumann/basis-source
# pull the latest changes from Basis Source
git pull basis master
```


Setting up local development
----------------------------

```
# clone the repo
git clone https://github.com/tschumann/basis-source
# create a new remote to link back to Valve's source-sdk-2013 repo
git remote add valve https://github.com/ValveSoftware/source-sdk-2013
# pull the latest changes from source-sdk-2013
git pull valve master
```


Compiling
---------

Windows
=======

Install `mp/src/vs2013.reg`

Generate the project files:
```
cd mp/src
./createallprojects.bat
```

Fix up the project files to work in a recent version of Visual Studio:
```
# change the ToolsVersion from 4.0 (Visual Studio 2010) to 15.0 (Visual Studio 2019)
grep -rl "ToolsVersion=\"4.0\"" --include "*.vcxproj" --include "*.vcxproj.filters" | grep -v thirdparty | xargs sed -i 's/ToolsVersion=\"4.0\"/ToolsVersion=\"15.0\"/g'
# add the latest WindowsTargetPlatformVersion to the project
grep -rl "</ProjectGuid>" --include "*.vcxproj" | grep -v thirdparty | xargs sed -i 's/<\/ProjectGuid>/<\/ProjectGuid>\n    <WindowsTargetPlatformVersion>10.0<\/WindowsTargetPlatformVersion>/g'
# add the PlatformToolset for Visual Studio 2019 to the project
grep -rl "</TargetName>" --include "*.vcxproj" | grep -v thirdparty | xargs sed -i 's/<\/TargetName>/<\/TargetName>\n    <PlatformToolset>v142<\/PlatformToolset>/g'
```

Open mp/src/everything.sln
