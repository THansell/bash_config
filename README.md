# bash_functions
Place to keep track of useful bash functions I write

place these lines of code at the end of the ~/.bashrc

```bash
if [ -d ~/.bash_functions ]; then
  for file in $(ls ~/.bash_functions/*.functions); do
    source $file
  done
elif [ -f ~/.bash_functions ]; then
  source ~/.bash_functions
fi
````

## How to use this repo

For ease of use, and of capturing changes and tracking versions with git, clone this repo
into ~/tools/bash_config. Then 'cd ~/tools/bash_config' and run the script 'create_symlinks'

The files in the bash_functions stockpile folder are groups of bash functions organized by use.
If you want to activate those functions create a symbolic link from stockpile folder
to the bash_functions directory.

# bash_aliases

Your .bashrc file may already have something like this:
```bash
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

Which treats the .bash_aliases file as a regular file. To use the .bash_aliases as a directory you should
change the .bashrc file to the following:

```bash
if [ -d ~/.bash_aliases ]; then
  for file in $(ls ~/.bash_aliases); do
    source $file
  done
elif [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
````

