# Get the repo information from the args
repo_url=$1

# Extract the repo name
repo=${repo_url##*/}
len=${#repo}
repo=${repo:0:len - 4}

# Change the working directory to the repo
mkdir $repo
cd $repo

# Mirror the repo and then change it from being a bare repo
git clone --mirror $repo_url .git
git config --unset core.bare
git reset --hard
