$gistUrl = "https://gist.github.com/athaser/a202e249f57970a782d8ce4633a9e658/raw"

$localPath = "$env:TEMP\gist_script.ps1"

Invoke-WebRequest -Uri $gistUrl -OutFile $localPath

& $localPath
