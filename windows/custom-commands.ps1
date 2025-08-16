#run . "$env:USERPROFILE\dotfiles\custom-commands.ps1"

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi @args --cwd-file="$tmp"
    if (Test-Path $tmp) {
        $dir = Get-Content $tmp -Raw
        Remove-Item $tmp -Force
        if (Test-Path $dir -PathType Container) {
            Set-Location $dir
        }
    }
}

function cdf {
  cd "$(fd --type d --hidden --follow --exclude .git | fzf)"
}
