# UV 

## TL;DR

Create a project: 
```shell
uv init
```

Running a script:
```shell
uv run example.py parameterOne parameterTwo
```


**Reference:** 
 - https://docs.astral.sh/uv/

## Installation

### Linux

```shell
curl -LsSf https://astral.sh/uv/install.sh | sh

pipx install uv
```

### Windows

```terminal
winget install --id=astral-sh.uv  -e
```

### Updating UV

```shell
uv self update
```

## Commands 

```shell
$ uv
An extremely fast Python package manager.

Usage: uv [OPTIONS] <COMMAND>

Commands:
  auth       Manage authentication
  run        Run a command or script
  init       Create a new project
  add        Add dependencies to the project
  remove     Remove dependencies from the project
  version    Read or update the project's version
  sync       Update the project's environment
  lock       Update the project's lockfile
  export     Export the project's lockfile to an alternate format
  tree       Display the project's dependency tree
  format     Format Python code in the project
  check      Run checks on the project
  audit      Audit the project's dependencies
  tool       Run and install commands provided by Python packages
  python     Manage Python versions and installations
  pip        Manage Python packages with a pip-compatible interface
  venv       Create a virtual environment
  build      Build Python packages into source distributions and wheels
  publish    Upload distributions to an index
  workspace  Inspect uv workspaces
  cache      Manage uv's cache
  self       Manage the uv executable
  help       Display documentation for a command
```

### init
When creating projects, uv supports two basic templates: **applications** and **libraries**. By default, uv will create a project for an application. The ```--lib``` flag can be used to create a project for a library instead.
```
uv init
```

#### Packages
```shell
uv init --package appname
```

#### Libraries
```shell
uv
```

### run 
```shell
uv
```

### add 
```shell
uv
```

### remove 
```shell
uv
```

