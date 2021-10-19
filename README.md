dotrc
===

bashrc & zshrc (need oh-my-zsh first)

install
======

* `git-get https://github.com/atttx123/dotrc.git`
* `bash install.sh`

requirements
======

* oh-my-zsh: `git-get https://github.com/ohmyzsh/ohmyzsh.git && ln -sf $GIT_PATH/ohmyzsh/ohmyzsh ~/.oh-my-zsh`
* ack: `brew install ack`(on OS X) or `apt install ack-grep`(on Ubuntu、Debian)
* zsh-autosuggestions: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
