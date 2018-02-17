$source = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$source\infrastructure.ps1"
$currentLocation = Get-Location;

return Wrap({
    $targets = @(
        @{source="..\Specification";                      docFolder=".\doc"; destination="..\miruken.github.io\documentation\versions\Specification"}
        @{source="..\..\miruken-es5\miruken";             docFolder=".\doc"; destination="..\..\miruken\miruken.github.io\documentation\versions\miruken-es5\miruken";}
        @{source="..\..\miruken-dotnet\Miruken";          docFolder=".\Doc"; destination="..\..\miruken\miruken.github.io\documentation\versions\miruken-dotnet\Miruken"; }
        @{source="..\..\miruken-dotnet\Miruken.Mediate";  docFolder=".\Doc"; destination="..\..\miruken\miruken.github.io\documentation\versions\miruken-dotnet\Miruken.Mediate";}
        @{source="..\..\miruken-dotnet\Miruken.Mvc";      docFolder=".\Doc"; destination="..\..\miruken\miruken.github.io\documentation\versions\miruken-dotnet\Miruken.Mvc";}
        @{source="..\..\miruken-dotnet\SymbolDownloader"; docFolder=".\Doc"; destination="..\..\miruken\miruken.github.io\documentation\versions\miruken-dotnet\SymbolDownloader";}
    )

    $theme = "$currentLocation\doc\_themes"
    $conf  = "$currentLocation\doc"

    #Build versioned documentation for each repo 
    $targets | %{ 
        cd $_.source

        sphinx-versioning build -r master $_.docFolder $_.destination `
            -w master `
            -w develop `
            -- `
            -D html_theme=sphinx_rtd_theme `
            -D html_theme_path=$theme

        cd $currentLocation
    }
})
