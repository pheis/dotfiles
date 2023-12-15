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

function goto_git_root
    cd $(git rev-parse --show-toplevel)
end

function create_git_worktree
    set worktree_name $argv[1]

    # Check if worktree name is provided
    if test -z $worktree_name
        echo "Please provide a name for the Git worktree."
        return 1
    end

    # Create the Git worktree in the parent directory
    set worktree_path "../$worktree_name"
    git worktree add $worktree_path

    # Optional: Switch to the new worktree directory
    cd $worktree_path
end

# LLVM 16 on Mac
if test (uname) = "Darwin"
    set -x LLVM_SYS_160_PREFIX (brew --prefix llvm@16)
end


abbr -a -- f fuck
abbr -a -- g git
abbr -a -- gs 'git status'
abbr -a -- ls eza
abbr -a -- p python3
abbr -a -- t tmux
abbr -a -- v nvim
abbr -a -- lg lazygit
abbr -a -- gr goto_git_root 

abbr -a -- gr goto_git_root 
abbr -a -- wta create_git_worktree

direnv hook fish | source
zoxide init fish | source
thefuck --alias | source
starship init fish | source

# opam configuration
source /Users/pyry.heiskanen/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

source /Users/pyry.heiskanen/.docker/init-fish.sh || true # Added by Docker Desktop
