# TUTORIAL
# open powershell
# type   notepad $profile


# Theme
Set-PoshPrompt -Theme paradox
Import-Module Get-ChildItemColor

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete


Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key "Alt+f" -Function ForwardWord
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function AcceptSuggestion
