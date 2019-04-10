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

