# Customising your deployment

Alfresco Content Services Community is composed of the following images:

1. alfresco-content-repository |  [tags](https://hub.docker.com/r/alfresco/alfresco-content-repository-community/tags/)
2. alfresco-share | [tags](https://hub.docker.com/r/alfresco/alfresco-share/tags/)
3. alfresco-search-services | [tags](https://hub.docker.com/r/alfresco/alfresco-search-services/tags/)
4. postgres | [tags](https://hub.docker.com/r/library/postgres/tags/)

For Docker Compose usage, edit the image tags in the [docker-compose.yml](../docker-compose/docker-compose.yml) file.  

For Helm charts usage, edit the image tags in the  [values.yaml](../helm/alfresco-content-services-community/values.yaml) file.  

```
project
│
└───docker-compose
│   │
│   └──docker-compose.yml
│
└───helm
    │  
    └───alfresco-content-services-community
        │
        └───values.yaml
```

**Note:**
* Use the recommended image tags, as not all combinations may work.
* You can modify the values provided in [values.yaml](../helm/alfresco-content-services-community/values.yaml) when deploying the Helm chart. For example, you can run:
```bash
helm install alfresco-incubator/alfresco-content-services-community --set repository.image.tag="yourTag" --set share.image.tag="yourTag"
```
