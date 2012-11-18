from fabric.api import *
from fabric.colors import *
from jinja2 import Template, FileSystemLoader, Environment
from os import path, getenv

DOT_HOME = path.join(getenv("HOME"), ".home")
TEMPLATE_PATH = path.join(DOT_HOME, "templates")
CONFIG_PATH = path.join(DOT_HOME, "config")

env = Environment(loader=FileSystemLoader(TEMPLATE_PATH))

def _render_etc_hosts(block=True):
    template = env.get_template("etc_hosts.jinja2")
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
    scratch_dir = path.join(DOT_HOME, "scratch")
    local("mkdir -p {0}".format(scratch_dir))
    filename = path.join(scratch_dir, "hosts")
    scratch_hosts = open(filename, "w")
    scratch_hosts.write(contents)
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
    _alter_hosts(block=True)

@task
def mode_play():
    _alter_hosts(block=False)
