if [ -f ~/.zshrc ]; then
    source ~/.zshrc
fi

eval "$(nodenv init -)"
echo "nodenv loaded!"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
echo "pyenv loaded!"
