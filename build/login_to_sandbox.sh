echo "Logging into Sandbox Salesforce Org"
mkdir keys  # make a keys Directory in the Cloud 
#to make a local key, switch to WSL by typing "bash" then you can type openssl and the options will pop up
echo $SANDBOX_CERT_KEY | base64 -di > keys/server.key   

echo "Authenticating org"
sfdx force:auth:jwt:grant --clientid $SANDBOX_APP_KEY --jwtkeyfile keys/server.key --username $SANDBOX_USERNAME --setdefaultdevhubusername -a DevHub