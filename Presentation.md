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

As running example, weather data records from India will be used.


Software
========================================================

Install (Windows)

- R
- Rtools
- git
- RStudio
- pandoc

R packages
========================================================

- devtools
- markdown
- roxygen2

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


1. Tracking changes using git and github - 6
========================================================

[Restart] RStudio

- Should have now a git tab
- Supports only main tasks: commit & pull/push

- other frequent tasks
  - git branch
  - git merge




