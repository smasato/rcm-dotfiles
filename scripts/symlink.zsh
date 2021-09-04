#!/usr/local/bin/zsh

# coreutils required
if [ ! -d /usr/local/opt/coreutils ]; then
    echo "coreutils required run: brew install coreutils"

    exit 1
fi

if [ "$1" = "link" ]; then
    # zsh files
    ln -s $(readlink -f ./zsh/.zshrc) ~/.zshrc && echo "linked ./zsh/.zshrc"
    ln -s $(readlink -f ./zsh/.p10k.zsh) ~/.p10k.zsh && echo "linked ./zsh/.p10k.zsh"

    # tmux files
    ln -s $(readlink -f ./tmux/.tmux.conf) ~/.tmux.conf && echo "linked ./tmux/.tmux.conf"

    # git files
    ln -s $(readlink -f ./git/.gitconfig) ~/.gitconfig && echo "linked ./git/.gitconfig"
    ln -s $(readlink -f ./git/.gitignore_global) ~/.gitignore_global && echo "linked ./git/.gitignore_global"

    exit 0
fi

if [ "$1" = "unlink" ]; then
    # zsh files
    unlink ~/.zshrc && echo "unlinked ~/.zshrc"
    unlink ~/.p10k.zsh && echo "unlinked ~/.p10k.zsh"

    # tmux files
    unlink ~/.tmux.conf && echo "unlinked ~/.tmux.conf"

    #  git files
    unlink ~/.gitconfig && echo "unlinked ~/.gitconfig"
    unlink ~/.gitignore_global && echo "unlinked ~/.gitignore_global"

    exit 0
fi
