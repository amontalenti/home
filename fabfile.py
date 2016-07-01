from fabric.api import *
from fabric.colors import *
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
    print blue("rendered template")
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
        print blue("found system hosts; appending")
        system_hosts = open(system_filename, "r")
        scratch_hosts.write(system_hosts.read())
        system_hosts.close()
    print blue("appending dynamic hosts")
    scratch_hosts.write(contents)
    if path.exists(extra_filename):
        print blue("found extra hosts; appending")
        extra_hosts = open(extra_filename, "r")
        scratch_hosts.write(extra_hosts.read())
        extra_hosts.close()
    scratch_hosts.close()
    local("sudo cp {0} /etc/hosts".format(filename))
    print blue("overwrote hosts file")

def _alter_hosts(block=True):
    _overwrite_hosts_file(_render_etc_hosts(block=block))
    if block:
        print red("blocking sites for work mode!")
    else:
        print green("unblocking sites for play mode!")

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

_dash_app_servers = ["ue1a-dash-web{num}.cogtree.com".format(num=i)
                    for i in range(1, 4+1)]

@task
@parallel
@hosts(_dash_app_servers)
def dash_tail_nginx(grep_pattern=None):
    """Quick `tail -f` on dash web app server logs."""
    cmd = "tail -n100 -F /var/log/nginx/*.log"
    if grep_pattern:
        cmd += " | grep " + grep_pattern
    sudo(cmd)

_storm_servers = ["ue1a-storm1{chr}.cogtree.com".format(chr=chr)
                    for chr in "abcdefghijklmnop"]

@task
@hosts(_storm_servers)
def storm_check_top(grep_pattern=None):
    """Quick top monitoring on Storm worker servers."""
    cmd = "top -b | head -n 12"
    run(cmd)

@task
@parallel
@hosts(_storm_servers)
def storm_uptime():
    """uptime on all Storm servers."""
    sudo("uptime")


@task
def build_python2():
    """Build python2 from scratch using pyenv."""
    # options stolen from Ubuntu 14.04 build logs
    local("""
    PYTHON_CONFIGURE_OPTS="--enable-ipv6\
                           --enable-unicode=ucs4\
                           --with-dbmliborder=bdb:gdbm\
                           --with-system-expat\
                           --with-system-ffi\
                           --with-fpectl" \
    pyenv install -f 2.7.10
    """.strip())

@task
def build_python3():
    """Build python3 from scratch using pyenv."""
    # removed --without-ensurepip
    local("""
    PYTHON_CONFIGURE_OPTS="--enable-ipv6\
                           --enable-loadable-sqlite-extensions\
                           --enable-shared\
                           --with-dbmliborder=bdb:gdbm\
                           --with-computed-gotos\
                           --with-system-expat\
                           --with-system-libmpdec\
                           --with-system-ffi\
                           --with-fpectl"\
    pyenv install -f 3.5.0
    """.strip())
