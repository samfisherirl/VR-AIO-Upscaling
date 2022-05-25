$file_data = Get-Content $Env:ALLUSERSPROFILE'\GameFolder.txt' #read the ahk sent log of directory
$select_level = Get-Content $Env:ALLUSERSPROFILE'\Levels.txt' #read the ahk sent log of directory
$file_return = "${Env:ALLUSERSPROFILE}" + "\Return.txt"   #set variable for writing file back to ahk
#Get-ChildItem -Recurse -Path $file_data -Include '*openvr_api.dll' | select Directory | ft -HideTableHeaders | Out-File -FilePath $file_return -Force
#notes for sending data back to ahk
if($select_level -eq "High")
{
	$fsr = ".\bin\fsr\*"
	$ovr = ".\bin\ovr\*"
}
else {
	$fsr = ".\bin\fsr low\*"
	$ovr = ".\bin\ovr low\*"
		
}

$ChildItems = Get-ChildItem -Recurse -Path $file_data -Include '*openvr_api.dll' #search for openvr_api
Copy-Item -Path $fsr -Destination $file_data -Recurse -Force #copy items from folder to GAME EXE
Copy-Item -Path $ovr -Destination $ChildItems.directory -Recurse -Force #copy items to OPENVRAPI folder


