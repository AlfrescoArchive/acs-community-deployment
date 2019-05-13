
# Alfresco Content Services Community Deployment

### Contributing guide
Please use [this guide](CONTRIBUTING.md) to make a contribution to the project.

This project contains the code for starting the entire Alfresco Content Services (Community Edition) product with **Docker** or **Kubernetes**.

The **master** branch of this repository will endeavour to support the following deployments:
- [Docker Compose](docs/docker-compose-deployment.md) (latest): For development and trials
- [MiniKube](docs/helm-deployment-minikube.md) (latest): For development and POCs
- [Helm - AWS Cloud with Kubernetes](docs/helm-deployment-aws_kops.md) (latest): As a deployment template which can be used as the basis for your specific deployment needs

For the Enterprise project, go to [acs-deployment](https://github.com/Alfresco/acs-deployment). The only difference between these projects is:
* In the Community chart, clustering is not supported, so only a single `alfresco-content-repository-community` node is started by default.

## Contents of the deployment

Alfresco Content Services Community deployed via `docker-compose` or Kubernetes contains the following:
1. Alfresco Repository for Community, with:  
1.1. Alfresco Share Services AMP  
1.2. Alfresco AOS AMP  
1.3. Alfresco vti-bin war - helps with AOS integration  
1.4. Alfresco Google Docs Repo AMP  
2. Alfresco Share, with:  
2.1 Alfresco Google Docs Share AMP  
3. A Postgres DB  
4. Alfresco Search Services (Solr6)  

## Deployment options

* [Deploying with Helm charts on AWS](docs/helm-deployment-aws_kops.md)
* [Deploying with Helm charts using Minikube](docs/helm-deployment-minikube.md)
* [Deploying using Docker Compose](docs/docker-compose-deployment.md)

Use the steps in this project to customize your deployment:
* [Customizing your deployment](docs/customising-deployment.md)


## Other information

* See alternative commands and start up [tutorial with AWS support](https://github.com/Alfresco/alfresco-anaxes-shipyard/blob/master/docs/running-a-cluster.md)
* [Tips and tricks](https://github.com/Alfresco/alfresco-anaxes-shipyard/blob/master/docs/tips-and-tricks.md) for working with Kubernetes and Alfresco Content Services.
