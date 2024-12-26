#!/usr/bin/env python3

# requires fab-classic, NOT fabric, fabric2, or fabric3
from fabric.api import *
from fabric.colors import *

# use:
#   pipx inject fab-classic jinja2
from jinja2 import Template, FileSystemLoader, Environment

from os import path, getenv

DOT_HOME = path.join(getenv("HOME"), ".home")
TEMPLATE_PATH = path.join(DOT_HOME, "templates")
CONFIG_PATH = path.join(DOT_HOME, "config")

jinja_env = Environment(loader=FileSystemLoader(TEMPLATE_PATH))

env.use_ssh_config = True

#
# /etc/hosts management
#

def _render_etc_hosts(block=True):
    template = jinja_env.get_template("etc_hosts.jinja2")
    if block:
        sitelist = open(path.join(CONFIG_PATH, "blocksites.txt"))
        sitelist = [site.strip() for site in sitelist]
        sitelist.insert(0, "# time-wasting sites suck; block em!")
    else:
        sitelist = ["# no blocked sites; time to play!"]
    contents = template.render(sitelist=sitelist)
    print("rendered template")
    return contents

def _overwrite_hosts_file(contents):
    indexfile = path.join(DOT_HOME, "static", "index.html")
    local("sudo cp {0} /usr/share/nginx/html/".format(indexfile))
    scratch_dir = path.join(DOT_HOME, "scratch")
    local("mkdir -p {0}".format(scratch_dir))
    filename = path.join(scratch_dir, "hosts")
    extra_filename = path.join(scratch_dir, "extra_hosts")
    system_filename = path.join(scratch_dir, "system_hosts")
    scratch_hosts = open(filename, "w")
    if path.exists(system_filename):
        print("found system hosts; appending")
        system_hosts = open(system_filename, "r")
        scratch_hosts.write(system_hosts.read())
        system_hosts.close()
    print("appending dynamic hosts")
    scratch_hosts.write(contents)
    if path.exists(extra_filename):
        print("found extra hosts; appending")
        extra_hosts = open(extra_filename, "r")
        scratch_hosts.write(extra_hosts.read())
        extra_hosts.close()
    scratch_hosts.close()
    local("sudo cp {0} /etc/hosts".format(filename))
    print("overwrote hosts file")

def _alter_hosts(block=True):
    _overwrite_hosts_file(_render_etc_hosts(block=block))
    if block:
        print("blocking sites for work mode!")
    else:
        print("unblocking sites for play mode!")

@task
def mode_work():
    """Turn off annoying sites so they don't distract."""
    _alter_hosts(block=True)

@task
def mode_play():
    """Turn back on annoying sites."""
    _alter_hosts(block=False)

#
# server monitoring shortcuts
#

_web_servers = ["web{num}".format(num=i)
                    for i in range(1, 4+1)]

@task
@parallel
@hosts(_web_servers)
def web_tail_nginx(grep_pattern=None):
    """Quick `tail -f` on web app server logs."""
    cmd = "tail -n100 -F /var/log/nginx/*.log"
    if grep_pattern:
        cmd += " | grep " + grep_pattern
    sudo(cmd)

_worker_servers = ["worker{chr}".format(chr=chr)
                    for chr in "abcdefghijklmnop"]

@task
@hosts(_worker_servers)
def worker_check_top(grep_pattern=None):
    """Quick top monitoring on worker servers."""
    cmd = "top -b | head -n 12"
    run(cmd)

@task
@parallel
@hosts(_worker_servers)
def worker_uptime():
    """uptime on all Storm servers."""
    sudo("uptime")


@task
def build_python2():
    """Build python2 from scratch using pyenv."""
    # options stolen from Ubuntu build logs; hopefully we
    # won't need these Python 2 builds for much longer!
    local("""
    PYTHON_CONFIGURE_OPTS="--enable-ipv6\
                           --enable-unicode=ucs4\
                           --with-dbmliborder=bdb:gdbm\
                           --with-system-expat\
                           --with-system-ffi\
                           --with-fpectl" \
    pyenv install -f 2.7.18
    """.strip())

@task
def build_python3():
    """Build python3 from scratch using pyenv."""
    # From the below arguments, I manually removed --without-ensurepip
    # because pyenv likes that better. See the docstring below for how
    # to fetch a fresh list, if you're concerned about matching Ubuntu
    # defaults or whatever.
    """
    To get a fresh list of build args from the system Python, you can use the
    following incantation:

        >>> import sysconfig
        >>> import pprint
        >>> config_args = sysconfig.get_config_vars()["CONFIG_ARGS"].split()
        >>> pprint.pprint([item.replace("'", "") for item in config_args
        ...     if not item.startswith("'--prefix") and item.startswith("'--")]
        ['--enable-shared',
         '--enable-ipv6',
         ...
        ]
    """
    local("""
    PYTHON_CONFIGURE_OPTS="--enable-shared\
                           --enable-ipv6\
                           --enable-loadable-sqlite-extensions\
                           --with-dbmliborder=bdb:gdbm\
                           --with-computed-gotos\
                           --with-system-expat\
                           --with-system-libmpdec\
                           --with-dtrace\
                           --with-system-ffi\
                           --with-fpectl"
    false && pyenv install -f 3.11.10
    PYTHON_CONFIGURE_OPTS="--enable-shared\
                           --enable-ipv6\
                           --enable-loadable-sqlite-extensions\
                           --with-dbmliborder=bdb:gdbm\
                           --with-computed-gotos\
                           --with-system-expat\
                           --with-system-libmpdec\
                           --with-dtrace\
                           --with-system-ffi\
                           --with-fpectl"
    false && pyenv install -f 3.12.7
    PYTHON_CONFIGURE_OPTS="--build=x86_64-unknown-linux-gnu\
                           --host=x86_64-unknown-linux-gnu\
                           --with-openssl=/tools/deps\
                           --with-system-expat\
                           --with-system-libmpdec\
                           --with-readline=editline\
                           --enable-shared\
                           --enable-optimizations\
                           --with-lto\
                           --with-build-python=/tools/host/bin/python3.13\
                           --with-dbmliborder=bdb"
    false && pyenv install -f 3.13.0
    """.strip())
