param (
  [string]$repository = "nitin27may/", #repository name, required for docker hub
  [string]$imageName = "mean", # image name
  [string]$username = $(Read-Host "Input user name" ), # registry username
  [SecureString]$securedPassword = $(Read-Host "Enter a Password" -AsSecureString), # registry password
  [Parameter(Mandatory = $true, HelpMessage = "Image Tag.")]
  [string]$tag = "1.0.0", # variable for image tag
  [string]$dockerhost = "", # Container registry URL, if blank will try to connect docker hub
  [string]$workspace = "D:\Workplace\mean-docker" # Source code where dockerfile is present 
)

$password = ConvertFrom-SecureString -SecureString $securedPassword -AsPlainText

try {
  $checkLogin = docker login -u $username -p $password $dockerhost
  if ( $checkLogin -eq "Login Succeeded") {

    Write-Output "changing the path to build context..."

    Set-Location $workspace

    Write-Output "Building Image..."

    docker build -t $($imageName +":"+$tag) .

    Write-Output "Tagging it..."

    docker tag $($imageName +":"+$tag)  $($dockerhost + $repository + $imageName + ":" + $tag)

    Write-Output "Image push..."

    docker push $($dockerhost + $repository + $imageName + ":" + $tag)
  }

}
catch {
  Write-Output "Some error occured."
}
finally {
  docker image rm $($dockerhost + $repository + $imageName + ":" + $tag) $($imageName +":"+$tag)
}
