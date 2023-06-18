# Init

1. Generate github token
  - https://github.com/settings/tokens/new
  - Privileges:
    - repo
    - read:org
    - admin:public_key
1. Run
  ```sh
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply brosu
  ```
  Use the token generated previously as password

# Test
Run
```
./test/test.sh
```
It will create an interactive docker container with all the files copied into it.

If the container exits without error (exit 0 command), commits the current state as a new image.

Further executions will be started using this image.
# Inspiration
- https://github.com/adyranov/dotfiles

