 <#
    .SYNOPSIS
    Run to decrypt a secure string.

    .DESCRIPTION
    Decrypts and returns PowerShell secure strings.

    .PARAMETER SecString
    Mandatory. The secure string that will be decrypted.

    .NOTES
    Author:  Ivanti
    Version: 1.0.0
#>

#Function to decrecypt secure strings
function Get-DecryptString {
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $false)]
        [SecureString]$SecString
    )

    #Method for decrypting a secure string differs between older and newer PS versions so logic is needed to check version and use appropriate method.
    if ($PSVersionTable.PSVersion.Major -ge 7) {
        try {
            $DecryptedString = ConvertFrom-SecureString $SecString -AsPlainText
        }
        catch {
            $logMessage = "Unable to decrypt $SecString"
            Write-Error -Message $logMessage -ErrorAction Stop
        }
    }
    else {
        try {
            $DecryptedString = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecString))
            return $DecryptedString
        }
        catch {
            $logMessage = "Unable to decrypt $SecString"
            Write-Error -Message $logMessage -ErrorAction Stop
        }
    }
    return $DecryptedString
}