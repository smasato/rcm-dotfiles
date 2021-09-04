#!/usr/local/bin/zsh

# coreutils required
if [ ! -d /usr/local/opt/coreutils ]; then
    echo "coreutils required run: brew install coreutils"

    exit 1
fi

from=("./zsh/.zshrc" "./zsh/.p10k.zsh" "./tmux/.tmux.conf" "./git/.gitconfig" "./git/.gitignore_global" "./skhd/.skhdrc")
to=(".zshrc" '.p10k.zsh' '.tmux.conf' '.gitconfig' '.gitignore_global' '.skhdrc')

if [ "$1" = "link" ]; then
    from=("./zsh/.zshrc" "./zsh/.p10k.zsh" "./tmux/.tmux.conf" "./git/.gitconfig" "./git/.gitignore_global" "./skhd/.skhdrc")
    to=(".zshrc" '.p10k.zsh' '.tmux.conf' '.gitconfig' '.gitignore_global' '.skhdrc')

    if [ $#from -eq $#to ]; then
        for i in $(seq 1 $#to); do
            (ln -s $(readlink -f ${from[i]}) $HOME/${to[i]}) && echo linked $HOME/${to[i]}
        done
    fi

    exit 0
fi

if [ "$1" = "unlink" ]; then
    for i in $(seq 1 $#to); do
        unlink $HOME/${to[i]} && echo unlinked $HOME/${to[i]}
    done

    exit 0
fi
