echo "Coverting source to metadata format"
##sfdx force:source:convert -d deploy_code -r force-app
##sf project deploy repo convert --output-dir deploy_code --source-dir force-app

sf project convert mdapi --root-dir force-app --output-dir deploy_code

echo "Logging into to our Deployment Org Sandbox Salesforce Org"
mkdir keys
echo $DEPLOY_CERT_KEY | base64 -di > keys/server.key    #this cert key has to match the one you upload when generating from openSSL

echo "Authenticating org"
####sfdx force:auth:jwt:grant --clientid $APP_KEY --jwtkeyfile keys/server.key --username $SF_USERNAME --setdefaultdevhubusername -a DevHub
sf login org jwt --client-id $DEPLOY_APP_KEY --jwt-key-file keys/server.key --username $DEPLOY_USERNAME --alias deploymentOrg

echo "Starting Deployment"
sf project deploy start  --source-dir deploy_code --target-org deploymentOrg