#!/usr/bin/env sh
GITLAB_PWD=$(cat /etc/gitlab/initial_root_password | grep Password: | awk '{print $2}')
GITLAB_PWD_ENCODED=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$GITLAB_PWD''', 'urlencode_safe'))")
cd exemple/
git config --global user.email "root@localhost"
git config --global user.name "root"
git remote set-url origin http://root:${GITLAB_PWD_ENCODED}@localhost/root/Exemple-Project.git
git add .
git commit -m "Initial commit"
git push --set-upstream origin main
echo "GitLab root password: $GITLAB_PWD"