$source = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$source\infrastructure.ps1"
$currentLocation = Get-Location;

Wrap({
    git config --global user.email "mirukenjs@gmail.com"
    git config --global user.name  "build.miruken.com"
    cd ..\miruken.github.io
    git add .
    git commit -m "CI Documentation Build"

    $responses = git push origin master --porcelain
    forEach($response in $responses)
    {
        if($response -like "*rejected*"){
            throw "git push was rejected"
        }
    }

    cd $currentLocation
})

