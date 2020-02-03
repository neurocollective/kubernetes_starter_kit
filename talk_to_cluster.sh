# you need to have run local_install.sh first!

scp root@$KUBE_MASTER:/etc/kubernetes/admin.conf ~/.kube/config
kubectl get nodes