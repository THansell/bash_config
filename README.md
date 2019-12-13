# bash_functions-
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
into ~/.bash_functions.
The put the code above at the end of your ~/.bashrc file.

The files in the stockpile folder are groups of bash functions organized by use.
If you want to active those functions copy them from stockpile to the root of the .bash_functions directory.
