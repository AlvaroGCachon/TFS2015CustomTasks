[CmdletBinding()]
param()

# This script opens a specific file selected from the Source Control Explorer, then finds a 
# specific section and reads the semantic versioning from it.
# The section is expected in the following form:
#       [assembly: SectionName("Major.minor.patch.build")]
Trace-VstsEnteringInvocation $MyInvocation
try {
    $assemblyversion = "0.0.0.0"
    #Read task variables.
    $assemblyfile = Get-VstsInput -Name assemblyfile
    $taskvariable = Get-VstsInput -Name taskvar
    $section = Get-VstsInput -Name section
    Write-Host ("Reading $assemblyfile.")
    
    if (Test-Path $assemblyfile) {
        #Exclude all lines from the file but the section we need. Then, get the semantic version with a RegExp.
        $sectionContents = Get-Content $assemblyfile | select-string -pattern "$section" 
        $regEx = "\d\.\d\.\d\.\d"
        if ($sectionContents -match $regEx){
            $assemblyversion = $matches[0]
            Write-Host ("$section is $assemblyversion.")
            
            #Write the value to a given task variable.
            Write-Host ("##vso[task.setvariable variable=$taskvariable;]$assemblyversion")
        } else {
            Write-Host ("No $section section was found in the given file.")
        }
    } else {
        throw "No file was found in the defined path."
    }
    
} finally {
    Trace-VstsLeavingInvocation $MyInvocation
}
