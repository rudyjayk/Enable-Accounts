$bool = $true

while($bool){

    $User = Read-Host -Prompt 'Input User to be enabled'
    $Decision = Read-Host -Prompt "`nYou have inputted user $User`nAre you sure you want to enable? (Yes or No)"

    if($Decision -like 'No'){
        
        $redo = Read-Host -Prompt "Do you want to enter another User? (Yes or No)"

        if($redo -like 'Yes'){
            Write-Host "`nRestarting Process..."
            Clear-Host
            Continue    
        }
        elseif($redo -like 'No'){
            Write-Host "`nTerminating Script!"
            Exit
        }
        else{
            Write-Host "`nNot a valid input, Terminating Script!"
            Exit
        }
    }
    elseif($Decision -like 'Yes'){
        Write-Host "`nEnabling User"
        Enable-ADAccount -Identity $User
        
        Write-Host "`nUnlocking User"
        Unlock-ADAccount -Identity $User
        
        Write-Host "`nClearing Description"
        Set-ADUser $User -Description $null

        $bool = $false
    }
    else{
          
        Write-Host "`nNot a valid input"
        $redo = Read-Host -Prompt "Do you want to enter another User? (Yes or No)"

        if($redo -like 'Yes'){
            Write-Host "`nRestarting Process..."
            Clear-Host
            Continue    
        }
        elseif($redo -like 'No'){
            Write-Host "`nTerminating Script!"
            Exit
        }
        else{
            Write-Host "`nNot a valid input, Terminating Script!"
            Exit
        }
    }

}

Write-Host "`nUser has been Enabled and ready to use!"
Exit

