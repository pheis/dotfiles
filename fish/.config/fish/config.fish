if status is-interactive
    # Commands to run in interactive sessions can go here
    # Colorscheme: Tomorrow Night Bright
    set -U fish_color_normal normal
    set -U fish_color_command c397d8
    set -U fish_color_quote b9ca4a
    set -U fish_color_redirection 70c0b1
    set -U fish_color_end c397d8
    set -U fish_color_error d54e53
    set -U fish_color_param 7aa6da
    set -U fish_color_comment e7c547
    set -U fish_color_match --background=brblue
    set -U fish_color_selection white --bold --background=brblack
    set -U fish_color_search_match bryellow --background=brblack
    set -U fish_color_history_current --bold
    set -U fish_color_operator 00a6b2
    set -U fish_color_escape 00a6b2
    set -U fish_color_cwd green
    set -U fish_color_cwd_root red
    set -U fish_color_valid_path --underline
    set -U fish_color_autosuggestion 969896
    set -U fish_color_user brgreen
    set -U fish_color_host normal
    set -U fish_color_cancel --reverse
    set -U fish_pager_color_prefix normal --bold --underline
    set -U fish_pager_color_progress brwhite --background=cyan
    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description B3A06D
    set -U fish_pager_color_selected_background --background=brblack
end

set fish_greeting

abbr -a -U -- f fuck
abbr -a -U -- g git
abbr -a -U -- gs 'git status'
abbr -a -U -- ls exa
abbr -a -U -- p python3
abbr -a -U -- t tmux
abbr -a -U -- v nvim
abbr -a -U -- lg lazygit

direnv hook fish | source
zoxide init fish | source
thefuck --alias | source
starship init fish | source
