![Mediawikilogo](/files/mediawikilogo.png "Mediawiki Logo")
# Welcome to MediaWiki Project!

The MediaWiki software is used by tens of thousands of websites and thousands of companies and organisations. MediaWiki helps you collect and organise knowledge and make it available to people.
</br>

# Project Architecture

Project is divided into three parts:\
		**a.  Development of the Mediawiki Docker image and storing in repo.** \
		**b. Building of Azure Kubernetes Service (AKS) infrastructure using Terraform code.**\
		**c.  Development of Helm Charts for deployment on AKS cluster.**
</br>


## Development of the Mediawiki Docker image and storing in repo.

The Mediawiki Application consist of the frontend application and backend database for storing data. In our case, we have used MariaDB official image. This is the [Dockerfile](/docker/Dockerfile) which is used for the Mediawiki frontend, which is based on the PHP8.1 image. The image was built and stored in Azure Container Registery(ACR).
</br>

</br>

## Building of Azure Kubernetes Service (AKS) infrastructure using Terraform code.

Using Terraform code for the Azure Kubernetes Service (AKS) the basic cluster was built. 
[This](/terraform/main.tf) is the Terraform code used in the project.
</br>

</br>

## Development of Helm Charts for deployment on AKS cluster.

Helm charts are used to make the Mediawiki application images and configuration reusable, therefore the Kubernetes manifest file for deployment and service were bundled as [Mediawiki application helm charts](/helm/mediawiki/). On the other hand, the Kubernetes manifest file for deployment, service, configmap and persistent volume were bundled as [Mediawiki-db helm charts](/helm/mediawiki-db/). The Helm manifest for the application is packaged and is stored in the Github repository: https://pranav03singh.github.io/mediawikiapp/ .

</br>

</br>

## Deployment and configuration of the Mediawiki Application
1. Add the Helm package repository.
	 >  **helm repo add mediawikirepo https://pranav03singh.github.io/mediawikiapp/** 
	  > ![Mediawikilogo](/files/helmsearch.png)

	 	
2. Deploy the Mediawiki frontend application helm charts using [app-values.yaml](/helm/app-values.yaml).
	 >  **helm install mediawikiapp mediawikirepo/mediawiki -f app-values.yaml**
	
  
3. Deploy the backend Mediawiki Database using [db-values.yaml](/helm/db-values.yaml).
	  > **helm install mediawiki-db mediawikirepo/mediawiki-db -f db-values.yaml**

4.  Since the deployment is on AKS, LoadBalancer service type was used 
	  > ![Mediawikilogo](/files/service.png)
5. Go to the browser and access the External-IP for mediawikiapp-svc (from the previous step).
	  > ![Mediawikilogo](/files/frontpage.png)
6. To proceed with next steps for the database configuration, grab the db cluster IP, database name, database user and database password.

	  >  ![Mediawikilogo](/files/dbconfig.png)

7. Then, proceed for the next steps of installation.

	  >  ![Mediawikilogo](/files/nextsteps.png)

8. Hooray!! Wikimedia is configured, and ready to use.

</br>





</br>
 
 