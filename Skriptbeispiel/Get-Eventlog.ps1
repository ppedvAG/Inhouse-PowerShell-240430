<#
.Synopsis
   Skript zur Abfrage von LogonEvents
.DESCRIPTION
   Mit diesem Skript können Events aus dem Log SEcurity abgefragt werden. Es sind die Typen Anmeldung, Abmeldung und fehlgeschlagene Anmeldung möglich.
.EXAMPLE
   Get-Eventlog.ps1 -EventId 4634 

   Hier werden Standardmäßig die aktuellensten 5 Abmeldungen abgefragt da die Eventid 4634 für die Abmeldung steht
.EXAMPLE
   Get-Eventlog.ps1 -Computername localhost -EventId 4624 -Newest 4

   Hier werden expliziet die aktuellesten 4 Anmeldungen vom localhost abgefragt
.PARAMETER EventId
    4624 | Anmeldung
    4625 | fehlschlagene Anmeldung
    4634 | Abmeldung
.NOTES
  Author: StefanO@ppedv.de
  Erstellt am: 23.01.2024
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#syntax-for-comment-based-help-in-scripts
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)]
[int]$EventId,

[ValidateRange(5,10)]
[int]$Newest = 5,

[string]$Computername = "localhost"
)

$Newest = 23
Write-Verbose -Message "Ich gebe eine zusätzliche Ausgabe aus wenn das Skript mit -verbose gestartet wird. Anforderung ist hierbei das [cmdletBinding()]"
Write-Verbose -Message "Vor der Abfrage, $EventId , $Newest , $Computername"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest


