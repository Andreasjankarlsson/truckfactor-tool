gitPath=$1
repoName=$2
toolPath=$3

cd $toolPath
java -jar gittruckfactor.jar $gitPath $repoName > $gitPath/TFresults.log

echo "Created TFResults"