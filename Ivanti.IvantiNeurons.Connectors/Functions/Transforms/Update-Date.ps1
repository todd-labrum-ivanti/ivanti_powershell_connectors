function Update-Date {
    param (
        [string]$dateString
    )
    if ([string]::IsNullOrEmpty($dateString)) {
        $date = $null
    }
    else {
        [datetime]$dateObject = $dateString
        $date = $dateObject.ToString("yyyy-MM-ddTHH\:mm\:ss.fff\Z")
    }
    return $date
}