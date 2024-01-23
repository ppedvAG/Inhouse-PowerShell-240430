[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5,

[string]$Computername = "localhost"
)
Write-Verbose -Message "Ich gebe eine zusätzliche Ausgabe aus wenn das Skript mit -verbose gestartet wird. Anforderung ist hierbei das [cmdletBinding()]"
Write-Verbose -Message "Vor der Abfrage, $EventId , $Newest , $Computername"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest


