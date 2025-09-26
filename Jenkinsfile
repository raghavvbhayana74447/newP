pipeline{
    agent { label 'cloud-agent'}

    environmemts{
        APP_NAME= "devapp"
        RESOURCE_GROUP = "RnD-RaghavRG"
        APP_NAME       = "mywebapp74447"
        PLAN_NAME      = "ASP-RnDRaghavRG-b5a6"   
        LOCATION       = "eastus" 
    }

    stages{
        stage('fetching git'){
            steps{
                git url: 'https://github.com/raghavvbhayana74447/multienv.git', 
                    branch: 'qa'
            }
        }
        stage('installing dependencies'){
            steps{
                sh '''
                npm install
                '''
            }
        }


        stage('az login'){
            steps{
                withCredentials([azureServicePrincipal(credentialsId: 'AzureServicePrincipal')]) {
                
                sh '''
                        az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
                        az account set --subscription $AZURE_SUBSCRIPTION_ID

                        az webapp show --resource-group $RESOURCE_GROUP --name $APP_NAME || \
                        az webapp create \
                          --resource-group $RESOURCE_GROUP \
                          --plan $PLAN_NAME \
                          --name $APP_NAME \
                          --runtime "NODE|20-lts"
                        
                        sudo apt-get install zip -y
                        
                        echo "Zipping app..."
                        zip -r app.zip .

                        echo "Deploying to Azure Web App..."
                        az webapp deployment source config-zip \
                          --resource-group $RESOURCE_GROUP \
                          --name $APP_NAME \
                          --src app.zip
                  '''
            }
        }
    }
}
}