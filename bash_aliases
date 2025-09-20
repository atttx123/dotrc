alias apt-proxy-on="sudo mv /etc/apt/apt.conf.d/proxy.conf.bak /etc/apt/apt.conf.d/proxy.conf"
alias apt-proxy-off="sudo mv /etc/apt/apt.conf.d/proxy.conf /etc/apt/apt.conf.d/proxy.conf.bak"
alias apt-proxy-status="cat /etc/apt/apt.conf.d/proxy.conf"
alias kvm-rmmod="sudo rmmod kvm_amd kvm"
alias kvm-modprobe="sudo modprobe kvm kvm_amd"
alias f='export {HTTP,HTTPS,FTP,ALL}_PROXY="http://127.0.0.1:20171"'
alias ff='unset {HTTP,HTTPS,FTP,ALL}_PROXY'
