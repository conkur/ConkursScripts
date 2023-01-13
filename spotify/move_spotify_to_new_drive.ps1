Param (
    # AppData directory for the Spotify installs local to the profile
    [Parameter()] 
    $AppDataPath = "$env:USERPROFILE\AppData",

    # Destination for symbolic link
    [Parameter()]
    $Destination = "M:\Software\Spotify"
)

$strAppDataLocalSpotify = "$AppDataPath\Local\Spotify"
$strAppDataRoamingSpotify = "$AppDataPath\Roaming\Spotify"

$strLocalDestination = "$Destination\Local\Spotify"
$strRoamingDestination = "$Destination\Roaming\Spotify"

if (!(Test-Path -Path $strLocalDestination)) {
    New-Item -ItemType Directory -Path $strLocalDestination -Force
}

if (!(Test-Path -Path $strRoamingDestination)) {
    New-Item -ItemType Directory -Path $strRoamingDestination -Force
}

if (Test-Path -Path $strAppDataLocalSpotify) {
    Copy-Item -Recurse -Path $strAppDataLocalSpotify -Destination "$Destination\Local" -Force
    Remove-Item -Recurse -Path $strAppDataLocalSpotify -Force
}

if (Test-Path -Path $strAppDataRoamingSpotify) {
    Copy-Item -Recurse -Path $strAppDataRoamingSpotify -Destination "$Destination\Roaming" -Force
    Remove-Item -Recurse -Path $strAppDataRoamingSpotify -Force
}

cmd /c MKLINK /J $strAppDataLocalSpotify $strLocalDestination
cmd /c MKLINK /J $strAppDataRoamingSpotify $strRoamingDestination

# Example of how to run the cmdlet created by the function above
# ./... -AppDataPath "$env:USERPROFILE\AppData" -Destination "M:\Software\Spotify"
