Andrew's home directory
=======================

Shell
-----

I use bash out of habit. My bashrc links out to some other files.

+-----------------+----------------------------------------+
| file            |  description                           |
+=================+========================================+
| .bashrc         |  pulls everything together             |
+-----------------+----------------------------------------+
| .bash_aliases   |  handy shortcuts                       |
+-----------------+----------------------------------------+
| .bash_env       |  sets up my environment the way I like |
+-----------------+----------------------------------------+
| .bash_functions |  when an alias doesn't cut it          |
+-----------------+----------------------------------------+

Editor
------

I use vim for text editing. I tend to use vim for editing all sorts 
of files, including:

* Python
* JavaScript
* XML
* reStructuredText
* Markdown
* bash
* configuration files

My vim configuration is a bit customized, as I use vim as a kind of UNIX
IDE. However, I don't go crazy remapping things; in general, I'm pretty 
happy with vim's default mappings and have learned to love them. Most of 
these customizations are just to make editing typical files for me nicer.

Some nice IDE-like plugins for me include:

* NERDTree_, for file navigation
* Gundo_, for undo history
* fugitive_, for git integration

.. _NERDTree: https://github.com/scrooloose/nerdtree
.. _Gundo: https://github.com/sjl/gundo.vim
.. _fugitive: https://github.com/tpope/vim-fugitive

These are referenced via git's submodule facility, because this seemed 
like the cleanest thing. Therefore, after cloning this repo, make sure
you also clone the submodules as such::

    git submodule init
    git submodule update

Then you will have all of the above.

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

Version Control
---------------

I used to use Mercurial, now I primarily use git. I don't customize 
these too heavily, but my ``.hgrc`` and ``.gitconfig`` are included 
here anyway.
