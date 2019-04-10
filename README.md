# bash_functions
Place to keep trackp of useful bash functions I write

place these lines of code at the end of the ~/.bashrc

```bash
if [ -d ~/.bash_functions ]; then
    for file in $(ls ~/.bash_functions/*.functions); do
        . $file;
    done
fi
```

## How to use this repo

For ease of use, and of capturing changes and tracking versions with git, clone this repo
into ~/.bash_functions.
The put the code above at the end of your ~/.bashrc file.

The files in the disabled folders are groups of bash functions organized by use.
If you want to active those functions copy then from disabled to the root of the .bash_functions directory.
