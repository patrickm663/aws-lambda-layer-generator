# Utility for Creating Custom Python 3.8 Layers for AWS Lambda
This is a simple utility for adding user-defined packages to a Python 3.8 AWS Lambda layer. The script spins up a Python3.8-slim Docker image to install and zip the packages you need.

Please note existing limitations of AWS Lambda such as the 250MB layer limit.

For Python 3.7 or 3.9, update the Dockerfile accordingly. Further modifications to the Bash script will come in due time to allow the user to choose their Python version.

## Prerequisites
- A UNIX environment to run the shell script
- Docker installed

## Usage
1.  Clone the repository:
```
git clone https://github.com/patrickm663/aws-layers.git
```
2.  Enter the directory:
```
cd aws-layers
```
3. Update the `requirements.txt` to include the packages you wish to include in your layer.
4. Set the shell script `create-layer.sh` as executable:
```
chmod +x create-layer.sh
```
5. Run the script (using `sudo` if required by your Docker set-up):
```
./create-layer.sh
```
6. Retrieve the zip file in `output-layer/`, titled `python-layer3-8.zip`

_Note: the current commands are set to **overwrite** `python-layer3-8.zip` each time the script is run._
7. Add the zip file as a layer in AWS Lambda.

## Contributing
Pull requests are welcome and encouraged!
