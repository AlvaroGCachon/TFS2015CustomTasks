[CmdletBinding()]
param()

Trace-VstsEnteringInvocation $MyInvocation
try {
    #Read message and log it.
    $echovar = Get-VstsInput -Name echovar
    Write-Host ("$echovar")
} finally {
    Trace-VstsLeavingInvocation $MyInvocation
}
