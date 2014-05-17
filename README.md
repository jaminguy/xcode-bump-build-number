xcode-tools v0.1
================

    bump_build_number.sh

This script will increment the build number of the project by one on project build, but only if the project has changed since last increment.

1. Go to the project source root folder in Terminal and type the following commands:

```
git submodule add https://github.com/jaminguy/xcode-tools.git

cd xcode-tools && chmod 744 bump_build_number.sh
```

2. Add this as a Run Script in XCode Project -> Build Phases. You will need to make sure that this script is located in a /xcode-tools directory in your project root folder (See step 1).

```
${PROJECT_DIR}/xcode-tools/bump_build_number.sh ${INFOPLIST_FILE}
```

![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Increment Build Number")
