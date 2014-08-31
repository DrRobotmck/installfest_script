# SSH keys establish a secure connection between your computer and GitHub
# This script follows these instructions
# `https://help.github.com/articles/generating-ssh-keys`

# SSH Keygen
ssh-keygen -t rsa -C $github_email
ssh-add id_rsa

public_key=$(cat ~/.ssh/id_rsa.pub)

# Upload to github
curl https://api.github.com/user/keys \
  -H "User-Agent: WDIInstallFest" \
  -H "Accept: application/vnd.github.v3+json" \
  -u "$github_name:$github_password" \
  -d '{"title":"WDI Installfest", "key":"'"$public_key"'"}'

# TODO (h4w5) add assertion around ... "ssh -T git@github.com"
