$targets = @(
    @{source="..\..\miruken-es5\miruken\doc\*";             destination=".\doc\miruken-es5\";}
    @{source="..\..\miruken-dotnet\Miruken\Doc\*";          destination=".\doc\miruken-dotnet\Miruken\Doc\";}
    @{source="..\..\miruken-dotnet\Miruken.Mediate\Doc\*";  destination=".\doc\miruken-dotnet\Miruken.Mediate\Doc\";}
    @{source="..\..\miruken-dotnet\Miruken.Mvc\Doc\*";      destination=".\doc\miruken-dotnet\Miruken.Mvc\Doc\";}
    @{source="..\..\miruken-dotnet\SymbolDownloader\Doc\*"; destination=".\doc\miruken-dotnet\SymbolDownloader\Doc\";}
)

function Remove-Directory($directory)
{
    $directoryExists = Test-Path($directory) 
    if($directoryExists -eq $True)
    {
        Remove-Item -recurse $directory
    }
}
function Create-Directory($directory)
{
    $directoryExists = Test-Path($directory) 
    if($directoryExists -ne $True)
    {
        md -force $directory | Out-Null
    }
}
function Copy-Directory($source, $destination){
    Copy-Item -recurse $source $destination 
}

$targets | %{ Remove-Directory $_.destination } 
$targets | %{ Create-Directory $_.destination }
$targets | %{ Copy-Directory $_.source $_.destination }

Copy-Item ".\miruken-dotnet-index.rst" ".\doc\miruken-dotnet\index.rst"
 
cd .\doc
./make.bat html
cd ..