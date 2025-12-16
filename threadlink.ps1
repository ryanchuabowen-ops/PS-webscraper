
$threadLink = Read-Host -Prompt "Type in thread link(entire link, nigglet)"
$4chan = Invoke-WebRequest -Uri $threadLink

#more fluid now, more concise
@($4chan.Links.href).ForEach({

if($_ -Match "i.4cdn.org" -and $_ -notmatch "#"){

$temp = $_ -replace "//","https://"
$number = $_ -replace "s",""|Split-Path -Leaf
$inside = Invoke-WebRequest -Uri ($temp)

Invoke-WebRequest -Uri $temp -OutFile ("C:\Users\Public\Pictures\Image Scraper\" + $number)

}

})