#Readme

## Introduction

This is a small Vim plugin that facilitates planning, tracking and
archiving [Pomodoros](http://en.wikipedia.org/wiki/Pomodoro_Technique).

I've found it surprising useful and thought I would release it.

## Installation

Install in ~/.vim, or in ~\vimfiles if you're on Windows. This
plugin should be fully pathogen compatible.

Vomodoro was developed against Vim 7.3 but earlier versions of Vim
should work.

I strongly recommend you install the [tabular
plugin](https://github.com/godlygeek/tabular), as it's fantastic but
also as Vomodoro will make use of it to align check boxes. The plugin
should work without problems if you choose not to install tabular.

## Screenshot

![Vomodoro](http://www.gregsexton.org/images/vomodoro/todolist.png)

## Commands

* `:PomodoroOpenArchive`
    * Open the archived Pomodoros.
* `:PomodoroPerformArchive`
    * Copy the to do list of Pomodoros to the archive file.
* `:PomodoroToDoToday`
    * Open the to do list buffer.

These commands can (of course!) be mapped and I recommend mapping at
least `:PomodoroToDoToday`.

## Mappings defined in the to do list buffer

Within the to do list buffer, the following mappings are defined.

* `<ESC>`
    * Close the buffer window.
* `q`
    * Close the buffer window.
* `<CR>`
    * Add a check box to the current line.

      If the current line already has ticked off boxes then the added
      box is represented using parentehses rather than square brackets.
      This indicates that the task was underestimated.
* `<SPACE>`
    * Check off a box on the current line.

      If there are no empty boxes remaining on the current line, this
      will add a box (represented using parentheses) and mark it complete.
* `-`
    * Check off the remaining boxes on the current line using dashes.

      This is used to show that the task was overestimated and was
      finished earlier than expected.

## Options

* `g:Pomo_ToDoTodayFilePath`
    * The file used to back the to do list buffer. The default is
      `$HOME/todotoday`.
* `g:Pomo_ArchiveFilePath`
    * The file used to back the archive buffer. The default is
      `$HOME/archive`.

## Pomodoro Timer

Vomodoro is _not_ a Pomodoro timer. If that's what you're looking for
search harder, a billion exist. If you do need a timer,
[GTD](https://github.com/gregsexton/gtd) has been working well for me.
