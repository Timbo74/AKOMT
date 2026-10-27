# Excel

## Formulas

## Cell References

### Dot Operator/Trim References
Depending on where you place the dot relative to the colon (:), it controls whether you strip blank spaces from the top (leading) or bottom (trailing) of your data:

|Syntax Example|What it doe|Best Used For...|
|---|---|---|
|```=A1:.A1000```|Trims Trailing Blanks|Tells Excel: "Go down to row 1000, but stop and cut off the range at the last filled cell."|Normal lists that grow downward over time.|
|```=A1.:A1000```|Trims Leading Blanks|Tells Excel: to ignore any empty rows at the very top of the selected range.|Datasets that have empty header buffers or blank spaces at the beginning.|
|```=A1.:.A1000```|Trims Both Ends.|Removes empty rows from both the top and the bottom.|Messy sheets where data is floating in the middle of a large range.|


## Keyboard Shortcuts

### On Selected Cells
- ``` F4 ``` or ``` Ctrl+Y ``` Redo: repeats the last action/command.
- ```Ctrl+\ ``` when two columns a selected it will highlight the cells in the unselected column that are different from the selected column.
- ``` Alt+Down ``` displays the pick from dropdown list.
- ``` Alt+b o ``` opens a form to edit row data.
- Home Tab \ Cells \ Format \ Justify

### When Editing a Formula
- ``` F4 ``` will cycle through absolute reference options for the selected text.

