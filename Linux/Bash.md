# .bashrc
## alias
```
alias cls=clear
```
## case conditional
```
case "$VARIABLE" in
    pattern1)
        # Commands to execute if pattern1 matches
        ;;
    pattern2|pattern3)
        # Commands to execute if pattern2 OR pattern3 matches
        ;;
    *)
        # Default case (wildcard) if no other pattern matches
        ;;
esac
```

## if conditional
```
if [[ condition1 ]]; then
    # runs if condition1 is true
elif [[ condition2 ]]; then
    # runs if condition2 is true
else
    # runs if all above are false
fi
```
### Comparison Operators
| Category | Operator | Description |
| -------- | -------- | ----------- |
| Numbers  | `-eq` / `-ne` | Equal / Not equal |
|          | `-gt` / `-lt` | Greater than / Less than |
| Strings  | `==` / `!=`   | Equal / Not equal |
|          | `-z`          | String is empty |
| Files    | `-f`          | Exists and is a regular file |
|          | `-d`          | Exists and is a directory |

More comparison operator [information here](https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html).

#### Examples
Checking that a file exists before sourcing it.
```
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi
```

#### Important Tips
 - **Spacing**: You must have spaces between the brackets and the condition (e.g., `[[ $var == "val" ]])` or the script will fail.
 - **Double Brackets**: Use `[[ ... ]]` instead of single `[ ... ]` in modern Bash scripts for better string handling and fewer errors.
 - **Arithmetic**: For purely numeric math comparisons, you can use double parentheses `(( ))`, which allows for standard math symbols like `>` or `==`.

## functions
```
docker-bounce-follow() {
  docker-bounce
  docker logs $1 --follow
}
```

# Environment Variables

## export
```
```

## printenv
```
printenv
printenv VARIABLE_NAME
```
The most standard way to list environment variables. Running it without arguments displays all variables; you can also use printenv VARIABLE_NAME to see a specific one.

## env
```
env
```
Similarly lists all exported environment variables. It is often used to run a program in a modified environment, but alone it acts as a viewer.

## set
```
set
```
Lists all variables, including environment variables, local shell variables, and shell functions.

## declare
```
declare -p
```
Lists all variables in a format that shows how they were defined

# Command History

## Search bash based on typed command
```
CTRL+A ... (copy to the beginning of the line)
CTRL+R ... (start a reverse search)
CTRL+Y ... (paste the copied line)
CTRL+R ... (keep searching or)
CTRL+S ... (search in the other direction*)
```

Note: CTRL+S will suspend your terminal unless you explicitly revoked this behavior with

```bash
[[ $- == *i* ]] && stty -ixon
```

in your .bashrc

_Last updated: 13/8/2026_
