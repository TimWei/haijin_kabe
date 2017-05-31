$files = Get-ChildItem .\img\ |  Foreach-Object {$_.Name}
$rand = Get-Random $files.length
$FILE = "\img\" + $files[[int]$rand]

Function Set-WallPaper($Value)
{
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

function change_wall()
{
    $full_path = $pwd.Path + $FILE
    Set-WallPaper -value $full_path
}

function rm_file()
{
    if ($FILE.EndsWith(".jpg") -Or $FILE.EndsWith(".png"))
    {
        Remove-Item ($pwd.Path + $FILE)
    }
}

function main()
{
    change_wall
    Write-Host "set $FILE as wallpaper"
    if(!(Test-Connection -Cn google.com -BufferSize 16 -Count 1 -ea 0 -quiet))
    {
        Write-Host "google.com is offline"
    }
    else
    {
        if ($files.length -eq 0)
        {
            Write-Host "no files"
            return 0
        }
        rm_file
    }

}

main