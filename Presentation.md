Reproducible analyses with R
========================================================
author: Reinhard Simon
date: 10th November 2016
autosize: true


Motivation
========================================================

Challenges

- How did I get to my results?
- Can I repeat easily my analysis on a similar data set?
- Can I understand it 6 months or 6 years from now?
- Is it easy to track my steps?


Objectives
========================================================

1. How to organize files
2. Learn tools for tracking changes (git & github)
3. How to create reproducible reports with markdown and knitr
4. How to make interactive reports
5. Modularizing your R code into packages
6. How to document functions
7. How to check that functions are correct


Outline
========================================================

For each of the 7 sections there will be three parts:

1. short introduction of 5 to 10 min
2. demo
3. hands-on



Software
========================================================

Install (Windows)

- R
- Rtools
- git
- RStudio
- pandoc
- optional for PDF document versions: MikTex

R packages
========================================================

- devtools
- markdown
- roxygen2
- testhat
- knitr


Reference documents
========================================================

- [git chestsheet](docs/github-git-cheatsheet.pdf)
-


1. Tracking changes using git and github
========================================================

- Similar to word review mode

<img src='figs/github1.png' width=700>

1. Tracking changes using git and github - 2
========================================================

Unlike prior source code tracking systems git

- can be used 'offline'
- can switch between repositories

<img src='figs/github2.png' width=700>

1. Tracking changes using git and github - 3
========================================================

- Save & comment frequently using local 'commit'

- Push to repository at the 'end of day' (for backup and collaboration)
- Pull from repository at the 'start of day'

<img src='figs/git_commit_push.png' width=500>

1. Tracking changes using git and github - 4
========================================================

- Register your github credentials at the outset

git config --global user.name "[name]"

git config --global user.email "[email address]"

git config --global user.password "[password]"

git config --global color.ui auto

[cheatsheet](docs/github-git-cheat-sheet.pdf)


1. Tracking changes using git and github - 5
========================================================

Clone the c5sire/ISAS70 directory to your computer.

- Copy address into the project wizard in RStudio is the most convenient
method.
- Setup your own account and then ‘fork’ the directory into your own. Then
use that for cloning locally.

1. Tracking changes using git and github - 6
========================================================

[Restart] RStudio

- Should have now a git tab
- Supports only main tasks: commit & pull/push

- other frequent tasks
  - git branch
  - git merge


2.  Organzing an analysis project - 1
========================================================

1. Be organized
2. Automate
3. One directory for each project
4. Separate final data from raw data
5. Separate code from data
6. Use relative paths
7. Choose file names carefully
8. Write ReadMe files


2.  Organzing an analysis project - 2
========================================================

- README.md
- src
- data
- data/code
- data/NOTEBOOK.md
- analyses
- docs/paper
- docs/presentation

2.  Organzing an analysis project - 3
========================================================


```r
  use_file(afile = "README.md",
           line = "What is where in this project.")
  use_dir("src")
  use_dir("data")
  use_file("data/NOTEBOOK.md",
           "Describe your transformation and analytical steps in this lab notebook.")
  use_dir(file.path("data", "code"))
  use_dir("analyses")
  use_dir("docs")
  use_dir(file.path("docs", "paper"))
  use_dir(file.path("docs", "presentation"))
```

2.  Organzing an analysis project - 4
========================================================


```r
  # Create a project directory if it not already exists
  # or use the current directory
  if(project_name != "."){
    if(!dir.exists(project_name)) dir.create(project_name)
    setwd(project_name)
    p_name = project_name
  } else {
    p_name = basename(getwd())
  }
```


2.  Organzing an analysis project - 5
========================================================


```r
 # Helper function to safely create directories
  use_dir <- function(adir){
    tryCatch({
      if (!dir.exists(adir)) {
        dir.create(adir)
        message(paste0("Created directory: ", adir))
      } else {
        message(paste0("Directory: ", adir, " already exists."))
      }

    }, error = function(e) {
      warning(paste0("Could not create directory: ", adir))
      }
    )
  }
```

2.  Organzing an analysis project - 6
========================================================


```r
# Helper function to safely create files
  use_file <- function(afile = "README.md",
                       line = "What is where in this project."){
    # Write the README.md file

    tryCatch({
      if (!file.exists(afile)) {
        write(paste0("# ", line ," *", p_name, "*"), file = afile)
        message(paste0("Created file: ",  afile))
      } else {
        message(paste0("File exists: ", afile))
      }
    }, error = function(e) {
      warning(paste0("Could not create file: ", afile))
    })
  }
```



2.  Organzing an analysis project - 6
========================================================


```r
# Use the function for example:

source("code/use_analysis.R")

use_analysis("my_project")
```
