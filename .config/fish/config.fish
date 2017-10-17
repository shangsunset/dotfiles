set $EDITOR vim

# GOROOT
set -x GOROOT /usr/local/opt/go/libexec
# GO
set -x GOPATH $HOME/.go

# add the go bin path to be able to execute our programs
set -x PATH $PATH $GOROOT/bin $GOPATH/bin

# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end
