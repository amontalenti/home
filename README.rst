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
* bash
* configuration files

My vim configuration is a bit customized, as I use vim as a kind of UNIX
IDE. Some handy plugins for me include:

* NERDTree_, for file navigation
* Gundo_, for undo history
* fugitive_, for git integration

These aren't shown in my repo because they are installed using the handy
pathogen plugin for vim. You can install them pretty easily into your
``~/.vim/bundles`` directory just by cloning the appropriate git repo.

.. _NERDTree: https://github.com/scrooloose/nerdtree
.. _Gundo: https://github.com/sjl/gundo.vim
.. _fugitive: https://github.com/tpope/vim-fugitive

