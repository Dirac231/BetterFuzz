## What is this?
BetterFuzz is a collection of functions that i regularly use to fuzz endpoints and files. If you have headaches with filtering, ffuf syntax, and wordlists, this is for you.

## How to use?
You need to have ```ffuf``` and ```seclists``` installed, after that you have to download the wordlists in the respository and copy them in the "Web-Content" folder of seclists. \
 \
The file ```Fuzz_Functions.sh``` contains the code for the fuzzers. You can simply call the functions against the base URL like this (notice the slash at the end).

```bash
dirfuzz [URL/PATH/]

filefuzz [URL/PATH/]

apifuzz [URL/PATH/]
```
You can put them in your ```.zshrc``` file or equivalent for ease of use.
