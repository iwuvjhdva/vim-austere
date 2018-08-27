vim-austere
===========

Austere Vim config with CtrlP and Neocomplete with mostly no installation, ideal for using on remote servers:

```bash
$ cd && git clone --recursive https://github.com/iwuvjhdva/vim-austere.git .vim
```

Plugins
-------
* ctrlp.vim - Quick files navigation, press Ctrl+p
* delimitMate - Auto-completion for quotes, brackets etc
* editorconfig - Support for uniform project-specific editor configuration format
* deoplete - Autocompletion
* notes - Create a new note with :Note
* snipmate.vim - Add a Python breakpoint with br\<Tab\>
* neomake - You may want to install syntax checkers like flake8 or eslint for realtime syntax errors highlight
* tcomment - Comment your code by selecting a block and pressing gc
* vim-misc (required by vim-notes)
* vim-python-pep8-indent - PEP8 indentation
* html5.vim - HTML5 syntax support
* vim-javascript - Proper JavaScript indentation
* vim-go - Go syntax highlighting and development stuff
* vim-clojure-static - Clojure syntax and indentation
* vim-gitgutter - Show git diff in the gutter
* vim-unimpaired - No idea why I have it
* tagbar - Press F8 to toggle file tags
* vim-gutentags - background tags generation

Ctags on Mac OS X
-----
Use the following command to install Universal Ctags on Mac OS X:

```brew install --HEAD universal-ctags/universal-ctags/universal-ctags```
