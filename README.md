# Utility for Creating Custom Python Layers for AWS Lambda
This is a simple utility for adding user-defined packages to a Python 3.7-3.9 AWS Lambda layer. The script spins up a Python3.X-slim Docker image to install and zip the packages you need.

Please note existing limitations of AWS Lambda such as the 250MB layer limit.

## Prerequisites
- A UNIX environment to run the shell script
- Docker installed

## Usage
1.  Clone the repository:
```
git clone https://github.com/patrickm663/aws-lambda-layer-generator.git
```
2.  Enter the directory:
```
cd aws-lambda-layer-generator/
```
3. Update the `requirements.txt` to include the packages you wish to include in your layer:
```
vim src/requirements.txt
```
4. Set the shell script `create-layer.sh` as executable:
```
chmod +x create-layer.sh
```
5. Run the script (using `sudo` if required by your Docker set-up):
```
./create-layer.sh
```
6. Follow the prompt to select the Python version.
7. Retrieve the zip file in `output-layer/`, titled `python-layer3-X.zip`.

_Note: the current commands are set to **overwrite** `python-layer3-X.zip` each time the script is run._

8. Add the zip file as a layer in AWS Lambda, using S3 where needed.

## Contributing
Pull requests are welcome and encouraged!

## License
Licensed under the MIT license.
