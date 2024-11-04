echo "Coverting source to metadata format"
##sfdx force:source:convert -d deploy_code -r force-app
##sf project deploy repo convert --output-dir deploy_code --source-dir force-app

sf project convert mdapi --root-dir force-app --output-dir deploy_code


echo "Logging into Salesforce Org"
mkdir keys
echo $SANDBOX_CERT_KEY | base64 -di > keys/server.key

#You can authorize a scratch org using the same consumer key and private key file that you used to authorize its associated Dev Hub org.
echo "Authenticating org"
sf login org jwt --client-id $SANDBOX_APP_KEY --jwt-key-file keys/server.key --username test-sjnuadalsoqa@example.com --alias MyScratchOrg 


echo "Deploying code to org"
##sfdx force:mdapi:deploy -u mikesPeronalOrg -d deploy_code/ -w -1 -l RunLocalTests
##sf project deploy start --target-org mikesPeronalOrg --deploy-dir deploy_code/ --wait -1 --test-level RunLocalTests



#deploy to scratch org
sf project deploy start --target-org MyScratchOrg --source-dir force-app

##then try to deploy test data
