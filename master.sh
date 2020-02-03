# start the first master node...
kubeadm init --pod-network-cidr=192.168.0.0/16

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# use calico
kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml

# make sure to grab the join comamnd for the worker nodes!