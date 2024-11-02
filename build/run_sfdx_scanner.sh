echo "Trying to force this to a new version of nodejs"
sudo nvm install 18
sudo nvm use 18

echo "Installing JDK"
sudo apt-get update
sudo apt-get install openjdk-11-jdk

echo "Install SFDX Scanner"
echo -e 'y/n' | sfdx plugins:install @salesforce/sfdx-scanner

echo "Running SFDX Scanner"
npx sfdx scanner:run --target "**/default/**" --format "csv" --outfile "sfdxScannerAnalysis.csv" --violations-cause-error