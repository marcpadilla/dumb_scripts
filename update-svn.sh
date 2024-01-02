#!/bin/zsh

# Check if a directory argument was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <base-directory>"
    exit 1
fi

# Assign the base directory to a variable
BASE_DIR=$1

# Enable globbing to include hidden directories
setopt EXTENDED_GLOB

# Prompt for SVN credentials
read "svnUser?Enter your SVN username: "
echo -n "Enter your SVN password: "
read -s svnPass
echo

# Change to the specified base directory
cd "$BASE_DIR" || exit

# Recursively find and update SVN repositories
for dir in **/.svn(/); do
    svnDir=${dir:h}
    echo "Updating SVN in $svnDir"
    svn update "$svnDir" --username $svnUser --password $svnPass --no-auth-cache
done

echo "All SVN repositories updated."
