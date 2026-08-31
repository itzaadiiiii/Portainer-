# ============================================================
# Delete AKS Environment
# ============================================================

# WARNING:
# This deletes the entire Resource Group and ALL resources
# inside it.
#
# Resources include:
# - AKS cluster
# - Node pools / VM Scale Sets
# - Managed disks
# - Load Balancers / Public IPs created by AKS
# - Monitoring resources created inside the RG
# - Other resources created inside this RG
#
# Make sure this Resource Group does not contain
# resources that you want to keep.

# Set variables
$RESOURCE_GROUP = "url-shortener-rg"

# Check resources before deletion
az resource list `
    --resource-group $RESOURCE_GROUP `
    --output table

# Delete the entire Resource Group
az group delete `
    --name $RESOURCE_GROUP `
    --yes `
    --no-wait

# Verify deletion
az group exists `
    --name $RESOURCE_GROUP