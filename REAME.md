# A simple CI/CD shell script

Weeks ago I encountered a problem of being unable to pull docker images from docker hub causing test and build jobs fail on development environment so I came up with this solution of using [Buddy](https://buddy.works/) to get notified of pushes on codebase (you can definitely use webhooks, for more information read [Gitlab Docs](https://docs.gitlab.com/ee/user/project/integrations/webhooks.html)) and some shell scripts to hanle build and run of application (in my case a dotnet application).

The solution is to run `start.sh` from a remote server (thanks to Buddy) via ssh. `start.sh` does some pre-build and pre-deploy stuff (like deleting and recreating a mysql database in this example). This solution is using [screen](https://www.gnu.org/software/screen/) instead of running applications or tasks inside a docker container so we would handle screen termination and re-run inside `start.sh`.

Then calling `deploy.sh` to run inside a screen (to be detached from main and default shell) will start to build and then run the application. Note that there is a git ssh-key set for repository (with just read premissions and inside the build environment, not here) to be used for `git pull` command of `deploy.sh` to pull latest updates from codebase.

This is a very simple example using a contaminated environment for build stuff but it can help you with your hard times of having connection issues with docker hub.