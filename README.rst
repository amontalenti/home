My dotfiles and $HOME
=====================

Cloning
-------

This repo isn't meant to be used by other people. It's just for me to use
while letting others "peer over my shoulder" to see how I have things
configured.

This is how I get my dotfiles installed in a new ``/home/am`` directory,
aka ``$HOME``. I start with cloning this repo::

    git init .
    git remote add -t \* -f origin git@github.com:amontalenti/home.git
    git checkout master

I may hit conflicts with the existing .bashrc or .profile. Just move those
to another directory and let it run.

Once I clone the repo, I'll need to restart the shell. If I'm logged in
to a fresh Linux box (e.g. Ubuntu or similar) via `ssh`, the simplest way to do
this is to log off and log back on.

Shell
-----

On a freshly bootstrapped Ubuntu machine, I can typically clone this git repo
and get going pretty quickly with bash. But, in my day-to-day development,
I use zsh. For years, I used bash only, and mostly out of habit. Nowadays,
I keep my bash environment around to give me the option to use bash for
shell script debugging.

I find it convenient to keep my "basic" bashrc configuration around, and then
"layer" my zsh configuration over them. The bash config is summarized here:

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

You might wonder why it's handy to keep bash in a working state, and around.
Two reasons. First, when you first clone this repo into a fresh Linux box,
you'll find that bash is the default shell. It's therefore nice to have it
working. Second, sometimes you are working on customizing your shell itself,
and you break things. In these scenarios, it's handy to have another "working"
shell laying  around until you fix things. For me, bash and zsh play this role
for one another.

I like to get ``bash`` up-and-running fully before ``zsh``. Do this:

1. Install pyenv
2. Install cargo
3. Install nix
4. Install uv (experimental)

At this point, my ``bash`` should be fully functional. Then, to get ``zsh``:

1. Install zsh
2. Install oh-my-zsh
3. Layer my oh-my-zsh customizations over the fresh install
4. Install the p10k theme
5. Install an extra oh-my-zsh plugin

We'll follow ALL these steps in turn.

We use pyenv_ to compile Python and manage Python environments, because some of my
helper scripts rely on Python and pyenv, and expect it. The one-liner here should be::

    curl https://pyenv.run | bash

.. _pyenv: https://github.com/pyenv/pyenv-installer

To install Rust and cargo, check out this page_ in the cargo book::

    curl https://sh.rustup.rs -sSf | sh

.. _page: https://doc.rust-lang.org/cargo/getting-started/installation.html

