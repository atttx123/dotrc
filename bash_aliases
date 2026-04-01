alias apt-proxy-on="sudo mv /etc/apt/apt.conf.d/proxy.conf.bak /etc/apt/apt.conf.d/proxy.conf"
alias apt-proxy-off="sudo mv /etc/apt/apt.conf.d/proxy.conf /etc/apt/apt.conf.d/proxy.conf.bak"
alias apt-proxy-status="cat /etc/apt/apt.conf.d/proxy.conf"
alias kvm-rmmod="sudo rmmod kvm_amd kvm"
alias kvm-modprobe="sudo modprobe kvm kvm_amd"

alias f='export {HTTP,HTTPS,FTP,ALL}_PROXY="http://127.0.0.1:20127"'
alias ff='unset {HTTP,HTTPS,FTP,ALL}_PROXY'
export NO_PROXY="localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24"
alias F='gsettings set org.gnome.system.proxy mode manual'
alias FF='gsettings set org.gnome.system.proxy mode none'
alias FS='gsettings get org.gnome.system.proxy mode'

alias jumpstat='autojump -s'
