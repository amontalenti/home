# AppKeys v19 frozen extension

Versions v20 and above of this extension are incompatible with gnome-shell
version 3.28, which is the version used in Ubuntu 18.04.

Until we do the 20.04 LTS upgrade, this vendorized extension will have to do.

It's frozen at the v19 version.

To use a local extension, you have to put it in this directory and then do
some command-line-fu.

From this directory, use:

    gnome-shell-extension-tool -e $(basename $(pwd))

... to enable the extension.

And:

    gnome-shell-extension-tool -d $(basename $(pwd))

to disable it.
