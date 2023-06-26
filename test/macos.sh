# sysadminctl -deleteUser zsh_test
# sysadminctl -addUser zsh_test -admin -password test123
# # rm -rf /Users/zsh_test/.local/share/chezmoi 
# mkdir -p /Users/zsh_test/.local/share
cp -R ~/.local/share/chezmoi /Users/zsh_test/.local/share/chezmoi
chown -R zsh_test /Users/zsh_test/.local
uid=$(id -u "zsh_test")
launchctl asuser $uid chezmoi apply
# chezmoi init --apply brosu
