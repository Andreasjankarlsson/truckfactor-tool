#Ignore this for now

repoPath=$1
cd $repoPath

first_commit_date=$(git log --reverse --format=%ad --date=short | head -n 1)
number_of_contributors=$(git shortlog -s | wc -l)

echo -e "first_commit_date: $first_commit_date \n number_of_contributors $number_of_contributors"
