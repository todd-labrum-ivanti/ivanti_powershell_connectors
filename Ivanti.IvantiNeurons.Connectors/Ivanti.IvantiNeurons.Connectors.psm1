<#

    .Author
        Ivanti
    .SYNOPSIS
        A simple module that uses dot sourcing to load all the functions used in Ivanti's Generic PowerShell connector.
    .DESCRIPTION
        When this module is imported, the functions are loaded in memory using dot sourcing.
    .Version
        1.0
    .LastUpdated
        2020-09-04

#>

# Get the path to the function files...
$functionPath = $PSScriptRoot + "\Functions\"

# Get a list of all the function category folder names...
$functionCategoryList = Get-ChildItem -Path $functionPath -Name

# Loop over all the folders, get the functions, and dot source them into memory...
foreach ($functionCategory in $functionCategoryList) {

    #Get all functions in the current folder
    $functionCategoryPath = ($functionPath + $functionCategory + "\")
    $functionList = Get-ChildItem -Path $functionCategoryPath -Name

    #Loop through all the functions in the current function category folder and dot source them
    foreach ($function in $functionList) {
    . ($functionCategoryPath + $function)
    }
}