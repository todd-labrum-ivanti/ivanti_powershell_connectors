function Edit-BoundAdapterArray {
    param (
        [string] $localip,
		[string] $macaddress
    )

    if ([string]::IsNullOrEmpty($localip ) -and [string]::IsNullOrEmpty($macaddress)) {
        $object = $null
        return $object 
    }
    else {
        $objectTable = New-Object System.Data.DataTable
            [void]$objectTable.Columns.Add("Number", "System.Int32")
			[void]$objectTable.Columns.Add("IPAddress", "System.String")
			[void]$objectTable.Columns.Add("PhysicalAddress", "System.String")
    
            $newRow = $objectTable.NewRow()
            $newRow.Number = 0
			$newRow.IPAddress = $localip
			$newRow.PhysicalAddress = $macaddress
            $objectTable.Rows.Add($newRow)
            
            $object = $objectTable | Select-Object * -ExcludeProperty ItemArray, Table, RowError, RowState, HasErrors 
            return $object
    }
}