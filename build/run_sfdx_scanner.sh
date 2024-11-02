echo "Installing JDK"
sudo apt-get update
sudo apt-get install openjdk-11-jdk

echo "Install SFDX Scanner"
echo -e 'y/n' | sf plugins:install @salesforce/sfdx-scanner@4.6.0

echo "Running SFDX Scanner"
npx sfdx scanner:run --target "**/default/**" --format "csv" --outfile "sfdxScannerAnalysis.csv"