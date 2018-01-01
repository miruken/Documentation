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