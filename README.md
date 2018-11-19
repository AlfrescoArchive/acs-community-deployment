
# Alfresco Content Services Community Deployment

### Contributing guide
Please use [this guide](CONTRIBUTING.md) to make a contribution to the project.

This project contains the code for starting the entire Alfresco Content Services (Community Edition) product with **Docker** or **Kubernetes**.

The **master** branch of this repository will endeavour to support the following deployments:
- [Docker Compose](https://github.com/Alfresco/acs-deployment/blob/master/docs/docker-compose-deployment.md) (latest): For development and trials
- [MiniKube](https://github.com/Alfresco/acs-deployment/blob/master/docs/helm-deployment-minikube.md) (latest): For development and POCs
- [Helm - AWS Cloud with Kubernetes](https://github.com/Alfresco/acs-deployment/blob/master/docs/helm-deployment-aws_kops.md) (latest): For production or as a basis of production deployments

For the Enterprise project, go to [acs-deployment](https://github.com/Alfresco/acs-deployment). The only difference between these projects are:
* In the Community chart, clustering is not supported, so only a single `alfresco-content-repository` node is started by default.

## Contents of the deployment

Alfresco Content Services Community deployed via `docker-compose` or Kubernetes contains the following:
1. Alfresco Repository for Community, with:  
1.1. Alfresco Share Services AMP  
1.2. Alfresco AOS AMP  
1.3. Alfresco vti-bin war - helps with AOS integration  
1.4. Alfresco Google Docs Repo AMP  
2. Alfresco Share, with:  
2.1 Alfresco Google Docks Share AMP  
3. A Postgres DB  
4. Alfresco Search Services (Solr6)  

## Deployment options

To deploy Alfresco Content Services Community, follow the steps in the [acs-deployment](https://github.com/Alfresco/acs-deployment) project using the links provided.

**Note:** You'll need to adapt some steps and commands for the Community release. Replace any occurrences of `alfresco-content-repository` with `alfresco-content-repository-community` to ensure you're using the Community release. Example commands may need to be changed when cloning the Community project, changing directory, or deploying the Community Helm chart:
* [Deploying with Helm charts on AWS](https://github.com/Alfresco/acs-deployment/blob/master/docs/helm-deployment-aws_kops.md)
* [Deploying with Helm charts using Minikube](https://github.com/Alfresco/acs-deployment/blob/master/docs/helm-deployment-minikube.md)
* [Deploying using Docker Compose](https://github.com/Alfresco/acs-deployment/blob/master/docs/docker-compose-deployment.md)

Use the steps in this project to customize your deployment:
* [Customizing your deployment](docs/customising-deployment.md)


## Other information

* See alternative commands and start up [tutorial with AWS support](https://github.com/Alfresco/alfresco-anaxes-shipyard/blob/master/docs/running-a-cluster.md)
* [Tips and tricks](https://github.com/Alfresco/alfresco-anaxes-shipyard/blob/master/docs/tips-and-tricks.md) for working with Kubernetes and Alfresco Content Services.
