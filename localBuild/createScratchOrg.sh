#run this script to create Scratch Orgs
sf org create scratch --definition-file config/project-scratch-def.json --alias MyScratchOrg --set-default --target-dev-hub devSandbox

#open the scratch org
sf org open --target-org MyScratchOrg