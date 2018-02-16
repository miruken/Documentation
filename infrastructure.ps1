function MustBeInDevelopRepository(){
    if(!$currentLocation.Path.EndsWith('Documentation', "CurrentCultureIgnoreCase")) {
        throw "Must be run from the root of the miruken Documentation repo."
    }
}

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
    Copy-Item -recurse -force $source $destination 
}

function Replace-Directory($source, $destination){
    Remove-Directory $destination
    Create-Directory $destination
    Copy-Directory   $source $destination
}