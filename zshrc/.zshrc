
# -------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------

export COLORTERM="truecolor"
export TERM="xterm-256color"

# M1/M2/M3/M4 Mac
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/opt/homebrew/sbin"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH=$PATH:/System/Volumes/Data/Users/ybouramas/Code/ssm_connect



alias vi="nvim"
# HomeBrew Clean Up
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# zsh completions
fpath=(path/to/zsh-completions/src $fpath)

autoload -U compinit; compinit
source ~/Code/fzf-tab/fzf-tab.plugin.zsh

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS:-}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'


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
alias dcfusion="docker-compose up -d mysql redis docker_socket_proxy mlnlu rbnlu api-local"
alias dps="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}\""
alias colimup="colima start --cpu 4 --memory 11 --disk 130"

# Git shortcuts
alias prune="git remote prune origin"
alias git-board="git log --shortstat --pretty=\"%cE\" | sed 's/\(.*\)@.*/\1/' | grep -v \"^$\" | awk 'BEGIN { line=\"\"; } !/^ / { if (line==\"\" || !match(line, \$0)) {line = \$0 \",\" line }} /^ / { print line \" # \" \$0; line=\"\"}' | sort | sed -E 's/# //;s/ files? changed,//;s/([0-9]+) ([0-9]+ deletion)/\1 0 insertions\(+\), \2/;s/\(\+\)$/\(\+\), 0 deletions\(-\)/;s/insertions?\(\+\), //;s/ deletions?\(-\)//' | awk 'BEGIN {name=\"\"; files=0; insertions=0; deletions=0;} {if (\$1 != name && name != \"\") { print name \": \" files \" files changed, \" insertions \" insertions(+), \" deletions \" deletions(-), \" insertions-deletions \" net\"; files=0; insertions=0; deletions=0; name=\$1; } name=\$1; files+=\$2; insertions+=\$3; deletions+=\$4} END {print name \": \" files \" files changed, \" insertions \" insertions(+), \" deletions \" deletions(-), \" insertions-deletions \" net\";}'"

# GoLand shortcut
alias goland="/usr/local/bin/goland"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


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

alias gitc="git branch | fzf --preview 'git show --color=always {-1}' --bind 'enter:become(git checkout {-1})' --height 40% --layout reverse"

plugins=( git zsh-syntax-highlighting zsh-autosuggestions )
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add startship as the prompt
eval "$(starship init zsh)"
eval "$(tmuxifier init -)"

eval "$(zoxide init --cmd cd zsh)"
export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity
export PATH="/Users/ybouramas/.antigravity/antigravity/bin:$PATH"

# Colima fix? 
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"


# Mise 
eval "$(mise activate zsh)"


source "$HOME/.cargo/env"
