$branch = "develop"

MustBeInDocumentationRepository

. .\buildAggregateDocumentation.ps1 $branch
. .\copyAggregateDocumentation.ps1  $branch
. .\buildVersionedDocumentation.ps1