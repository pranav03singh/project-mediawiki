![Mediawikilogo](/files/mediawikilogo.png "Mediawiki Logo")
# Welcome to MediaWiki Project!

The MediaWiki software is used by tens of thousands of websites and thousands of companies and organisations. MediaWiki helps you collect and organise knowledge and make it available to people.


# Project Architecture

Project is divided into three parts:
		**a.  Development of the Mediawiki Docker image and storing in repo.**
		**b. Building of Azure Kubernetes Service (AKS) infrastructure using Terraform code.**
		**c.  Development of Helm Charts for deployment on AKS cluster.** 


## Development of the Mediawiki Docker image and storing in repo.

The Mediawiki Application consist of the frontend application and backend database for storing data. In our case we have used MariaDB official image. This is the Dockerfile which is used for the Mediawiki frontend, which is based on the PHP8.1 image. The image was built and was stored in Azure Container Registery(ACR).

## Building of Azure Kubernetes Service (AKS) infrastructure using Terraform code.

Using Terraform code for the Azure Kubernetes Service (AKS) the basic cluster was built. 
The is the Terraform code used in the project.

## Development of Helm Charts for deployment on AKS cluster.

Helm charts are used to make the Mediawiki Application images and configuration reusable, therefore the Kubernetes Manifest file for deployment, service and persistent volume were bundled as Mediawiki application helm charts. On the other hand, the Kubernetes Manifest file for deployment, service, configmap and persistent volume were bundled as Mediawiki-db helm charts.

## Deployment and configuration of the Mediawiki Application

1. Deploy the Mediawiki frontend application helm charts.
	 >  **helm upgrade mediawiki mediawiki -f .\app-values.yaml  --install**
  
2. Deploy the backend Mediawiki Database
	  > **helm upgrade mediawikidb mediawiki-db -f .\db-values.yaml  --install**

3.  Since the deployment is on AKS, Loadbalancer service type was used 
	  > ![Mediawikilogo](/files/service.png)
4. Go to the browser and access the External-IP for mediawikiapp-svc (from the previous step).
	  > ![Mediawikilogo](/files/frontpage.png)
5. Proceed with next steps and for the database configuration, grab the db cluster IP, database name, database user and database password.

	  >  ![Mediawikilogo](/files/dbconfig.png)

6. Proceed for the next steps installations.

	  >  ![Mediawikilogo](/files/nextsteps.png)