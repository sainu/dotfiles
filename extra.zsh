#!/usr/bin/env zsh

source ./util.zsh

local script_dir=$(dirname "$0")
local extra_path="$script_dir/.extra"

if [[ -f $extra_path ]]; then
  print_skip_msg "Create $extra_path"
  return 0
fi

print_create_msg $extra_path

echo "Please enter the value of \"GIT_AUTHOR_NAME\":"
read author_name
echo "Please enter the value of \"GIT_AUTHOR_EMAIL\":"
read author_email

local extra_content=`cat << EOF
#!/usr/bin/env zsh

# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="$author_name"
GIT_COMMITTER_NAME="\\$GIT_AUTHOR_NAME"
git config --global user.name "\\$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="$author_email"
GIT_COMMITTER_EMAIL="\\$GIT_AUTHOR_EMAIL"
git config --global user.email "\\$GIT_AUTHOR_EMAIL"
EOF`

echo ""
echo "$extra_path will be created with this:"
echo "-------------------------------------"
echo $extra_content
echo "-------------------------------------"
echo ""

echo $extra_content > $extra_path
