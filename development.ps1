$source = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$source\infrastructure.ps1"

Wrap({
    $branch = "develop"
    #. .\buildAggregateDocumentation.ps1 $branch
    . .\copyAggregateDocumentation.ps1  $branch
    #. .\buildVersionedDocumentation.ps1
})