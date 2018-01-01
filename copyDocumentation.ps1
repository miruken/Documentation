$source = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$source\infrastructure.ps1"

$branch      = $args[0]
$source      = ".\doc\_build\html\*"
$destination = "..\miruken.github.io\documentation\$branch"

Remove-Directory $destination
Create-Directory $destination
Copy-Directory   $source $destination
