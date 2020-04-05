# Basic Commands \(Terminal\)

## 

## Basic moves

* Move back one character. `Ctrl` + `b`
* Move forward one character. `Ctrl` + `f`
* Delete current character. `Ctrl` + `d`
* Delete previous character. `Backspace`
* Undo. `Ctrl` + `-`

## Moving faster

* Move to the start of line. `Ctrl` + `a`
* Move to the end of line. `Ctrl` + `e`
* Move forward a word. `Meta` + `f` _\(a word contains alphabets and digits, no symbols\)_
* Move backward a word. `Meta` + `b`
* Clear the screen. `Ctrl` + `l`

**What is Meta?** `Meta` is your `Alt` key, normally. For **Mac OSX user, you need to enable it yourself**. Open _Terminal &gt; Preferences &gt; Settings &gt; Keyboard_, and enable _Use option as meta key_. `Meta` key, by convention, is used for operations on word.

## Cut and paste \(‘Kill and yank’ for old schoolers\)

* Cut from cursor to the end of line. `Ctrl` + `k`
* Cut from cursor to the end of word. `Meta` + `d`
* Cut from cursor to the start of word. `Meta` + `Backspace`
* Cut from cursor to previous whitespace. `Ctrl` + `w`
* Paste the last cut text. `Ctrl` + `y`
* Loop through and paste previously cut text. `Meta` + `y` \(use it after `Ctrl` + `y`\)
* Loop through and paste the last argument of previous commands. `Meta` + `.`

## Search the command history

* Search as you type. `Ctrl` + `r` and type the search term; Repeat `Ctrl` + `r` to loop through results.
* Search the last remembered search term. `Ctrl` + `r` twice.
* End the search at current history entry. `Ctrl` + `j`
* Cancel the search and restore original line. `Ctrl` + `g`

## Commands for Navigation:

* `pwd` - \(path working directory\) shows you in what directory you are
* `ls` - \(list files in current pwd\) this one is probably the most useful one. There are many ways to customize it \(with flags\), the most common for me might be `ls -lha` which means, list all the files \(including the hidden ones\) in a column and add info about them \(size, etc in human readable form\).
* `ls -lhad */` - lists only folders \(with all their attributes\).
* `cat` - displays/outputs the contents of the file. It is useful for reading a file very quickly, but if the file is long you might want to do `head` or `tail` which only displays the first or last lines of the file.
* `man` - \(manual\) do `man` and some command to get the manual for that command. Very useful to know the specific flags for certain commands.
* `cd` - change directory. You can also do `cd ...` to move one up or `cd ../..` to move two up \(etc\).
* `clear` - clears the terminal screen.
* `cd -` - goest to last path.
* `~` - goes to home directory.
* `df -h` - displays free disk space.
* `du -sh` - displays disk usage \(the flag `s` is for summarized form\).
* `du -sh *` - displays the disk usage for every folder or file in that location.
* To create a text file with the size of folders and subfolders do `du -hd 3 * > 00_File_and_Folder_Size.txt`. The `du` is disk usage, the flag `h` means human readable and the `d 3` means with a depth of 3 \(folders\), and the `*` means all folders and files there.
* Another option is to do `du -s * | sort -n` which will sort the results based on the size from smallest to largest.
* arrow up or arrow down, brings up the last commands. Space bar to go to next page.
* `history` - View history of commands ran in terminal
  * `rm ~/.bash_history && history -c` - To clear the history, delete the file and clear the temp history

## Commands to manage files and folders

* `mkdir` - makes a directory.
* `touch` - creates a blank file.
* `echo` - prints line \(ie. `echo "hello world!"`\).
* `>` - appends a line to a file \(ie. `echo "hello world!" > text.txt`\). **Careful, this command overwrites what's in the file.**
* `>>` - appends to the end of the file \(safer\).
* `history | less` - history and "pipe", less is a paginator. To get out of this just press `q`.
* `cp` - copy. **Careful, it overwrites.**
* `cp -i` - copy with warning. `-i` means "ask for confirmation".
* `mv` - move **Careful, it overwrites.**
* `rm` - remove **Careful, it destroys.** \(ie. `rm -ri` to remove recursive and with warning, for example if you want to remove a directory and its contents.\)
  * `rm -r mydir` - To remove a directory that contains other files or directories
* `-i` - ask for confirmation.
* `.` - the dot means here, for example when you are copying something to your current location.
* `locate` - finds a file.
* `srm -rmzv` - secure removes files or folders with `m` medium grade \(7 pass DoD compliant\), `z` zero data. If you want to avoid the confirmations add the flag `f` \(force\).
* You can join multiple files with `cat`. For example: `cat file1.txt file2.txt file3.txt > file4.txt`.
* `zip -r foo.zip foo` - zips foo into the foo.zip file.
* `unzip \*.zip` - unzips multiple files.





## 

