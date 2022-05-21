if status is-interactive
    # Commands to run in interactive sessions can go here

end

set fish_greeting

abbr -a -U -- f fuck
abbr -a -U -- g git
abbr -a -U -- gs 'git status'
abbr -a -U -- ls exa
abbr -a -U -- p python3
abbr -a -U -- t tmux
abbr -a -U -- v nvim

direnv hook fish | source
zoxide init fish | source
thefuck --alias | source
starship init fish | source
