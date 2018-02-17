function Wrap {
    param (
            [Parameter(Mandatory)]
            [Scriptblock] $Action
    )
    try{
        MustBeInDocumentationRepository
        Invoke-Command $Action
        return 0
    }catch{
        Write-Error $_
        return 1
    }
}

function MustBeInDocumentationRepository(){
    $directory = pwd
    if(!$directory.Path.EndsWith('Documentation', "CurrentCultureIgnoreCase")) {
        throw "Scripts must be run from the root of the miruken Documentation repo."
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

function Get-ScriptDirectory
{
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value;
    if($Invocation.PSScriptRoot)
    {
        $Invocation.PSScriptRoot;
    }
    Elseif($Invocation.MyCommand.Path)
    {
        Split-Path $Invocation.MyCommand.Path
    }
    else
    {
        $Invocation.InvocationName.Substring(0,$Invocation.InvocationName.LastIndexOf("\"));
    }
} 
