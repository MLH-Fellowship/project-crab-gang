#!/usr/bin/bash

PROJECT_DIR="/root/projects/project-crab-gang"
cd $PROJECT_DIR || exit

inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ "$inside_git_repo" ]; then
	git fetch && git reset origin/main --hard
else
	echo "Current dir does not use git"
	exit
fi



PROJECTS_DIR="/root/projects/"
FLASK_ENV="/root/projects/flask"

if [[ ! -d "FLASK_ENV" ]]; then
	cd "$PROJECTS_DIR" || exit
	python -m venv flask
	cd "$PROJECT_DIR" || exit
fi

source "$FLASK_ENV"/bin/activate

pip install -r requirements.txt

systemctl daemon-reload
systemctl restart myportfolio.service
