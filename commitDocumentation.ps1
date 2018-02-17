try{

    MustBeInDocumentationRepository

    $branch = $args[0]
    
    git config --global user.email "mirukenjs@gmail.com"
    git config --global user.name  "build.miruken.com"
    cd ..\miruken.github.io
    git add .
    git commit -m "CI Documentation Build"
    git push origin master
    cd .\

    return 0
} catch {
    Write-Error $_
    return 1
}

