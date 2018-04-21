My dotfiles and $HOME
=====================

Cloning
-------

In your `$HOME`, do this::

    git init .
    git remote add -t \* -f origin git@github.com:amontalenti/home.git
    git checkout master

You may hit conflicts with your existing .bashrc or .profile. Just move those
to another directory and let it run.

Shell
-----

I use zsh. For years, I used bash out of habit. I still keep my .bashrc and
associated bash files around, for the rare case where I'm forced to use bash.

My bash environment is covered in these files:

+-------------------+---------------------------------------+
| file              | description                           |
+===================+=======================================+
| ~/.bashrc         | pulls everything together             |
+-------------------+---------------------------------------+
| ~/.bash_aliases   | handy shortcuts                       |
+-------------------+---------------------------------------+
| ~/.bash_env       | sets up my environment the way I like |
+-------------------+---------------------------------------+
| ~/.bash_functions | when an alias doesn't cut it          |
+-------------------+---------------------------------------+

With zsh, I took a different approach. I have a simple ``.zshrc`` that implements
the equivalent of ``.bash_env``, and then my prompt is implemented via an
oh-my-zsh theme that outsources most of its work to a Python script called
``zshprompt``.

+----------------------------------+----------------------------------------------+
| file                             | description                                  |
+==================================+==============================================+
| ~/.zshrc                         | pulls everything together                    |
+----------------------------------+----------------------------------------------+
| ~/.oh-my-zsh/themes/am.zsh-theme | theme that provides my left and right prompt |
+----------------------------------+----------------------------------------------+
| ~/opt/bin/zshprompt              | Python script to generate prompt             |
+----------------------------------+----------------------------------------------+
| ~/.bash_functions                | I use these across zsh and bash              |
+----------------------------------+----------------------------------------------+
| ~/.bash_aliases                  | I use these across zsh and bash              |
+----------------------------------+----------------------------------------------+

The ``zshprompt`` script supports shortened paths, git branches, Python
virtualenvs, and last process exit code. Here is what it looks like:

.. image:: https://user-images.githubusercontent.com/40263/39084790-49b8eb4a-4548-11e8-8523-7fce14582eab.png
    :target: http://ohmyz.sh/
    :align: center
    :alt: zshprompt

Here's the guide:

* path = ``~/repos/ptrack/streamparse``
* virtualenv = ``ptrack+streamparse``
* branch = ``feature/visitor-metrics``

The right prompt auto-hides when you are writing a long command, and the path compresses
uses a shortening approach (thus ``~/r/p/streamparse``). You can also see the exit status
of ``1`` in red of the ``false`` command.

Editor
------

I use vim for text editing. I tend to use vim for editing all sorts
of files, including:

* Python
* JavaScript
* CSS and LESS
* Clojure
* JSON and XML
* reStructuredText
* Markdown
* bash
* Dockerfile
* Thrift files
* configuration files

My vim configuration is a bit customized, as I use vim as a kind of UNIX
IDE. However, I don't go crazy remapping things; in general, I'm pretty
happy with vim's default mappings and have learned to love them. Most of
these customizations are just to make editing typical files for me nicer.

Some nice IDE-like plugins for me include:

* NERDTree_, for file navigation
* numbers_, for better line number support
* ctrlp_, for quick file opening
* fugitive_, for git integration
* Gundo_, for undo history
* Goyo_, for distraction-free writing
* rope-vim_, for Python refactoring support
* Taglist_, for old-style code outlines / navigations
* tagbar_, for improved code outlines / navigations
* vim-less_, for editing LESS CSS files
* vim-jinja_, for enhanced Jinja syntax highlighting
* vim-flake8_, for Python syntax checking
* vim-virtualenv_, for Python virtualenv support
* vim-fireplace_, for Clojure interaction with nREPL
* vim-clojure-static_, for Clojure basic editing support
* vim-sexp-ext_, for Clojure text motions over S-expressions
* rainbow_parentheses_, for Clojure paren highlighting
* vim-markdown_, improved Markdown syntax handling
* vim-livedown_, for live preview of Markdown files
* js-lib-syntax_, adds some support for JS frameworks
* yajs_, yet another Javascript syntax
* whitespace_, to kill trailing whitespace in files

