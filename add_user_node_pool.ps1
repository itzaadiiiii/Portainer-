
az aks nodepool add `
    --resource-group $RESOURCE_GROUP `
    --cluster-name $CLUSTER_NAME `
    --name userpool `
    --mode User `
    --node-count 2 `
    --node-vm-size Standard_D4s_v7