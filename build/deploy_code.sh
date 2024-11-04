echo "Coverting source to metadata format"
##sfdx force:source:convert -d deploy_code -r force-app
##sf project deploy repo convert --output-dir deploy_code --source-dir force-app

sf project convert mdapi --root-dir force-app --output-dir deploy_code


# Create a new scratch org

sfdx force:org:create -f config/project-scratch-def.json  



# Authenticate to the newly created scratch org

sfdx force:auth:web:login -a MyScratchOrg



#deploy to scratch org
sf project deploy start --target-org MyScratchOrg --source-dir force-app

##then try to deploy test data
