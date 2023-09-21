
# Function to clone a Git repository and return the path
path=$1
repoLink=$2
repoName=$(echo "$repoLink" | sed 's/.*\///;s/\.git$//')

cd $path
git clone $repoLink

cd $repoName
echo $PWD