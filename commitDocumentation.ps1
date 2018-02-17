$source = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$source\infrastructure.ps1"
$currentLocation = Get-Location;

Wrap({
    git config --global user.email "mirukenjs@gmail.com"
    git config --global user.name  "build.miruken.com"
    cd ..\miruken.github.io
    git add .
    git commit -m "CI Documentation Build"
    git push origin master
    cd $currentLocation
})

