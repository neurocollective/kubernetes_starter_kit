## Step 1 - Create nodes for kubernetes

Create three VMs (droplets on digital ocean, ec2 on aws, compute engine on google cloud, virtual machine on azure). Make sure they all have 2 CPUs or more (kubernetes requires this).

## Step 2 - Bootstrap a master node

`ssh root@$YOUR_MASTER_NODE_IP` and run `node.sh`, then `master.sh` on that machine.

After running `master.sh`, copy the JOIN comamnd printed out to the console. Paste it into `join.sh`.

## Step 3 - Configure your local cli to talk to the cluster

On your local linux machine, run `local install`. If you're on mac, see this instead:

https://kubernetes.io/docs/tasks/tools/install-kubectl/  

Then run `talk_to_cluster.sh` for linux or mac. Make sure the `$KUBE_MASTER` variable resolves to the IP address of your master node.

## Step 4 - bootstrap two worker nodes

For each worker node, ssh into the box (`ssh root@$WORKER_NODE_IP`), run `node.sh`, then run run the JOIN command you copied at the end of step two (if you copied it into `join.sh`, then just run `bash join.sh`). 

## Step 5 - Create a Deployment & Service on the cluster

`kubectl apply -f deployment.yaml`. Then `kubectl apply -f service.yaml`. Boom, you have an application running on kubernetes!

run `kubectl get services` to see the port exposed for your service.

To get `Hello Kubernetes` back, run `curl http://$DEMO_WORKER_1:$EXPOSED_PORT` and you should get a response from the deployed pod.