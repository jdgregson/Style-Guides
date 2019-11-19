# Anything not covered here must follow the Posh Code style guide:
#     [PowerShellPracticeAndStyle](https://github.com/PoshCode/PowerShellPracticeAndStyle)
#
# General rules:
# - Parameters (script, function, etc.) MUST use TitleCaseLikeThis
# - Variables (local, script, etc.) MUST use camelCaseLikeThis
# - Constants MUST use UPPER_CASE_AND_UNDERSCORES
# - Language keywords MUST be lower case (if, while, foreach, etc.)
# - Braces MUST use OTBS (open on same line)
# - Parentheses MUST NOT have inner whitespace: (good) but ( very bad )
# - Functions MUST use the "Advanced" syntax as seen in Do-SomethingNow below

Param (
    [Switch]$Verbose
)

function Do-SomethingNow {
    [CmdletBinding()]
    Param (
        [Parameter(
            Mandatory = $true,
            ParameterSetName = 'NameSet01',
            ValueFromPipeline = $true
        )]
        [String]$ArgOne,

        [Parameter(Mandatory = $true)]
        [Boolean]$ArgTwo,

        [Parameter(Mandatory = $true)]
        [AllowEmptyCollection()]
        [String[]]$ComputerName,

        [Switch]$Verbose,

        [Int]$SomeDefaultVar = 3
    )

    begin {
        $myArg = "$ArgOne, $ArgTwo"
    }
    process {
        if ($SomeDefaultVar -ne 3) {
            Write-Host "Using the default"
        } elseif ($SomeDefaultVar -eq 4) {
            Write-Host "Using the wrong value"
        } else {
            exit
        }

        while ($true) {
            Sleep 4
        }
    }
}

