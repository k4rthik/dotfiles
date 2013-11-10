dotfiles
========

##Karthik's dotfiles

This is yet another dotfiles repository mostly customized for myself over the last 1-2 years. Some of the snippets are copied from other repositories, I  mentioned them in the comments of source files, Thanks to all who open sourced their configurations.

Overview:

* Support for perl, python using Emacs
* A lot of aliases, decent tmux conf
* Seperate work related stuff ( I find it painful to seperate them later when needed )
* Script to install few utils using brew on OS X
 
### Install

```
$ bash < <( curl https://raw.github.com/k4rthik/dotfiles/master/bootstrap.sh )

```
This will backup any file that already exists, nothing will be
overridden.

To update:
```
$ ~/.dotfiles/bootstrap.sh
```









