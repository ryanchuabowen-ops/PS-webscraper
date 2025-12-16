

$board = Read-Host -Prompt "Give board, faggot(no slashes, just letter)"
$4chan = Invoke-WebRequest -Uri ('boards.4chan.org/' + $board + '/')

#more fluid now, more concise
@($4chan.Links.href).ForEach({
#for security purposes after getting compiled need a way to abort process. every time the foreach loop goes through the code, app detects if shift keys are pressed. also, removed write-host in the actual codes since we only use write-host to during development to check if app prints out correct things to make sure if app is functioning the way I wanted it to. 

if($_ -Match "thread"){
if($_ -notmatch "#"){
$inside = Invoke-WebRequest -Uri ("boards.4chan.org/"+ $board +"/" + $_)
@($inside.Images.src).ForEach({
$insideinside = $_ -replace "s",""|Split-Path -Leaf
Invoke-WebRequest -Uri ('i.4cdn.org/b/' + $insideinside) -OutFile ("C:\Users\Public\Pictures\Image Scraper\" + $insideinside)
})
}
}

})