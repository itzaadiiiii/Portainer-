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
