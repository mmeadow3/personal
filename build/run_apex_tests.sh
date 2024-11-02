echo "Deploying source to org"
## old version:    sfdx force:source:deploy --sourcepath force-app --targetusername mikesPeronalOrg
sf project deploy start --manifest manifest/package.xml --target-org mikesPeronalOrg


echo "Testing code in org"
# old sfdx cli:    sfdx force:apex:test:run --testlevel RunLocalTests --outputdir test-results --resultformat tap --targetusername mikesPeronalOrg
## --test-level RunLocalTests --output-dir test-results --result-format tap --target-org mikesPeronalOrg
sf apex run test --test-level RunLocalTests --output-dir <path to outputdir> --target-org mikesPeronalOrg