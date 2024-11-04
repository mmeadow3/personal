echo "Logging into Salesforce Org"
mkdir keys
echo $CERT_KEY | base64 -di > keys/server.key

echo "Authenticating org"
####sfdx force:auth:jwt:grant --clientid $APP_KEY --jwtkeyfile keys/server.key --username $SF_USERNAME --setdefaultdevhubusername -a DevHub
sf login org jwt --client-id $APP_KEY --jwt-key-file keys/server.key --username $SF_USERNAME --set-default-dev-hub --alias mikesPeronalOrg
