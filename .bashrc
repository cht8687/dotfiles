[ -n "$PS1" ] && source ~/.bash_profile;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_COMMAND='ag -g ""'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/robert/Documents/work/hireslist/packages/best-places/node_modules/tabtab/.completions/serverless.bash ] && . /home/robert/Documents/work/hireslist/packages/best-places/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/robert/Documents/work/hireslist/packages/best-places/node_modules/tabtab/.completions/sls.bash ] && . /home/robert/Documents/work/hireslist/packages/best-places/node_modules/tabtab/.completions/sls.bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)

source ~/bin/tmuxinator.bash

# automatic nvm use
enter_directory() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  PREV_PWD=$PWD
  [[ -f ".nvmrc" ]] && nvm use
}

export PROMPT_COMMAND=enter_directory

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/robert/Documents/cht/javascript/packages/auth-challenge/node_modules/tabtab/.completions/slss.bash ] && . /Users/robert/Documents/cht/javascript/packages/auth-challenge/node_modules/tabtab/.completions/slss.bash