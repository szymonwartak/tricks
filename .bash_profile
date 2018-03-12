# git branch in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# sync files to remote
fn_rsync() {
        dir=$(pwd | rev | cut -d / -f 1 | rev)
        echo "syncing $(pwd) with beast:/home/szymon.wartak/$dir"
        rsync --exclude=.git -r . beast:/home/szymon.wartak/$dir
}
alias dsync=fn_rsync
