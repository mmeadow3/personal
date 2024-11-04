echo "Coverting source to metadata format"
##sfdx force:source:convert -d deploy_code -r force-app
sf project deploy repo convert --output-dir deploy_code --source-dir force-app


echo "Deploying code to org"
##sfdx force:mdapi:deploy -u mikesPeronalOrg -d deploy_code/ -w -1 -l RunLocalTests
sf project deploy start --target-org mikesPeronalOrg --deploy-dir deploy_code/ --wait -1 --test-level RunLocalTests
