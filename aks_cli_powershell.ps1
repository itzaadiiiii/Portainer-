# ============================================================
# Prerequisites
# ============================================================

# 1. Azure CLI must be installed.
#    Used to create and manage Azure resources.
az --version

# 2. kubectl must be installed.
#    Used to interact with the Kubernetes cluster.
kubectl version --client

# 3. Helm is optional.
#    Required only if you install applications using Helm charts.
helm version

# 4. Azure CLI must be authenticated.
#    Run:
#    az login

# 5. The logged-in Azure account must have sufficient
#    permissions to create Resource Groups and AKS clusters.

# 6. Internet connectivity is required to download
#    required Azure/Kubernetes components.

# 7. An Azure subscription must be available.
#    Check with:
#    az account show
#
#    If required, select the subscription:
#    az account set --subscription "<SUBSCRIPTION_ID>"


# ============================================================
# AKS Cluster Configuration
# ============================================================

# Set variables
$RESOURCE_GROUP = "url-shortener-rg"
$CLUSTER_NAME = "url-shortener-aks"
$LOCATION = "eastus"


# ============================================================
# Create Resource Group
# ============================================================

az group create `
    --name $RESOURCE_GROUP `
    --location $LOCATION


# ============================================================
# Create AKS Cluster
# ============================================================

# - 3 initial nodes
# - Azure Monitor addon enabled
# - Cluster Autoscaler enabled
# - Minimum 1 node
# - Maximum 10 nodes
# - S "Standard_B2s" VM size if not use "Standard_D2as_v7" as B2s and A series is not supported now 
# - SSH keys generated automatically

az aks create `
    --resource-group $RESOURCE_GROUP `
    --name $CLUSTER_NAME `
    --node-count 1 `
    --enable-addons monitoring `
    --node-vm-size Standard_D2as_v7 `
    --generate-ssh-keys
# ============================================================
# Get AKS Credentials
# ============================================================

# Merge AKS credentials into the local kubeconfig
az aks get-credentials `
    --resource-group $RESOURCE_GROUP `
    --name $CLUSTER_NAME


# ============================================================
# Verify Cluster
# ============================================================

# Verify AKS cluster connectivity
kubectl cluster-info

# Verify worker nodes
kubectl get nodes
