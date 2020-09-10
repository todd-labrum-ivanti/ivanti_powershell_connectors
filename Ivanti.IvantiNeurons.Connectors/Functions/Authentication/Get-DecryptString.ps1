#Function to decrecypt secure strings
function Get-DecryptString {
    param (
        $SecString
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

}