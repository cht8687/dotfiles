[ -n "$PS1" ] && source ~/.bash_profile;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/robert/Documents/work/hireslist/packages/best-places/node_modules/tabtab/.completions/serverless.bash ] && . /home/robert/Documents/work/hireslist/packages/best-places/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/robert/Documents/work/hireslist/packages/best-places/node_modules/tabtab/.completions/sls.bash ] && . /home/robert/Documents/work/hireslist/packages/best-places/node_modules/tabtab/.completions/sls.bash