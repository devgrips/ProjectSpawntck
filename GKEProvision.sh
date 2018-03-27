
#Overview
# Load config files
# Start Kubernetes cluster


#Load config files
#Load Env variables from File (maybe change to DB)
#using /home/ec2-user/Cloud1
#source /home/ec2-user/Cloud1
. /home/ec2-user/Cloud1
echo ""
echo "Loaded Config file"
echo ""
echo "$(tput setaf 2) Starting $VM_InstancesK Instances in AWS $(tput sgr 0)"
if [ $GCEKProvision -eq 1 ]; then
  echo "$(tput setaf 2) Starting $GCEVM_InstancesK Instances in GCE $(tput sgr 0)"
fi
echo "$(tput setaf 2) Starting $Container_InstancesK Container Instances $(tput sgr 0)"


#Install jq

echo ""
echo "$(tput setaf 2) Installing jq $(tput sgr 0)"
echo ""
wget http://stedolan.github.io/jq/download/linux64/jq

chmod +x ./jq

sudo cp -p jq /usr/bin

echo ""
echo "STARTING"
echo ""



#Create Kubernetes cluster
echo ""
echo "$(tput setaf 2) Creating Kubernetes Cluster in GKE  $(tput sgr 0)"
echo ""


#echo "Creating Kubernetes Cluster in GKE"

gcloud container clusters create --cluster-version=1.8.9-gke.1 delltechdemo123

#Currently using v1.7.12-gke.0

# It takes a few minutes to do this
echo "Sleeping for 30 seconds to let the provisioning finish"

sleep 30s

kubectl get nodes
echo " Cluster"
kubectl config current-context
echo "created"

echo ""
echo "$(tput setaf 2) Installing Helm in the Kubernetes Cluster  $(tput sgr 0)"
echo ""

echo "Installing local Helm client"
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

echo "Installing Helm on Kubernetes"
helm init

# Check to see if Tiller is running
kubectl get pods --namespace kube-system

#Checks versions
helm version

echo ""
echo "$(tput setaf 2) Installing project riff in the Kubernetes Cluster  $(tput sgr 0)"
echo ""






echo ""
echo "Demo by @FabioChiodini"
echo ""
# kubectl delete -f kubefiles/ -R --namespace=default

# gcloud container clusters delete delltechdemo123 --quiet
