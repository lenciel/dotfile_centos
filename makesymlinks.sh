#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dot_files
############################

########## Variables

dir=~/dot_files                    # dotfiles directory
olddir=~/dot_files_old             # old dotfiles backup directory
files="aliases bashrc zshrc private"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dot_files directory specified in $files
for file in $files; do
    echo "Moving any existing $file from ~ to $olddir"
    mv ~/.$file ~/dot_files_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

