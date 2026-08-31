az aks create `
    --resource-group $RESOURCE_GROUP `
    --name $CLUSTER_NAME `
    --node-count 2 `
    --enable-addons monitoring `
    --enable-cluster-autoscaler `
    --min-count 1 `
    --max-count 10 `
    --node-vm-size Standard_D2as_v7 `
    --generate-ssh-keys

# This command did not work so we modified to make it work. And put in the aks_cli_powershell.ps1 script. The command below is the one that worked for us.