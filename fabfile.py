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
    indexfile = path.join(DOT_HOME, "static", "index.html")
    local("sudo cp {0} /usr/share/nginx/www/".format(indexfile))
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

_web_app_servers = ["ue1a-dash-web{num}.cogtree.com".format(num=i)
                    for i in range(1, 4+1)]

@task
@parallel
@hosts(_web_app_servers)
def web_tail_nginx(grep_pattern=None):
    """Quick `tail -f` on web app server logs."""
    cmd = "tail -n100 -F /var/log/nginx/*.log"
    if grep_pattern:
        cmd += " | grep " + grep_pattern
    sudo(cmd)

_beta_db_servers = ["betadb{num}.cogtree.com".format(num=i)
                    for i in range(1, 3+1)]

@task
@hosts(_beta_db_servers)
def betadb_check_top(grep_pattern=None):
    """Quick top monitoring on betadb servers."""
    cmd = "top -b | head -n 12"
    run(cmd)

_ptng = ["ptrack-nextgen{num}.cogtree.com".format(num=i)
         for i in range(1, 4+1)]

@task
@parallel
@hosts(_ptng)
def visits_tuplelogger():
    """Check how many tuplelogger logs there are on Storm servers."""
    sudo("ls -l /var/log/cogtree/storm/visits/tuplelogger* | wc -l")

@task
@parallel
@hosts(_ptng)
def visits_log_usage():
    """Check server log usage on Storm servers."""
    sudo("du -hs /var/log/cogtree")

_mongo_servers = ["ue1a-parsely-mongo1{letter}.cogtree.com".format(letter=i)
                    for i in "abc"]
@task
@parallel
@hosts(_mongo_servers)
def mongo_uptime():
    sudo("uptime")