.. _NERDTree: https://github.com/scrooloose/nerdtree
.. _numbers: https://github.com/myusuf3/numbers.vim.git
.. _ctrlp: https://github.com/kien/ctrlp.vim.git
.. _fugitive: http://github.com/tpope/vim-fugitive.git
.. _Gundo: https://github.com/sjl/gundo.vim
.. _Goyo: https://github.com/junegunn/goyo.vim
.. _rope-vim: https://github.com/sontek/rope-vim.git
.. _Taglist: https://github.com/vim-scripts/taglist.vim
.. _tagbar: http://majutsushi.github.io/tagbar/
.. _vim-less: https://github.com/groenewege/vim-less
.. _vim-jinja: https://github.com/mitsuhiko/vim-jinja
.. _vim-flake8: https://github.com/nvie/vim-flake8
.. _vim-virtualenv: https://github.com/jmcantrell/vim-virtualenv.git
.. _vim-fireplace: https://github.com/tpope/vim-fireplace
.. _vim-clojure-static: https://github.com/guns/vim-clojure-static
.. _vim-sexp-ext: https://github.com/tpope/vim-sexp-mappings-for-regular-people
.. _rainbow_parentheses: https://github.com/kien/rainbow_parentheses.vim
.. _vim-markdown: https://github.com/tpope/vim-markdown
.. _vim-livedown: https://github.com/shime/vim-livedown
.. _js-lib-syntax: https://github.com/othree/javascript-libraries-syntax.vim
.. _yajs: https://github.com/othree/yajs.vim
.. _whitespace: https://github.com/bronson/vim-trailing-whitespace

I then have a couple of plugins that just expand the vim vocabulary a
little.  These include:

* repeat_, just makes the ``.`` command more flexible and scriptable
* surround_, adds a noun to vim for "surroundings", useful for quoting and parens

.. _repeat: https://github.com/tpope/vim-repeat
.. _surround: https://github.com/tpope/vim-surround

These are referenced via git's submodule facility, because this seemed
like the cleanest thing. Therefore, after cloning this repo, make sure
you also clone the submodules as such::

    git submodule init
    git submodule update

Then you will have all of the above.

Terminal and Editor Colors
--------------------------

In vim, I use the Mustang_ color scheme. Yes, I know about Solarized_,
and yes, I recognize that it is this new hotness with all of its fancy
marketing pages, but honestly that color scheme will make me blind or
make me want to murder my computer.

.. _Mustang: http://hcalves.deviantart.com/art/Mustang-Vim-Colorscheme-98974484
.. _Solarized: http://ethanschoonover.com/solarized

Mustang uses nice muted colors while still having enough contrast for
scanning big chunks of code. I think it's very zen hacker like.

In tmux and screen, I use a matrix-like green-on-black color scheme. I
do this so I can intimidate `Parse.ly`_ interns and make them think that
learning UNIX will rewire their brain.

.. _Parse.ly: http://parse.ly/team.html

Unfortunately, there is some trickery with UNIX color schemes for terminals.

The first thing you have to learn about is that most terminals do not
automatically place themselves in `256 color mode`_ -- of course, they
should, but this is UNIX. The software is Free and your time is worthless.

.. _256 color mode: http://www.enigmacurry.com/2009/01/20/256-colors-on-the-linux-terminal/

The answer is to be very mindful of two parts of your environment that will
dramatically affect the way colors display. These are:

* ``TERM`` environmental variable
* Color palette of your terminal emulator

Let's cover these in turn. The TERM environmental variable should be
``xterm-256color``. Except when it shouldn't, which is when it's running under
``tmux`` or ``screen`` (of course). In these environments, it should be
``screen-256color``. If this isn't set appropriately, programs like vim won't
use your fancy color scheme and you will be sad.

Finally, the color scheme will render differently depending on your color
palette. What's going on here is that your terminal emulator can translate the
colors being generated by vim and other programs, and translates them to actual
pixel colors on your screen. (It's just yet another level of indirection.) I
find that most of the default palettes are way too bright and loud. With
gnome-terminal (Linux) and iTerm (OS X), I have been picking the Tango_
palettes, which are a tad muted and relatively standard across platforms.

.. _Tango: http://en.wikipedia.org/wiki/Tango_Desktop_Project#Palette

Scripts
-------

I put some scripts in ``~/opt/bin`` that just make my life easier. Most
of these are bash scripts, some are little Python scripts as well. Some
of these are just meant to work around some UNIX annoyances.

Terminal Management
-------------------

Originally, I used GNU screen for all my terminal management, so my
``.screenrc`` is included here. However, I have now switched to
tmux, since I came across a nice book about it and it convinced me.
Funny enough, I was able to port over most of my customizations of
screen to tmux pretty straightforwardly. See ``.tmux.conf`` for that.

I also use a clever little tool called tmuxp_, which is a Python
frontend on tmux which allows you to save / re-open tmux "sessions".

.. _tmuxp: http://tmuxp.readthedocs.org/en/latest/

Version Control
---------------

I used to use Mercurial, now I primarily use git. I don't customize
these too heavily, but my ``.hgrc`` and ``.gitconfig`` are included
here anyway.
