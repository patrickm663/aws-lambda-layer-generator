# Utility for Creating Custom Python Layers for AWS Lambda
This is a simple utility for adding user-defined packages to a Python 3.8-3.12 (latest at time of writing) AWS Lambda layer. The script spins up a Python3.X-slim Docker image to install and zip the packages you need.

Please note existing limitations of AWS Lambda such as the 250MB layer limit.

**For ease-of-use, a demo layer can be found in the `output-layer/` folder. This contains Numpy for the Python 3.12 runtime.**

## Prerequisites
- A UNIX environment to run the shell script
- Docker installed and running

**On Windows, be sure to use `Git Bash` in order to run the Bash script**

## Usage
1.  Clone the repository:
```
git clone https://github.com/patrickm663/aws-lambda-layer-generator.git
```
2.  Enter the directory:
```
cd aws-lambda-layer-generator
```
3. Update the `requirements.txt` file in `src` to indicate the packages you wish to include in your layer (like you would an ordinary `requirements.txt` file):
```
vim src/requirements.txt
```
4. (Optional) Set the shell script `create-layer.sh` as executable:
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

## Hacking
Since this is just a Bash script doing find and-replace on a central Dockerfile (`Dockerfile_master`), users can edit the script as they please. This also means users can find-and-replace manually if they only want to use a fixed Python distribution (say, Python 3.12). The rest of the commands to build the container, copy the layer, and clean-up can be done manually or embedded as part of a larger automation piece.

## Contributing
Pull requests are welcome and encouraged!

## License
Licensed under the MIT license.
