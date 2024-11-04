echo "Deploying source to org"
## old version:    sfdx force:source:deploy --sourcepath force-app --targetusername mikesPeronalOrg
sf project deploy start --manifest manifest/package.xml --target-org mikesPeronalOrg


echo "Testing code in org"
mkdir -p test-results
# old sfdx cli:    sfdx force:apex:test:run --testlevel RunLocalTests --outputdir test-results --resultformat tap --targetusername mikesPeronalOrg
## --test-level RunLocalTests --output-dir test-results --result-format tap --target-org mikesPeronalOrg
sf apex run test --test-level RunLocalTests --output-dir test-results --target-org mikesPeronalOrg    
### this is failing due to too many test exections in 24 hours, https://salesforce.stackexchange.com/questions/280419/failed-to-enqueue-tests-an-unknown-exception-occurred
####Error (1): An unknown exception occurred.

##To check this use the REST explorer on Workbench and query GET /services/data/v57.0/limits
#then look for DailyAsyncApexTests