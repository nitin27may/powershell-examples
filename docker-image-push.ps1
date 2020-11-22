param (
  [Parameter(Mandatory = $true, HelpMessage = "Environment Name for which image will be created.", Position = 1)]
  [string]$envName = "dev",
  [Parameter(Mandatory = $true, HelpMessage = "Image Tag.", Position = 2)]
  [string]$tag = "01",
  [string]$repository = "/api",
  [string]$username = $(Read-Host "Input user name" ),
  [string]$password = $(Read-Host "Input password" ),
  [string]$dockerhost = "nitinsingh.azurecr.io",
  [string]$workspace = "C:\Workplace\"
)


try {
  docker login -u $username -p $password $dockerhost

  Set-Location $workspace

  docker build -t $tag .

  docker tag $tag  $($dockerhost + $repository + ":" + $tag)

  docker push $($dockerhost + $repository + ":" + $tag)
}
catch {

}
finally {
  docker container stop $(docker container ls -aq)
  docker container rm $(docker container ls -aq)
}
