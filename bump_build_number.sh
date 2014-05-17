#!/bin/sh

#########
#
# This script will increment the build number of the project by one on project
# build, but only if the project has changed since last increment
#
# Add this as a Run Script in XCode. You will need to make sure that this script
# is located in a /xcode-bump-build-number directory in your project root folder.
#
# ${PROJECT_DIR}/xcode-bump-build-number/bump_build_number.sh ${INFOPLIST_FILE}
#
#########

if [ $# -ne 1 ]; then
    echo usage: $0 plist-file
    exit 1
fi

plist="$1"
dir="$(dirname "$plist")"

# Only increment the build number if source files have changed
if [ -n "$(find "$dir" \! -path "*xcuserdata*" \! -path "*.git" -newer "$plist")" ]; then
    buildnum=$(/usr/libexec/Plistbuddy -c "Print CFBundleVersion" "$plist")
    if [ -z "$buildnum" ]; then
        echo "No build number in $plist"
        exit 2
    fi
    buildnum=$(expr $buildnum + 1)
    /usr/libexec/Plistbuddy -c "Set CFBundleVersion $buildnum" "$plist"
    echo "Incremented build number to $buildnum"
else
    echo "Not incrementing build number as source files have not changed"
fi
