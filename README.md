# init

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply brosu

# Git init
## Generate token
- https://github.com/settings/tokens/new
- Privileges:
  - repo
  - read:org
  - admin:public_key
## Run
``` bash
export TOKEN=
git clone https://outh:$TOKEN@github.com/brosu/init.git
```
