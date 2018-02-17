$source = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$source\infrastructure.ps1"

Wrap({
    $targets = @(
        @{source="..\..\miruken\Specification\doc\*";           destination=".\doc\miruken\Specification\doc\";}
        @{source="..\..\miruken-es5\miruken\doc\*";             destination=".\doc\miruken-es5\";}
        @{source="..\..\miruken-dotnet\Miruken\Doc\*";          destination=".\doc\miruken-dotnet\Miruken\Doc\";}
        @{source="..\..\miruken-dotnet\Miruken.Mediate\Doc\*";  destination=".\doc\miruken-dotnet\Miruken.Mediate\Doc\";}
        @{source="..\..\miruken-dotnet\Miruken.Mvc\Doc\*";      destination=".\doc\miruken-dotnet\Miruken.Mvc\Doc\";}
        @{source="..\..\miruken-dotnet\SymbolDownloader\Doc\*"; destination=".\doc\miruken-dotnet\SymbolDownloader\Doc\";}
    )

    Remove-Directory ".\doc\_build\"

    $targets | %{ Remove-Directory $_.destination } 
    $targets | %{ Create-Directory $_.destination }
    $targets | %{ Copy-Directory $_.source $_.destination }

    Copy-Item ".\miruken-dotnet-index.rst" ".\doc\miruken-dotnet\index.rst"
 
    cd .\doc
    ./make.bat html
    cd ..
})
