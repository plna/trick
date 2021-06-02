# TUTORIAL
# open powershell
# type   notepad $profile




# Theme
Set-PoshPrompt -Theme pure
Import-Module Get-ChildItemColor

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key "Alt+f" -Function ForwardWord
Set-PSReadLineKeyHandler -Key "Alt+f" -Function ForwardWord
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function AcceptSuggestion
