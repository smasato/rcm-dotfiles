#!/usr/local/bin/zsh

zparseopts -E -D -- \
    -skhd=o_skhd

# coreutils required
if [ ! -d /usr/local/opt/coreutils ]; then
    echo "coreutils required run: brew install coreutils"

    exit 1
fi

from=("./zsh/.zshrc" "./zsh/.p10k.zsh" "./tmux/.tmux.conf" "./git/.gitconfig" "./git/.gitignore_global" "./alacritty/alacritty.yml")
to=(".zshrc" '.p10k.zsh' '.tmux.conf' '.gitconfig' '.gitignore_global' '.config/alacritty/alacritty.yml')

if [ "$1" = "link" ]; then
    if [ $#from -eq $#to ]; then
        for i in $(seq 1 $#to); do
            (ln -s $(readlink -f ${from[i]}) $HOME/${to[i]}) && echo linked $HOME/${to[i]}
        done
    fi

    if [[ "$o_skhd" ]]; then
        ln -s $(readlink -f ./skhd/.skhdrc) ~/.skhdrc && echo "linked $HOME/.skhdrc"
    fi

    exit 0
fi

if [ "$1" = "unlink" ]; then
    for i in $(seq 1 $#to); do
        unlink $HOME/${to[i]} && echo unlinked $HOME/${to[i]}
    done

    if [[ "$o_skhd" ]]; then
        unlink ~/.skhdrc && echo "unlinked $HOME/.skhdrc"
    fi

    exit 0
fi
