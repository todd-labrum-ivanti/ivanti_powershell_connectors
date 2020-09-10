#Set threshold to filter out devices based on desired time frame (e.g. only get devices active in the last 30 days). 
function Set-StaleThreshold {
    param (
        [int]$StaleThreshold,
        $LastSeen
    )
   
    #Can use practically any date-time variable returned from the API for threshold value. Need an input parameter in this function (in this example $LastSeen) that you will input your threshold variable into at the time of execution.
    if ($StaleThreshold -ne 0 ) {
        if ($null -ne $LastSeen) {

            $timeSpan = New-TimeSpan -Start $LastSeen -End (Get-Date).ToUniversalTime()

            if ($StaleThreshold -le $timeSpan.Days) {
                break
            }
        }
    }
}