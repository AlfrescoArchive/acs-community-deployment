# Alfresco Content Services Community Deployment with Helm using Minikube

## Prerequisites

To run the Alfresco Content Services Community deployment using Minikube requires:

| Component   | Getting Started Guide |
| ------------| --------------------- |
| Minikube    | https://github.com/kubernetes/minikube |
| Kubectl     | https://kubernetes.io/docs/tasks/tools/install-kubectl/ |
| Helm        | https://docs.helm.sh/using_helm/#quickstart-guide |

### Starting Minikube VM

* Allocate at least 12GB RAM, 4 CPU cores, and 20GB disk space to the Minikube VM:
```bash
minikube start --cpus=4 --memory=12000
```
* Check that Minikube is running:
```bash
minikube version
minikube ip
```
* Start the Dashboard to see a web-based user interface of the Minikube cluster:
```bash
minikube dashboard
```

Here's an example start up command for Windows 10. You'll need to have the "My_Virtual_Switch" set up before this first command - see [blog](https://blogs.msdn.microsoft.com/wasimbloch/2017/01/23/setting-up-kubernetes-on-windows10-laptop-with-minikube/):
```bash
minikube start --vm-driver="hyperv" --cpus=4 --memory=12000 --hyperv-virtual-switch="My_Virtual_Switch" --v=7 --alsologtostderr
```
This downloads a Linux ISO and installs it in your Hyper V Manager. You should see a _minikube_ VM, after it's installed. It also installs all the required software in that VM, to simulate a Kubernetes cluster.  
You may need to add the ```--extra-config=kubelet.ImagePullProgressDeadline=30m0s``` parameter to your start command, as the docker images are rather big.

**Note:** You may need to adapt the required RAM requirement to your environment, as 12GB may not be enough for any use case.

#### Initializing Helm

```bash
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller
```

## Adding Alfresco incubator Helm repository

* Add `incubator` or `stable` repository to your local Helm.
```bash
helm repo add alfresco-incubator https://kubernetes-charts.alfresco.com/incubator
helm repo add alfresco-stable https://kubernetes-charts.alfresco.com/stable
```

* Update the repository indexes:
```bash
helm repo update
```

* Check that the repository was added:
```bash
helm repo list
```

## Installing the ingress service

* Deploy nginx:
```bash
helm install stable/nginx-ingress --set rbac.create=true
```

After running this command remember the name of the ingress deployment, for example: "singed-chipmunk"


## Deploying Alfresco Content Services Community using Helm charts

When you install Alfresco Content Services Community from the Alfresco Helm repository, you don't need to download any code locally. All the charts will be picked up from the Helm repository.  You also have the option to install from the source code, which you'll need to download and modify.  Before starting the deployment, gather the required configuration.

* Get the IP and port of the ingress controller
```bash
minikube ip
# It will print something like: 172.31.147.123
kubectl get service singed-chipmunk-nginx-ingress-controller -o jsonpath={.spec.ports[0].nodePort}
# This will print a port like: 30917
```

The Alfresco helm chart is designed to work with host names instead of IP addresses (common practice for production systems). You may need to assign the ingress controller IP address to a resolvable name on the host machine for minikube environments. For example, on *nix systems, this can be done by modifying the `/etc/hosts` file and setting `172.31.147.123` to be resolved as `acs-community.local`.

* Setting DNS name in `/etc/hosts` file
```bash
sudo vi /etc/hosts

# Add setting below
172.31.147.123    acs-community.local
```

### Option 1: Deploying Alfresco Content Services Community from the chart repository

* Run the following command to deploy Alfresco Content Services Community using the `incubator` or `stable` chart (add the corresponding Helm repository as per [this section](#adding-alfresco-incubator-helm-repository)):
```bash
helm install alfresco-incubator/alfresco-content-services-community --set externalProtocol="http" --set externalHost="acs-community.local" --set externalPort="30917"
```

### Option 2: Deploying Alfresco Content Services Community from the source code

If you want to modify the deployment and test it, the best option is to run the deployment from the source code.

* Clone this repository (https://github.com/Alfresco/acs-community-deployment) and modify it (if required):
```bash
git clone git@github.com:Alfresco/acs-community-deployment.git
cd acs-community-deployment
```
* Update the dependencies required:
```bash
cd helm/alfresco-content-services-community
helm dependency update
cd ..
```
**Note:** Make sure you run the command from the correct directory.

* Run the following command to deploy Alfresco Content Services Community:
```bash
helm install alfresco-content-services-community --set externalProtocol="http" --set externalHost="acs-community.local" --set externalPort="30917"
```

## Checking your deployment

After installing Alfresco Content Services Community, the following URLs are displayed in the terminal:
```
  Content: http://acs-community.local:30917/alfresco
  Share: http://acs-community.local:30917/share
  Solr: http://acs-community.local:30917/solr
```
You'll need to wait for some time for the deployment to start up. Use the Minikube dashboard to track the state of the deployment.

## Cleaning up your deployment

See [clean up steps](helm-deployment-aws_kops.md#cleaning-up-your-deployment) for more details.
