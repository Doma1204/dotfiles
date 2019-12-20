brewInstall() {
	# if brew ls --versions $1 > /dev/null; then
	if brew ls --versions $1 &> /dev/null; then
		echo "$1 is installed"
		return 1
	else
		brew install $1
		return 0
	fi
}

caskInstall() {
	if brew cask ls --versions $1 &> /dev/null; then
		echo "$1 is installed"
	else
		brew cask install $1
	fi
}

# Check if Homebrew is installed and install if not
if test ! $(which brew); then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew is installed"
fi

# Install zsh and set as default shell
if brewInstall zsh; then
	echo "Setting up zsh environment"
	sudo sh -c "echo $(which zsh) >> /etc/shells"
	chsh -s $(which zsh)
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ln -s ./zshrc ~/.zshrc
fi

# Install Brew Package
brewInstall python
brewInstall tree # print the tree structure of current directory
brewInstall geckodriver
brewInstall ghostscript
brewInstall youtube-dl # download youtube videos
brewInstall you-get # download online videos
brewInstall ffmpeg
brewInstall htop # terminal activity monitor
brewInstall mas # mac app store terminal manager
brewInstall tldr # Too long, don't read: simplify version of 'man' command
tldr --update # update tldr
brewInstall neovim # Neovim
brewInstall nushell # a shell with good ls command
brewInstall blueutil # command line bluetooth utility
brewInstall lazygit # terminal UI for git

# Check if cask is installed adn install if not
if brew cask &> /dev/null; then
	echo "cask is installed"
else
	echo "Installing cask"
	brew tap caskroom/cask
	brew install brew-cask
fi

# Install Brew cask application
caskInstall google-chrome # browser
caskInstall firefox #browser
caskInstall iterm2 # alternative to macos default terminal
caskInstall visual-studio-code # vs code
caskInstall mactex # mac LaTex package
caskInstall iina # open source video viewer
caskInstall skim # PDF viewer and editor
caskInstall sourcetree # GitHub manager
caskInstall bartender # hide menu bar item
caskInstall keycastr # show keystroke pressed
# caskInstall anaconda # virtual python environment manager
caskInstall kite # python autocomplete engine
caskInstall station # all business app in one

# upgrade brew
brew upgrade
brew cask upgrade

# # clean up brew
brew cleanup
