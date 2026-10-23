# Neovim

which key plugin

## Editing Modes

### Normal Mode
The default state upon opening a file. Keys act as navigation and editing commands rather than text input. Use h, j, k, l to move, x to delete a character, and yy to copy a line.

### Insert Mode
Used to type and edit text just like a standard text editor. Triggered by pressing i (insert before cursor) or a (append after cursor).

### Visual Mode
Used to select text for bulk manipulation. Press v for character-wise, V for line-wise, or Ctrl+v for block-wise selection, then apply commands like d (delete) or y (yank).

### Command-Line (Cmdline) Mode
Activated by typing : in Normal Mode. This opens an input bar at the bottom of the screen to execute ex commands, file writes (:w), or searches.

## Commands

**Reference:**
 - https://neovim.io/doc/user/vimindex/
 - https://neovim.io/doc/user/motion/

This is an overview of the most commonly used commands for each mode, full a list of all commands please refer to the url above. 

### Insert Mode


### Normal Mode
* ``` . ``` repeat last change 1 time
* ``` #. ``` repeat last change # times

- ``` << ``` shift N lines one 'shiftwidth' leftwards.
- ``` >> ``` shift N lines one 'shiftwidth' rightwards.

* ``` 0 ``` move to the start of the line.
* ``` ^ ``` move to the first character on the line.
* ``` $ # ``` move to the end of the line.  When a count is given also go [count - 1] lines downward, or as far is possible.
* ``` % ``` find the next (curly/square) bracket on this line and go to its match, or go to matching comment bracket, or go to matching preprocessor directive.
* ``` `( ``` cursor to the start of the current sentence.
* ``` `) ``` cursor to the end of the current sentence.
* ``` `{ ``` cursor to the start of the current paragraph.
* ``` `} ``` cursor to the end of the current paragraph.
* ``` e ``` cursor forward to the end of word N.

+ ``` i ``` insert mode, before the cursor.
+ ``` a ``` insert mode, after the cursor.
+ ``` o ``` begin a new line below the cursor and insert text, repeat N times.

* ``` u ``` undo.

- ``` ~ ``` toggle the case of the letter under the cursor.
- ``` g~~ ``` switch case of current line.
- ``` g~{motion} ``` switch case of {motion} text.

* ``` e ```
* ``` e ```

#### Deleting Text
##### Character & Word Deletions
* ``` x ``` deletes the single character under the cursor.
* ``` X ``` deletes the single character before the cursor.
* ``` dw ``` deletes from the cursor to the start of the next word.
* ``` diw ``` deletes the entire word under the cursor ("delete inner word").
* ``` daw ``` deletes the word and its surrounding space ("delete a word").

##### Line & Text Block Deletions
* ```dd``` deletes the entire current line.
* ```D``` or ```d$``` deletes from the cursor to the end of the line.
* ```d0``` deletes from the cursor back to the start of the line.
* ```dk``` deletes the current line and the line above it.

##### Code Structure Deletions (Surroundings)
* ```di(``` or ```di{``` deletes everything inside the parentheses or curly brackets.
* ```da(``` or ```da{``` deletes the brackets and everything inside them.
* ```di"``` deletes everything inside the double quotes.

##### Combining with Numbers (Multipliers)
You can prefix almost any command with a number to repeat it:

* ```3dd``` deletes 3 lines.
* ```5dw``` deletes 5 words.


#### Search for Text
##### Basic Document Search

* ``` /pattern<cr> ``` searches forward for "pattern".
* ``` ?pattern ``` searches backward for "pattern".
* ``` n ``` jumps to the next match in the direction of your search.
* ``` N ``` jumps to the previous match in the opposite direction.

##### Search Word Under Cursor

* ``` * ``` searches forward for the exact word currently under your cursor.
* ``` # ``` searches backward for the exact word currently under your cursor.

##### Current Line Character Finding

* ``` fx ``` jumps forward to the next occurrence of character x on the current line.
* ``` Fx ``` jumps backward to the previous occurrence of character x.
* ``` tx ``` jumps forward till just before character x.
* ``` Tx ``` jumps backward till just after character x.
* ``` ; ``` repeats the last line-find command (f, F, t, or T) forward.
* ``` , ``` repeats the last line-find command backward.

##### Helpful Search Settings
To make these shortcuts better, add these to your ```init.lua``` or ```init.vim```:

* ``` :set incsearch ``` highlights matches instantly as you type your search.
* ``` :set hlsearch ``` keeps matches highlighted after you press Enter (use ``` :noh ``` to clear highlights).
* ``` :set ignorecase smartcase ``` searches case-insensitively, unless you type a capital letter.

#### Replace/Substitute text
To replace text on the current line:

```
# Finds the first occurance of string-to-find on this line and replaces it with string-to-replace.
:substitute/string-to-find/string-to-replace

# Finds all occurances of string-to-find on this line and replaces them with string-to-replace.
:substitute/string-to-find/string-to-replace/g
```

To replace text on all lines replace ```:substitute``` with ```:%substitute```: 
```
# Finds the first occurance of string-to-find on all lines and replaces it with string-to-replace.
:%substitute/string-to-find/string-to-replace

# Finds all occurances of string-to-find on all lines and  replaces them with string-to-replace.
:%substitute/string-to-find/string-to-replace/g
```

Some search terms may need be escaped with a ``` \ ``` character to treat the special characters as literal text.

```
:%substitute/ - /\[ ]/g
```

### Visual Mode
* ``` J ``` join the Highlighted lines.
* ``` U ``` make highlighted area uppercase.
* ``` u ``` make highlighted area lowercase.
* ``` c ``` delete highlighted area and start insert.

### Visual Block Mode
Enter by pressing ``` control + v ``` or ``` control + q ```, typing the {commands} and then pressing ```<ESC>``` to complete the command.

* ``` A ``` block mode: append same text in all lines, after the highlighted area.
* ``` I ``` block mode: insert same text in all lines, before the highlighted area.

## Command Ranges

The ```:substitute``` command, and many other : commands, can be applied to a selection of lines.  This is called a range.

The simple form of a range is ```{number},{number}```.  For example:

```
:1,5s/this/that/g
```

Executes the substitute command on the lines 1 to 5.  Line 5 is included.  The range is always placed before the command.

A single number can be used to address one specific line:

```
:54s/President/Fool/
```

Some commands work on the whole file when you do not specify a range.  To make them work on the current line the "." address is used.  The ":write" command works like that.  Without a range, it writes the whole file.  To make it write only the current line into a file:

```
:.write otherfile
```

The first line always has number one.  How about the last line?  The "$" character is used for this.  For example, to substitute in the lines from the cursor to the end:

```
:.,$s/yes/no/
```

### Visual Mode and Ranges
You can select text with Visual mode.  If you then press ":" to start a colon command, you will see this:

```
:'<,'>
```

Now you can type the command and it will be applied to the range of lines that was visually selected.
	Note:
	When using Visual mode to select part of a line, or using CTRL-V to
	select a block of text, the colon commands will still apply to whole
	lines.  This might change in a future version of Vim.

The '< and '> are actually marks, placed at the start and end of the Visual selection.  The marks remain at their position until another Visual selection is made.  Thus you can use the "'<" command to jump to position where the Visual area started.  And you can mix the marks with other items:

```
:'>,$
```

This addresses the lines from the end of the Visual area to the end of the file.

### A Number of Lines
When you know how many lines you want to change, you can type the number and then ":".  For example, when you type "5:", you will get:

```
:.,.+4
```

Now you can type the command you want to use.  It will use the range "." (current line) until ".+4" (four lines down).  Thus it spans five lines.

See also :range, for an overview of all possible ways to specify a range.

## Macros

**Reference:**
 - https://neovim.io/doc/user/usr_10/

### Record and playback commands

There are three steps:

1. The ```q{register}``` command starts recording keystrokes into the register named {register}. The register name must be between a and z.
1. Type your commands.
1. To finish recording, press ```q``` (without any extra character).

You can now execute the macro by typing the command ```@{register}```.

The ```@a``` command can be preceded by a count, which will cause the macro to be executed that number of times.

In this case you would type:

```
3@a
```

You might have the lines you want to change in various places.  Just move the cursor to each location and use the ```@a``` command.

If you have done that once, you can do it again with ```@@```.

