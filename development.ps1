$branch = "develop"

. .\buildAggregateDocumentation.ps1 $branch
. .\copyDocumentation.ps1  $branch

. .\buildVersionedDocumentation.ps1