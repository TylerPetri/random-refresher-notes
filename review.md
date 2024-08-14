cat to see
cat asdf.txt > fda.txt replaces all
">>" appends
"<" outputs to command
grep is search
grep -R
"|" is pipeline from output to something
* cat hockey.txt | sort
sed 's/snow/rain/g' test.txt
* substitutes snow with rain (all since /g)
* sed -i 's/LARRY/LAERTES/g' scene-3.txt (-i to actually make changes)
* sed is own massive thing

"source" to activate without relaunching
.bach_profile where all things
alias ll="ls -al"
alias p="pwd"
export $USER="Jane Doe"
export PS1=">> "

":" separates scripted path when echo $PATH

The less command is similar to cat, but is better adapted to handling larger files. It displays files in the terminal one page at a time.
* type q to quit

export LESS="-N"
env returns list of variables
env | grep LESS

windows cheatsheet: https://cmdref.net/os/windows/command/index.html#windows_commands_cheat_sheet


git diff
git log
git show HEAD
git checkout HEAD filename - brings back to before commit
* git diff (+bipboop), git checkout HEAD filename (restore to last commit)
git reset HEAD filename - removes from staging area
* doesnt discard file changes
git reset commit_SHA
* first 7: git reset 5d69206
git checkout -- filename (same as HEAD, shortcut)