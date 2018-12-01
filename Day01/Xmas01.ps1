#############
## Functions
#############

# Lets parametersise the workingdirectory so that I don't have my personal info on the web!
Function Get-InputFile{
    $dir = $PSScriptRoot
    $filePath = $dir+"\PuzzleInput.txt"
    return $filePath
}

# Lets get that input in an iterable format
Function Get-InputFileContents {
    Param(
    [string]$file
    )
    Process
    {
        $read = New-Object System.IO.StreamReader($file)
        $inputArray = @()

        while (($line = $read.ReadLine()) -ne $null)
        {
            $inputArray += $line
        }

        $read.Dispose()
        return $inputArray
    }
}

# Let's remove the + or -
Function StripPlusAndMinus {
    Param(
        [string] $numberWithPlusOrMinus
        )
    return $numberWithPlusOrMinus -replace '[+-]',''
}

Function Xmas_Function01 {
    Param(
      $strNumbers
     )
     
     $total = 0
     foreach($strNumber in $strNumbers)
     {
        $number = StripPlusAndMinus($strNumber)
        if ($strNumber[0] -eq "+")
        {
            $total += $number
        }
        if($strNumber[0] -eq "-")
        {
            $total -= $number
        }
     }
     return $total
}

Function Xmas_Function02 {
    Param(
        $strNumbers
    )
    #Empty array to record each frequncy as they occur
    $frequencies = @()

    #Keep Track of the frequencies
    $total = 0
    $frequencies += $total #Add the starting frequency to the array
    $loopNumber =1
    for($index = 0; $index -lt $strNumbers.length; $index++)
    {
        
        $strNumber = $strNumbers[$index]
        $number = StripPlusAndMinus($strNumber)
        if ($strNumber[0] -eq "+")
        {
            $total += $number
        }
        if($strNumber[0] -eq "-")
        {
            $total -= $number
        }

        if($frequencies.Contains($total))
        {
            return $total
        }

        $frequencies += $total
        
        
        if($index -eq $strNumbers.Length-1)
        {
            $index = -1 #reset the loop (will be incremented before next loop to 0)
            $loopNumber+=1
            write-host "Starting loop number $loopNumber"
        }
     }
}

Function Xmas_Function02_Test01{

    $testArray = @("+1", "-1")
    $expected = 0
    $actual = Xmas_Function02($testArray)
    if($expected -eq $actual)
    {
        Write-Host "Test_01 Pass"
    }
    else
    {
        Write-Host "Test_01 Fail expected: $expected actual: $actual"
    }
}

Function Xmas_Function02_Test02{

    $testArray = @("+3", "+3", "+4", "-2", "-4")
    $expected = 10
    $actual = Xmas_Function02($testArray)
    if($expected -eq $actual)
    {
        Write-Host "Test_02 Pass"
    }
    else
    {
        Write-Host "Test_02 Fail expected: $expected actual: $actual"
    }
}
Function Xmas_Function02_Test03{

    $testArray = @("-6", "+3", "+8", "+5", "-6")
    $expected = 5
    $actual = Xmas_Function02($testArray)
    if($expected -eq $actual)
    {
        Write-Host "Test_03 Pass"
    }
    else
    {
        Write-Host "Test_03 Fail expected: $expected actual: $actual"
    }
}
Function Xmas_Function02_Test04{

    $testArray = @("+7", "+7", "-2", "-7", "-4" )
    $expected = 14
    $actual = Xmas_Function02($testArray)
    if($expected -eq $actual)
    {
        Write-Host "Test_04 Pass"
    }
    else
    {
        Write-Host "Test_04 Fail expected: $expected actual: $actual"
    }
}


#############
## Main
#############

#Lets get the file that has the input
$file = Get-InputFile
#Let's put that input file into a nice array
$input = Get-InputFileContents($file)
Xmas_Function01($input)
Xmas_Function02_Test01
Xmas_Function02_Test02
Xmas_Function02_Test03
Xmas_Function02_Test04
Xmas_Function02($input)
cmd /c pause | out-null
