#!/bin/bash

set -eu

cd $(dirname "${BASH_SOURCE[0]}")

# TODO: is this right? might be better to check for Linux as Git Bash on Windows gives MINGW64_NT-10.0-19043
if [[ $(uname) == *"NT-"* ]]; then
	find . -name "*.vcxproj" -not -wholename "*/thirdparty/*" -type f -delete
	find . -name "*.vcxproj.filters" -not -wholename "*/thirdparty/*" -type f -delete

	# TODO: need to run this first to actually generate everything.sln for some reason
	./createallprojects.bat
	devtools/bin/vpc.exe /f /hl2 /episodic +everything /mksln everything.sln

	# change the ToolsVersion from 4.0 (Visual Studio 2010) to 15.0 (Visual Studio 2019)
	grep -rl "ToolsVersion=\"4.0\"" --include "*.vcxproj" --include "*.vcxproj.filters" | grep -v thirdparty | xargs sed -i 's/ToolsVersion=\"4.0\"/ToolsVersion=\"15.0\"/g'
	# add the latest WindowsTargetPlatformVersion to the project
	grep -rl "</ProjectGuid>" --include "*.vcxproj" | grep -v thirdparty | xargs sed -i 's/<\/ProjectGuid>/<\/ProjectGuid>\n    <WindowsTargetPlatformVersion>10.0<\/WindowsTargetPlatformVersion>/g'
	# add the PlatformToolset for Visual Studio 2019 to the project
	grep -rl "</TargetName>" --include "*.vcxproj" | grep -v thirdparty | xargs sed -i 's/<\/TargetName>/<\/TargetName>\n    <PlatformToolset>v142<\/PlatformToolset>/g'
	# get rid of any old PlatformToolset lines
	grep -rl "<PlatformToolset>" --include "*.vcxproj" | grep -v thirdparty | xargs sed -i '/<PlatformToolset>v120_xp<\/PlatformToolset>/d'
elif [[ $(uname) == "Linux" ]]; then
	devtools/bin/vpc /hl2 /episodic +everything /mksln everything
fi
