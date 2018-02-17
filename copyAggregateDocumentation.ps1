$source = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$source\infrastructure.ps1"

Wrap({
    $branch = $args[0]

    if(!$branch){
        throw "branch parameter is required"
    }

    $source      = ".\doc\_build\html\*"
    $destination = "..\miruken.github.io\documentation\$branch"

    Replace-Directory $source $destination    
})
