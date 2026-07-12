# Tools

A collection of handy tools and how to use them.

## TL;DR

## Files and Folders

### Summary of a specific file or folder
```bash
du -sh /home/user
```

### Find the 10 largest folders
```bash
du -h --max-depth=1 | sort -rh | head -n 10
```

## Disk Space

### List drives sorted by space used
```bash
df -hP | tail -n +2 | sort -k5,5 -hr
```

### List drives over 75% used capacity
```bash
df -hP | tail -n +2 | awk '$5+0 > 75'
```


## AWK
Here, $5 is the 5th column (Use%), and +0 converts values like 85% to a number for comparison.
```bash
awk '$5+0 > 80'
```


## DU

```bash
du -d 1 -h -t 100M
```

```
  -d, --max-depth <N>        print the total for a directory (or file, with --all) only if it is N or fewer levels
                             below the command line argument;  --max-depth=0 is the same as --summarize
  -h, --human-readable       print sizes in human readable format (e.g., 1K 234M 2G)
  -t, --threshold <SIZE>     exclude entries smaller than SIZE if positive, or entries greater than SIZE if
                             negative
```


## Sort

```bash
sort
```


