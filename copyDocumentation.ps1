$source = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$source\infrastructure.ps1"

try{
    MustBeInDevelopRepository

    $branch      = $args[0]

    if(!$branch){
        throw "branch parameter is required"
    }

    $source      = ".\doc\_build\html\*"
    $destination = "..\miruken.github.io\documentation\$branch"

    Replace-Directory $source $destination    

    return 0
} catch {
    return 1
}

