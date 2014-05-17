xcode-bump-build-number v0.1
================

This script will increment the build number of the project by one on project build, but only if the project has changed since last increment. This is based on the StackOverflow discussion [here](http://stackoverflow.com/questions/9258344/better-way-of-incrementing-build-number).

1. Go to the project source root folder in Terminal and type the following command:

```
git submodule add https://github.com/jaminguy/xcode-bump-build-number.git
```

2. Add this as a Run Script in XCode Project -> Build Phases. You will need to make sure that this script is located in a /xcode-bump-build-number directory in your project root folder (See step 1).

```
${PROJECT_DIR}/xcode-bump-build-number/bump_build_number.sh ${INFOPLIST_FILE}
```

To use hex build numbers instead of integers use this Run Script command instead.

```
${PROJECT_DIR}/xcode-bump-build-number/bump_build_number_hex.sh ${INFOPLIST_FILE}
```

If you want to bump the build number only when Archiving then check the box labeled "Run script only when installing"

![alt text](https://github.com/jaminguy/xcode-tools/blob/master/XCode_RunScript_Screenshot.png?raw=true "Increment Build Number")
