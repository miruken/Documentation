$branch      = $args[0]

cd ..\miruken.github.io
git add .
git commit -m "CI Documentation Build"
git push origin $branch
cd .\