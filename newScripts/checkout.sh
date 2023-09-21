gitRepoPath=$1
targetDate=$2
cd $gitRepoPath
commitHash=$(git rev-list -1 --before="$targetDate" HEAD)

git checkout "$commitHash"
