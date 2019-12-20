# Check if Homebrew is installed and install if not
if test ! $(which brew); then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew is installed"
fi

brew tap ArmMbed/homebrew-formulae
brew install arm-none-eabi-gcc
brew install openocd
brew install cmake
brew install ninja