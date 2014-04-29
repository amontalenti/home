from invoke import run, task

@task
def show_git_config():
    run("cat ~/.git/config")

