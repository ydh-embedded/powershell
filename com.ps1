$workingDirectory = Get-Location                               #1
$outputDirectory = "C:\working-directory\jdk\output"           #2
$sourceRoot = "C:\working-directory\jdk"                       #3
$javaRoot = "C:\working-directory\jdk\JDK21\jdk-21.0.2\bin"    #4


$env:PATH = "$javaRoot;" + $env:PATH                            #5


Set-Location $sourceRoot                                        #6

$sourceFiles = Get-ChildItem -Recurse *.java | ForEach-Object { $_.FullName }#7

$jv = java --version

foreach ($file in $sourceFiles) {                               #8
    Write-Host -ForegroundColor Blue "Java-Version: $jv"
    Write-Host -ForegroundColor Cyan "Übersetze die Datei: $file"
    #Write-Host -ForegroundColor lightgreen "Übersetze die Datei: $file"

    #javac $file -d $outputDirectory   #NOTE nur verwenden, wenn ein Ordner mit allen class-Dateien erzeugt werden soll!
}


Set-Location $workingDirectory                                  #9