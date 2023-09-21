##Used for running everything

repoData="reposForDebug.log"
reposPath="/Users/andreaskarlsson/Documents/Exjobb/algorithm/Validate/repos"
truckFactorToolPath="/Users/andreaskarlsson/Documents/Exjobb/algorithm/Validate/TruckFactorTool/truckfactor-tool"

echo "Started main"
while IFS= read -r line; do
    # Split the line into fields using ',' as the delimiter
    IFS=',' read -ra fields <<< "$line"
  
    # Extract the information
    repoName="${fields[0]}"
    date="${fields[1]}"
    repoLink="${fields[2]}"

    #Clone
    echo "Cloning: $repoName"
    clonePath=$(./clone.sh $reposPath $repoLink)

    #Checkout commit at specific date
    echo "Checking out commit for date: $date"
    ./checkout.sh $clonePath $date

    #Generate Files
    echo "Generating files"
    ./generateFiles.sh $truckFactorToolPath $clonePath

    #Calcualte the TF
    echo "Generating TFResult"
    TFresult=$(./runTruckFactorTool.sh $clonePath $repoName $truckFactorToolPath)

    #Calculate languages used
    #./generateFileLanguages.sh $clonePath


done < $repoData


