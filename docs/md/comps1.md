# Powershell Anweisung um den Java-Compiler zu starten

  ### #1 wir speichern die aktuelle Lokation in der variable working Directory
  ### #2 Wir legen einen Ordner fest wo alle compilierten Dateien exportiert werden       soll
  ### #3 wir legen den zu untersuchenden Root-Ordner an
  ### #4 wir teilen dem Prg mit wo die java.exe zu finden ist und
  ### #5 Notwendig, damit javac.exe gefunden werden kann.
  ### #6 In Quellenverzeichnis wechseln.
  ### #7 Alle java Dateien in allen Unterverzeichnissen suchen.
  ### #8 Jede Quelltextdatei kompilieren
  ### #9 Altes Arbeitsverzeichnis wiederherstellen.

```powershell

 $workingDirectory = Get-Location                                               #1
 $outputDirectory = "C:\working-directory\jdk\output"                           #2
 $sourceRoot = "C:\working-directory\jdk"                                       #3
 $javaRoot = "C:\working-directory\jdk\JDK21\jdk-21.0.2\bin"                    #4
 
 
 $env:PATH = "$javaRoot;" + $env:PATH                                           #5
 
 
 Set-Location $sourceRoot                                                       #6
 
 $sourceFiles = Get-ChildItem -Recurse *.java | ForEach-Object { $_.FullName }  #7
 
 $jv = java --version
 
 foreach ($file in $sourceFiles) {                                              #8
     Write-Host -ForegroundColor orange "Java-Version: $jv"
     Write-Host -ForegroundColor Cyan "Übersetze die Datei: $file"
     #javac $file -d $outputDirectory   #NOTE nur verwenden, wenn ein Ordner mit  allen class-Dateien erzeugt werden soll!
 }
 
 
 Set-Location $workingDirectory                                                 #9
 ```
