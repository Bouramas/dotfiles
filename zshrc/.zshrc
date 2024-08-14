
# -------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------
alias qfind="find . -name "
alias cls="clear; ls"
alias lsa="ls -a"
alias clsa="clear; ls -a"
alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias vi="nvim"
alias weather="ansiweather -l Athens,gr -F -s true"
# HomeBrew Clean Up
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# OMILIA Aliases

# NLU Shortcuts
alias dockerdb-autocorrect="docker-compose exec mysql mysql -h mysql -u root -ppassword autocorrect_api"
alias dockerdb-fusion="docker-compose exec mysql mysql -h mysql -u root -ppassword fusion_nlu_service_api"
alias dockerdb-mlnlu="docker-compose exec mysql mysql -h mysql -u root -ppassword ml_nlu_service_api"
alias dockerdb-keycloak="docker-compose exec mysql mysql -h mysql -u root -ppassword keycloak"
alias dotest="docker-compose exec api make test"
alias dotestlocal="docker-compose exec api make local-test"

# Run Sonar-check
alias sonar="mvn clean install -DskipTests dependency-check:check sonar:sonar"

# Docker and Colima shortcuts
alias ds-ls="docker service ls"
alias ds-ps="docker service ps"
alias dcfusion="docker-compose up -d mysql redis docker_socket_proxy mlnlu rbnlu api-local"
alias dclogs="docker-compose logs -f"
alias dps="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}\""
alias colimup="colima start --cpu 4 --memory 11 --disk 130"

# Git shortcuts
alias prune="git remote prune origin"
alias git-board="git log --shortstat --pretty=\"%cE\" | sed 's/\(.*\)@.*/\1/' | grep -v \"^$\" | awk 'BEGIN { line=\"\"; } !/^ / { if (line==\"\" || !match(line, \$0)) {line = \$0 \",\" line }} /^ / { print line \" # \" \$0; line=\"\"}' | sort | sed -E 's/# //;s/ files? changed,//;s/([0-9]+) ([0-9]+ deletion)/\1 0 insertions\(+\), \2/;s/\(\+\)$/\(\+\), 0 deletions\(-\)/;s/insertions?\(\+\), //;s/ deletions?\(-\)//' | awk 'BEGIN {name=\"\"; files=0; insertions=0; deletions=0;} {if (\$1 != name && name != \"\") { print name \": \" files \" files changed, \" insertions \" insertions(+), \" deletions \" deletions(-), \" insertions-deletions \" net\"; files=0; insertions=0; deletions=0; name=\$1; } name=\$1; files+=\$2; insertions+=\$3; deletions+=\$4} END {print name \": \" files \" files changed, \" insertions \" insertions(+), \" deletions \" deletions(-), \" insertions-deletions \" net\";}'"


# Ngrok Proxying
alias ngrok="/Users/ybouramas/Desktop/utils/ngrok http 8080"

# GITK temporary fix for autorelease pool issue
alias gitk="sed -i .bak 's/zoomed/normal/g' ~/.config/git/gitk && /usr/local/bin/gitk"

# GoLand shortcut
alias goland="/usr/local/bin/goland"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# -------------------------------------------------------------------
# Functions
# -------------------------------------------------------------------
#
# Docker
#
dc-restart() {
    if [ $# -eq 0 ]; then
        echo "Please provide the service name."
    else
        docker-compose restart "$@"
    fi
}

dc-build() {
    if [ $# -eq 0 ]; then
        echo "Please provide the service name."
    else
        docker-compose up -d --build "$@"
    fi
}

ds-logs() {
    if [ $# -eq 0 ]; then
        echo "Please provide the service name."
    else
        docker service logs -f "$@"
    fi
}

dlogs() {
    if [ $# -eq 0 ]; then
        echo "Please provide the service name."
    else
        docker logs -f "$@"
    fi
}


#
# GIT 
#
ancestor() {
    git show-branch -a \
    | sed "s/].*//" \
    | grep "\*" \
    | grep -v "$(git rev-parse --abbrev-ref HEAD)" \
    | head -n1 \
    | sed "s/^.*\[//"
}

fixup() {
    local previous_commit=$(git rev-parse HEAD~0)
    git add .
    git commit --fixup="$previous_commit"
    local ancestor_branch=$(ancestor)
    git rebase -i $ancestor_branch --autosquash
}





# Add startship as the prompt
eval "$(starship init zsh)"
eval "$(tmuxifier init -)"
