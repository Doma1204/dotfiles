function zshGitClone() {
    if [ ! -d $2 ]; then
        echo "Clone $1 to $2"
        git clone $1 $2
    fi
}

# iTerm2 beautiful interface
zshGitClone https://github.com/bhilburn/powerlevel9k.git /Users/lammanhei/.oh-my-zsh/custom/themes/powerlevel9k

# iTerm2 Color Scheme
zshGitClone https://github.com/mbadolato/iTerm2-Color-Schemes.git /Users/lammanhei/.oh-my-zsh/custom/iTerm2-Color-Schemes

# quickly open GitHub website
zshGitClone https://github.com/paulirish/git-open.git /Users/lammanhei/.oh-my-zsh/custom/plugins/git-open
