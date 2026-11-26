# Strypes Python Course

[![Build](https://github.com/chavdar12/Stypress-Courses/actions/workflows/build.yml/badge.svg)](https://github.com/chavdar12/Stypress-Courses/actions/workflows/build.yml)

My solutions to the Strypes Python course: from the language basics through OOP, files, databases, design patterns,
Tkinter GUIs and the Linux shell. Every lesson folder holds the exercise solutions, and its `Resources/` folder holds
the lecture slides and any data the exercises need.

## Lessons

| #   | Lesson | Exercises | Materials |
| --- | ------ | --------- | --------- |
| 001 | [Intro to Python](001-Intro-Python) | Greatest common divisor · quadratic equation solver | [Slides](001-Intro-Python/Resources/Intro-Python.pdf) |
| 002 | [Lists and Tuples](002-Lists-And-Tuples) | Is sorted · anagrams · has duplicates · unique items | [Slides](002-Lists-And-Tuples/Resources/Lists-And-Tuples.pdf) |
| 003 | [Strings](003-Strings) | Caesar cipher · Vigenère cipher | [Slides](003-Strings/Resources/Strings.pdf) |
| 004 | [Dictionaries](004-Dictionaries) | Keys for a value · letter histogram | [Slides](004-Dictionaries/Resources/Dictionaries.pdf) |
| 005 | [Abstraction](005-Abstraction) | Recursive binary search · palindrome check | [Slides](005-Abstraction/Resources/Abstraction.pdf) |
| 006 | [OOP](006-Oop) | School members · projectile motion | [Slides](006-Oop/Resources/Oop.pdf) |
| 007 | [Magic Methods](007-Magic-Methods) | Fibonacci iterator · iterative maze path search | [Slides](007-Magic-Methods/Resources/Magic-Methods.pdf) |
| 008 | [Exceptions and Testing](008-Exceptions-And-Testing) | Bisection root finder with a custom exception | [Slides](008-Exceptions-And-Testing/Resources/Exceptions-And-Testing.pdf) |
| 009 | [Working with Files](009-Working-With-Files) | Sort a file · split text into words, sentences and bigrams | [Slides](009-Working-With-Files/Resources/Working-With-Files.pdf) · [stemA.txt](009-Working-With-Files/Resources/stemA.txt) |
| 010 | [Tkinter](010-Tkinter) | BMI calculator · Hangman | [Slides](010-Tkinter/Resources/Tkinter.pdf) |
| 011 | [Database Intro](011-Database-Intro) | Courses, teachers and students schema from the ER diagram | [Slides](011-Database-Intro/Resources/Database-Intro.pdf) |
| 012 | [Databases in Python](012-Database-Python) | Load the nutrient retention dataset into SQLite and query it | [Slides](012-Database-Python/Resources/Database-Python.pdf) · [retn5_dat.txt](012-Database-Python/Resources/retn5_dat.txt) |
| 013 | [Design Patterns](013-Design-Patterns) | Animal factory · beverage decorator | [Slides](013-Design-Patterns/Resources/Design-Patterns.pdf) |
| 014 | [Tkinter Advanced](014-Tkinter-Advanced) | Calculator · collection manager (GUI, manager and file storage layers with tests) | [Slides](014-Tkinter-Advanced/Resources/Tkinter-Advanced.pdf) · [Task](014-Tkinter-Advanced/Resources/Tkinter-Advanced-Task.pdf) |
| 015 | [Linux Shell](015-Linux-Shell) | `mkdir`/`mv`/`cp`/`rm` and `grep`/`sed` exercises in Python | [Slides](015-Linux-Shell/Resources/Linux-Shell.pdf) |

Example project documentation shared during the course lives in
[Project-Documentation-Examples/Resources](Project-Documentation-Examples/Resources).

## Running

Requires Python 3. Run any exercise from its folder:

```sh
cd 003-Strings
python 001.py
```

Each script checks itself with `assert`s when it runs, and CI runs all of them on every push. The collection manager
in lesson 014 also has unit tests:

```sh
cd 014-Tkinter-Advanced/002
python -m unittest
```

## License

[MIT](LICENSE)
