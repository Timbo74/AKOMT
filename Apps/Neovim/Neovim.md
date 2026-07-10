# Neovim

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

|Command|Description|
|---|---|
|``` . ```|repeat last change 1 time|
|``` #. ```|repeat last change # times|
|``` ~ ```|Toggle the case of the letter under the cursor|
|``` /{pattern}<CR> ```|search forward for the Nth occurrence of {pattern}|
|``` << ```|shift N lines one 'shiftwidth' leftwards|
|``` >> ```|shift N lines one 'shiftwidth' rightwards|
|``` $ ```|To the end of the line.  When a count is given also go [count - 1] lines downward, or as far is possible.|
|``` % ```|find the next (curly/square) bracket on this line and go to its match, or go to matching comment bracket, or go to matching preprocessor directive.|
|``` `( ```|cursor to the start of the current sentence|
|``` `) ```|cursor to the end of the current sentence|
|``` `{ ```|cursor to the start of the current paragraph|
|``` `} ```|cursor to the end of the current paragraph|
|``` e ```|cursor forward to the end of word N|
|``` o ```|begin a new line below the cursor and insert text, repeat N times|
|``` u ```|undo|
|``` g~~ ```|Switch case of current line.|
|``` g~{motion} ```|Switch case of {motion} text.|
|``` e ```||
|``` e ```||

### Visual Mode
|Command|Description|
|---|---|
|``` J ```|join the Highlighted lines|
|``` U ```|make highlighted area uppercase|
|``` u ```|make highlighted area lowercase|
|``` c ```|delete highlighted area and start insert|

### Visual Block Mode
Enter by pressing ```control + v``` or ```control + q```, typing the {commands} and then pressing ```<ESC>``` to complete the command.

|Command|Description|
|---|---|
|``` A ```|block mode: append same text in all lines, after the highlighted area|
|``` I ```|block mode: insert same text in all lines, before the highlighted area|

## Command Ranges

The ":substitute" command, and many other : commands, can be applied to a selection of lines.  This is called a range.

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

Now that you have done the work once, you can repeat the change by typing the command ```@a``` three times.

The ```@a``` command can be preceded by a count, which will cause the macro to be executed that number of times.

In this case you would type:

```
3@a
```

You might have the lines you want to change in various places.  Just move the cursor to each location and use the ```@a``` command.

If you have done that once, you can do it again with ```@@```.

