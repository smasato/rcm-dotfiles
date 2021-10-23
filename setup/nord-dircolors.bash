#!/bin/bash

ghq get https://github.com/arcticicestudio/nord-dircolors.git
cd $HOME/ghq/github.com/arcticicestudio/nord-dircolors
ln -sr "$PWD/src/dir_colors" ~/.dir_colors
