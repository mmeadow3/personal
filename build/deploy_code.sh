echo "Coverting source to metadata format"
##sfdx force:source:convert -d deploy_code -r force-app
##sf project deploy repo convert --output-dir deploy_code --source-dir force-app

sf project convert mdapi --root-dir force-app --output-dir deploy_code

echo "Logging into Sandbox Salesforce Org"
mkdir keys  # make a keys Directory in the Cloud 
#to make a local key, switch to WSL by typing "bash" then you can type openssl and the options will pop up
echo $SANDBOX_CERT_KEY | base64 -di > keys/server.key   

echo "Authenticating org"
sfdx force:auth:jwt:grant --clientid $SANDBOX_APP_KEY --jwtkeyfile keys/server.key --username $SANDBOX_USERNAME --setdefaultdevhubusername -a mikesPeronalOrg
# Create a new scratch org

sfdx force:org:create -f config/project-scratch-def.json  



# Authenticate to the newly created scratch org

sfdx force:auth:web:login -a MyScratchOrg



#deploy to scratch org
sf project deploy start --target-org MyScratchOrg --source-dir force-app

##then try to deploy test data
