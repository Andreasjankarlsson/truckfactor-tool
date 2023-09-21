truckToolPath=$1
gitRepoPath=$2

cd $truckToolPath
./commit_log_script.sh $gitRepoPath
./linguist_script.sh $gitRepoPath