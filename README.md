# batch_diary
A .bat script for Windows that automates writing entries for my diary in LaTeX

## LaTeX files for diary
I used [this StackExchange post](https://tex.stackexchange.com/questions/144995/diary-in-latex-with-additional-notes-on-side) for setting up the directory with diary. I splitted `main.tex` in three files: pointers at the location of the entries and ToC are located in the `mainmatter.tex`, `main.tex` that contains LaTeX code for the diary designed as book, and `backmatter.tex` storing some last words and LaTeX code to complete the `diary.tex` file, which can be transformed to .pdf by TexStudio and the like.

## Use
This script does two things. Firstly, it creates an entry with prefilled LaTeX code that is opend in Sublime Text 3, my favourite text editor. Secondly, this file is used to fill in the contents of the Table of contents.

You can put .bat script anywhere you like but it is convenient to call it from "home" directory, which in Windows is user's directory. 
You just need to type `diary`, i.e. the name of the .bat script without its extension.

There are some limitations of this script because it is my first .bat script ever :) Creating another entry for the same day overwrites already existing file, for instance.
