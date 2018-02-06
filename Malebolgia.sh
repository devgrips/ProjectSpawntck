echo " "
echo "  _______ ______          _____    _____   ______          ___   _  "
echo " |__   __|  ____|   /\   |  __ \  |  __ \ / __ \ \        / / \ | | "
echo "    | |  | |__     /  \  | |__) | | |  | | |  | \ \  /\  / /|  \| | "
echo "    | |  |  __|   / /\ \ |  _  /  | |  | | |  | |\ \/  \/ / |     | "
echo "    | |  | |____ / ____ \| | \ \  | |__| | |__| | \  /\  /  | |\  | "
echo "    |_|  |______/_/    \_\_|  \_\ |_____/ \____/   \/  \/   |_| \_| "
echo " "


echo ""
echo "$(tput setaf 1)Destroying ELK Setup $(tput sgr 0)"
echo ""

kubectl delete -f kubefiles/ -R --namespace=default

kubectl get pods,deployments,services,ingress,configmaps

echo "Sleeping for 1min to let the de-provisoning finish"

sleep 1m

kubectl get pods,deployments,services,ingress,configmaps

echo ""
echo "$(tput setaf 1)Destroying Kubernetes Cluster $(tput sgr 0)"
echo ""

gcloud container clusters delete delltechdemo123 --quiet

kubectl get nodes

#Delete local docker containers

#Kill local containers
echo ""
echo "$(tput setaf 1) Destroying Local Containers $(tput sgr 0)"
echo ""
docker rm -f etcd-browserk$instidk
sleep 1
docker rm -f honeypot-i
sleep 1
docker rm -f etcdk

docker ps