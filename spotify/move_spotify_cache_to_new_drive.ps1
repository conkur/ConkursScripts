Param (
    # AppData directory for the Spotify installs local to the profile
    [Parameter()] 
    $SpotifyDataPath = "M:\Software\Spotify\Local\Spotify\Data",

    # Destination for symbolic link
    [Parameter()]
    $Destination = "D:\Files\Other\SpotifyCache\Spotify\Local\Spotify\Data"
)

cmd /c MKLINK /J $SpotifyDataPath $Destination
