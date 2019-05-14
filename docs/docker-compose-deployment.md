# Deploying Alfresco Content Services Community using Docker Compose

Use this information to quickly start up Alfresco Content Services Community (ACS) using Docker Compose.

## Prerequisites

To deploy Alfresco Content Services Community using _docker-compose_, you'll need to install the following software:

| Component      | Installation Guide |
| ---------------| ------------------ |
| Docker         | https://docs.docker.com/ |
| Docker Compose | https://docs.docker.com/compose/install/ |

<!--## Structure-->
<!-- CREATE DIAGRAM?
![Docker Compose Deployment Components](./diagrams/docker-compose/docker-compose-components.png)-->

## Deploying Alfresco Content Services Community
1. Clone this repository or download a single file - [docker-compose](../docker-compose/docker-compose.yml).
2. Navigate to the folder where the _docker-compose.yml_ file is located.
3. Run ```docker-compose up```
4. Open the following URLs in your browser to check that everything starts up:
* Administration and REST APIs: [http://<machine_ip>:8082/alfresco](http://localhost:8082/alfresco)
* Share: [http://<machine_ip>:8080/share](http://localhost:8080/share)
* Search administration: [http://<machine_ip>:8083/solr](http://localhost:8083/solr)

**Note:**
* Make sure that exposed ports are open on your host. Check the _docker-compose.yml_ file to determine the exposed ports - refer to the ```host:container``` port definitions. You'll see they include 5432, 8080, 8082, 8083 and others.
* If Docker is running on your local machine, the IP address will be just _localhost_.
* If you're using the [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows), run the following command to find the IP address:
```bash
docker-machine ip
```
* If you run ```docker-compose up``` after deleting a previous Docker Compose cluster, then replace step 3 with the following command:
```bash
docker-compose down && docker-compose build --no-cache && docker-compose up
```
* For testing purposes, you can enable the browser's native login prompt by adding `-Dalfresco.restApi.basicAuthScheme=true` in your [docker-compose.yml](../docker-compose/docker-compose.yml) file under the `JAVA_OPTS` environment variables.
