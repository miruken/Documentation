$source = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$source\infrastructure.ps1"

$branch          = $args[0]
$currentLocation = Get-Location;

$targets = @(
    @{source="..\..\miruken\Specification\doc\*";           destination=".\doc\miruken\Specification\doc\";           buildOutput="..\miruken.github.io\documentation\Specification"}
    @{source="..\..\miruken-es5\miruken\doc\*";             destination=".\doc\miruken-es5\doc";                      buildOutput="..\miruken.github.io\documentation\miruken-es5";}
    @{source="..\..\miruken-dotnet\Miruken\Doc\*";          destination=".\doc\miruken-dotnet\Miruken\Doc\";          buildOutput="..\miruken.github.io\documentation\Miruken";}
    @{source="..\..\miruken-dotnet\Miruken.Mediate\Doc\*";  destination=".\doc\miruken-dotnet\Miruken.Mediate\Doc\";  buildOutput="..\miruken.github.io\documentation\Miruken.Mediate";}
    @{source="..\..\miruken-dotnet\Miruken.Mvc\Doc\*";      destination=".\doc\miruken-dotnet\Miruken.Mvc\Doc\";      buildOutput="..\miruken.github.io\documentation\Miruken.Mvc";}
    @{source="..\..\miruken-dotnet\SymbolDownloader\Doc\*"; destination=".\doc\miruken-dotnet\SymbolDownloader\Doc\"; buildOutput="..\miruken.github.io\documentation\SymbolDownloader";}
)

Remove-Directory ".\doc\_build\"

$targets | %{ Remove-Directory $_.destination } 
$targets | %{ Create-Directory $_.destination }
$targets | %{ Copy-Directory $_.source $_.destination }

#This is the top level index file for the aggregate documentation
Copy-Item ".\miruken-dotnet-index.rst" ".\doc\miruken-dotnet\index.rst"

#Build the aggregated documentation
#sphinx-build -a .\doc "..\miruken.github.io\documentation\$branch"

#Build versioned documentation for each repo 
#$targets | %{ 
#    sphinx-versioning build -r $branch $_.source $_.buildOutput 
#}

cd "..\..\miruken-es5\miruken\doc\"
sphinx-versioning build -r develop ".\doc" "..\..\miruken\miruken.github.io\documentation\miruken-es5"
cd $currentLocation