To install nix, check out this download info_ on the Nix website. If it's a 
laptop, desktop, or server I fully control, I should do the multi-user install::

    sh <(curl -L https://nixos.org/nix/install) --daemon

.. _info: https://nixos.org/download/

After you install, you should activate the default nix profile for current user::

    nix-env --switch-profile /nix/var/nix/profiles/default

Lately, I've been using ``uv`` as an alternative to ``pyenv`` and ``pip``. Install::

    curl -LsSf https://astral.sh/uv/install.sh | sh

Read more about uv_.

.. _uv: https://github.com/astral-sh/uv

To install zsh, I rely on apt. So::

    sudo apt install zsh

Because this git repo contributes a `~/.oh-my-zsh` directory, you need to do a little
dance to setup oh-my-zsh. You need to temporarily move it aside, then run the installer,
and then rsync the contents of the original cloned repo back into it. Then you can get
rid of the backup. Try this::

    mv ~/.oh-my-zsh ~/.oh-bck
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    rsync -Pav ~/.oh-bck/ ~/.oh-my-zsh/
    rm -Rf .oh-bck

You need to install the p10k theme via this recipe::

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

Similarly, you need to install zsh-better-npm-completion_ thusly::

    git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion

.. _zsh-better-npm-completion: https://github.com/lukechilds/zsh-better-npm-completion

Then, I'll try it out by running ``zsh`` before switching shell, by simply running ``zsh``.

With ``zsh``, I took a different approach than `bash`, but it's unified my bash
setup for common aliases and functions. I have a simple ``.zshrc`` that
implements the equivalent of ``.bash_env``.

In ``bash``, my prompt (``PS1``) is set entirely by the simple bash
environment, and is very basic, optimized for prompt render speed.

In ``zsh``, things are a bit more "souped up", and I have two prompt themes
available:

- ``powerlevel10k/powerlevel10k`` is the amazing p10k_ theme that leverages
  a pure zsh implementation of the fastest and most configurable prompt one could
  imagine.
- ``ampy``, short for "Andrew Montalenti Python Prompt"; the prompt is implemented
  via an oh-my-zsh theme that outsources most of its work to a Python script
  called ``zshprompt``, which lives in ``~/opt/bin/``

Thus, my "full" zsh environment is summarized in this table:

+-----------------------------------+----------------------------------------------+
| file                              | description                                  |
+===================================+==============================================+
| ~/.zshrc                          | pulls everything together                    |
+-----------------------------------+----------------------------------------------+
| ~/.../custom/themes/powerlevel10k | cloned submodule for powerlevel10k           |
+-----------------------------------+----------------------------------------------+
| ~/.p10k.zsh                       | zsh script for the powerlevel10k config      |
+-----------------------------------+----------------------------------------------+
| ~/.oh-my-zsh/themes/am.zsh-theme  | alt theme that provides zshprompt calls      |
+-----------------------------------+----------------------------------------------+
| ~/opt/bin/zshprompt               | Python script to generate prompt             |
+-----------------------------------+----------------------------------------------+
| ~/.bash_functions                 | I use these across zsh and bash              |
+-----------------------------------+----------------------------------------------+
| ~/.bash_aliases                   | I use these across zsh and bash              |
+-----------------------------------+----------------------------------------------+

.. _p10k: https://github.com/romkatv/powerlevel10k

The ``zshprompt`` script supports shortened paths, git branches, Python
virtualenvs, and last process exit code, and only when using the ``am`` zsh theme.
Here is what it looks like:

.. image:: https://user-images.githubusercontent.com/40263/39084790-49b8eb4a-4548-11e8-8523-7fce14582eab.png
    :target: http://ohmyz.sh/
    :align: center
    :alt: zshprompt

Here's the guide:

* path = ``~/repos/ptrack/streamparse``
* virtualenv = ``ptrack+streamparse``
* branch = ``feature/visitor-metrics``

The right prompt auto-hides when you are writing a long command, and the path
compresses uses a shortening approach (thus ``~/r/p/streamparse``). You can
also see the exit status of ``1`` in red of the ``false`` command.

As for p10k, examples of that prompt are best covered at the p10k_ GitHub page.
I found that by customizing ``.p10k.zsh``, I could reproduce all the features
of my ``zshprompt`` script, while also having nice support for things that
would be way harder to implement on my own. Also, p10k_ is super fast to load
through some zsh tricks, so as of 2020, it's preferred.

Editor
------

I use vim for text editing. I tend to use vim for editing all sorts
of files, including:

* Python
* JavaScript
* Clojure
* Java
* C
* CSS, LESS, Sass
* HTML, JSON, XML
* reStructuredText
* Markdown
* bash, zsh
* Dockerfile
* configuration files
* Racket, Scheme, Go, Elixir (for fun)

My vim configuration is a bit customized, as I use vim as a kind of UNIX
IDE. However, I don't go overboard remapping things; in general, I'm pretty
happy with vim's default mappings and have learned to love them. Most of
these customizations are just to make editing typical files for me nicer,
and add file-specific or workflow-specific add-ons.

Some nice IDE-like plugins for me include:

* ctrlp_, for quick file opening
* dockerfile_, for docker support
* fugitive_, for git integration
* goyo_, for distraction-free writing
* gundo_, for undo history
* nerdtree_, for file navigation
* parinfer-rust_, for speedy indent/dedent of Lisp code
* rainbow_parentheses_, for matching parens, especially in Lisp
* repeat_, just makes the ``.`` command more flexible and scriptable
* simplenote_, integrates with Simplenote notes service
* surround_, adds a noun to vim for "surroundings", useful for quoting and parens
* syntastic_, for syntax checking, mainly Python and JavaScript
* tagbar_, for improved code outlines / navigations
* vim-clojure-static_, for Clojure basic editing support
* vim-elixir_, for Elixir basic editing support
* vim-eslint-compiler_, for ESLint :make and quickfix support
* vim-fontsize_, for adjusting font size quickly in gVim
* vim-fireplace_, for Clojure interaction with nREPL
* vim-flake8_, for Python syntax checking
* vim-go_, for Go basic editing
* vim-jinja_, for enhanced Jinja syntax highlighting
* vim-less_, for editing LESS CSS files
* vim-livedown_, for live preview of Markdown files
* vim-markdown_, improved Markdown syntax handling
* vim-racket_, for Racket and Scheme basic editing
* vim-sexp_, for Clojure S-expr support
* vim-sexp-ext_, for Clojure text motions over S-expressions
* vim-superman_: read man pages within vim
* vim-virtualenv_, for Python virtualenv support
* vim-yaml_, basic YAML file support
* whitespace_, to kill trailing whitespace in files
* yajs_, yet another Javascript syntax
* zeavim_, integrate Zeal documentation lookup

.. _syntastic: https://github.com/vim-syntastic/syntastic
.. _dockerfile: https://github.com/ekalinin/Dockerfile.vim
.. _vim-yaml: https://github.com/avakhov/vim-yaml
.. _repeat: https://github.com/tpope/vim-repeat
.. _surround: https://github.com/tpope/vim-surround
.. _rainbow_parentheses: https://github.com/kien/rainbow_parentheses.vim
.. _simplenote: https://github.com/mrtazz/simplenote.vim
.. _parinfer-rust: https://github.com/eraserhd/parinfer-rust
.. _NERDTree: https://github.com/scrooloose/nerdtree
.. _numbers: https://github.com/myusuf3/numbers.vim.git
.. _ctrlp: https://github.com/kien/ctrlp.vim.git
.. _fugitive: http://github.com/tpope/vim-fugitive.git
.. _Gundo: https://github.com/sjl/gundo.vim
.. _goyo: https://github.com/junegunn/goyo.vim
.. _rope-vim: https://github.com/sontek/rope-vim.git
.. _tagbar: http://majutsushi.github.io/tagbar/
.. _vim-elixir: https://github.com/elixir-editors/vim-elixir
.. _vim-eslint-compiler: https://github.com/salomvary/vim-eslint-compiler
.. _vim-less: https://github.com/groenewege/vim-less
.. _vim-jinja: https://github.com/mitsuhiko/vim-jinja
.. _vim-flake8: https://github.com/nvie/vim-flake8
.. _vim-virtualenv: https://github.com/jmcantrell/vim-virtualenv.git
.. _vim-fontsize: https://github.com/drmikehenry/vim-fontsize
.. _vim-fireplace: https://github.com/tpope/vim-fireplace
.. _vim-clojure-static: https://github.com/guns/vim-clojure-static
.. _vim-go: https://github.com/fatih/vim-go
.. _vim-racket: https://github.com/wlangstroth/vim-racket
.. _vim-sexp: https://github.com/guns/vim-sexp
.. _vim-sexp-ext: https://github.com/tpope/vim-sexp-mappings-for-regular-people
.. _vim-superman: https://github.com/jez/vim-superman
.. _vim-markdown: https://github.com/tpope/vim-markdown
.. _vim-livedown: https://github.com/shime/vim-livedown
.. _yajs: https://github.com/othree/yajs.vim
.. _whitespace: https://github.com/bronson/vim-trailing-whitespace
.. _zeavim: https://github.com/KabbAmine/zeavim.vim

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
do this so I can impress `Parse.ly`_ engineers and encourage people to
learn the joys of UNIX.

.. _Parse.ly: https://www.parse.ly/about/

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
find that most of the default palettes are way too bright and loud.

With gnome-terminal (Linux) and other platform-specific terminals across OS X
and Windows, you'll want to pick the Tango_ palettes, which are a tad muted and
relatively standard across platforms.

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

I primarily use ``git``. I don't customize it too heavily, but my ``.gitconfig``
is included here anyway.
