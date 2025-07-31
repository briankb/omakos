#! /bin/bash

set -e

source ./scripts/utils.sh

step "Installing Homebrew packages from configs/Brewfile"
echo ""
echo "--------------------------------------------------------"
if [ "$INSTALL_CURSOR" = "false" ]; then
  grep -v '^cask "cursor"$' configs/Brewfile > /tmp/OmakosBrewfile
  brew bundle --file=/tmp/OmakosBrewfile
  rm /tmp/OmakosBrewfile
else
  brew bundle --file=configs/Brewfile
fi
echo "--------------------------------------------------------"
print_success "Homebrew packages installed!"