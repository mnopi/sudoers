#  sudoers

## Install 
`bash`, `git` and `man` will be installed by the installer in all but Busybox image.

Prerequisites Debian Like (slim images, i.e.: Python slim, Zsh, etc.): 
`apt update && apt install -y curl`

* **curl** [macOS, Archlinux, Centos, Fedora, Debian Like (i.e.: bullseye)]: 
`curl -fksSL mnopi.com/sudoers | sh [-s <password>]`
* **wget** [Busybox (Alpine, Bash, Bats, nix), Debian Like (i.e.: bullseye)]: 
`wget -q -O - mnopi.com/sudoers | sh [-s <password>]`
* **git**: 
`git clone https://mnopi.com/sudoers && ./sudoers [password]`

## Caveats
It will not prompt for password to be saved if `curl -fksSL mnopi.com/sudoers | sh`, since it would error *`stdin isn't a terminal`*

Therefore use `sh -c "$(curl -fksSL mnopi.com/sudoers)"` to be prompted for password so it can be saved.

## Links
[GitHub raw sudoers script](https://raw.githubusercontent.com/j5pu/sudoers/main/sudoers)

[mnopi sudoers redirect](https://mnopi.com/sudoers)

