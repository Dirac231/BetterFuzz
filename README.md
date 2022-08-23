## What is this?
BetterFuzz is a collection of functions that i regularly use to fuzz endpoints and files. If you have headaches with filtering, syntaxes, and wordlists, this is for you.

## How to use?
You can simply call the functions against the base URL like this (notice the slash at the end). You can put them in your ```.zshrc``` file or equivalent for ease of use.

```bash
dirfuzz [URL/PATH/]

filefuzz [URL/PATH/]

apifuzz [URL/PATH/]
```
Moreover, you will need to install the ```seclists``` project and download some extra wordlists that i put in the respository
