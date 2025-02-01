Get-Process * -IncludeUserName | ForEach-Object UserName | Select-Object -Unique
