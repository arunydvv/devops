# Floci — Create and Access an EC2 Instance Using SSH

## 1. Overview

Floci allows you to simulate AWS services locally using Docker. In this guide, we will create an EC2 instance, configure an SSH key pair, connect to the instance from Windows using SSH, and terminate it when finished.

**Environment:**
- OS: Windows 11
- Shell: PowerShell
- AWS CLI: AWS CLI v2
- Local AWS simulator: Floci
- Container runtime: Docker Desktop

### Architecture

```text
Windows PowerShell
       |
       | AWS CLI commands
       v
Floci API — localhost:4566
       |
       | Creates simulated EC2 instance
       v
Docker container
       |
       | SSH port forwarding
       v
localhost:2200
       |
       | SSH connection
       v
EC2 container shell
```

## 2. Start Floci

Open PowerShell in your project directory.

Start the services:

```powershell
docker compose up -d
```

Verify that the containers are running:

```powershell
docker ps
```

Check the Floci endpoint:

```powershell
curl.exe http://localhost:4566/_localstack/health
```

Floci API endpoint:

```text
http://localhost:4566
```

The exact health endpoint response depends on the Floci version.

## 3. Configure AWS CLI

Set dummy credentials and the default region for the local environment.

```powershell
$env:AWS_ACCESS_KEY_ID = "test"
$env:AWS_SECRET_ACCESS_KEY = "test"
$env:AWS_DEFAULT_REGION = "us-east-1"
$env:AWS_ENDPOINT_URL = "http://localhost:4566"
```

These environment variables apply to the current PowerShell session.

Verify the AWS CLI installation:

```powershell
aws --version
```

Example:

```text
aws-cli/2.37.9 Python/3.14.6 Windows/11
```

Check the active configuration:

```powershell
aws configure list
```

**Important:** These dummy credentials are for the local simulator, not for real AWS. Always specify the Floci endpoint when running commands to avoid accidentally sending requests to real AWS.

## 4. Test the EC2 API

List existing instances:

```powershell
aws ec2 describe-instances --endpoint-url http://localhost:4566
```

A successful response returns JSON containing the reservations and instances managed by Floci.

For a compact table:

```powershell
aws ec2 describe-instances --endpoint-url http://localhost:4566 --query "Reservations[].Instances[].[InstanceId,State.Name,InstanceType,KeyName,PrivateIpAddress]" --output table
```

An empty result is normal if no instances exist yet.

## 5. Generate an SSH key pair

Generate a local RSA key pair:

```powershell
ssh-keygen -t rsa -b 2048 -f "$env:USERPROFILE\.ssh\floci-key"
```

When prompted for a passphrase, press Enter twice if you want to leave it empty.

This creates two files:

| File | Purpose |
|---|---|
| `floci-key` | Private key used by your SSH client |
| `floci-key.pub` | Public key imported into Floci |

Their default locations are:

```text
C:\Users\<USERNAME>\.ssh\floci-key
C:\Users\<USERNAME>\.ssh\floci-key.pub
```

**Security:** Never share or commit the private key to GitHub. Only the public key should be imported into Floci.

If the key already exists, do not overwrite it unless you intend to replace the existing key pair.

## 6. Import the public key into Floci

Run:

```powershell
aws ec2 import-key-pair --key-name floci-key --public-key-material "fileb://$env:USERPROFILE\.ssh\floci-key.pub" --endpoint-url http://localhost:4566
```

A successful response includes the key name `floci-key`.

If you receive:

```text
InvalidKeyPair.Duplicate
```

the key name already exists in Floci. This is not necessarily an error requiring action. Confirm that the existing key corresponds to your local public key before using it.

To inspect the imported key pair:

```powershell
aws ec2 describe-key-pairs --key-names floci-key --endpoint-url http://localhost:4566
```

## 7. Create a JSON configuration for EC2

On this Windows setup, the individual `--min-count` and `--max-count` arguments were rejected by the command parser. Using `--cli-input-json` with a file successfully avoided the PowerShell inline JSON quoting issue.

Create the launch configuration:

```powershell
@'
{
  "ImageId": "ami-ubuntu2204",
  "InstanceType": "t3.micro",
  "MinCount": 1,
  "MaxCount": 1,
  "KeyName": "floci-key",
  "Placement": {
    "AvailabilityZone": "us-east-1c"
  }
}
'@ | Set-Content -Path "$HOME\ec2-launch.json" -Encoding ascii
```

This creates:

```text
C:\Users\<USERNAME>\ec2-launch.json
```

Configuration explained:

| Parameter | Meaning |
|---|---|
| `ImageId` | Floci-supported Ubuntu 22.04 image alias |
| `InstanceType` | Requested instance type |
| `MinCount` | Minimum number of instances to launch |
| `MaxCount` | Maximum number of instances to launch |
| `KeyName` | Imported SSH key pair |
| `AvailabilityZone` | Simulated availability zone |

## 8. Launch the EC2 instance

Run:

```powershell
aws ec2 run-instances --cli-input-json file://$HOME/ec2-launch.json --endpoint-url http://localhost:4566
```

The output should contain an instance ID, for example:

```text
i-16595db6108dd8680
```

The ID above is an example from this setup. Your next instance will normally have a different ID.

Check the instance state and key name:

```powershell
aws ec2 describe-instances --endpoint-url http://localhost:4566 --query "Reservations[].Instances[].[InstanceId,State.Name,KeyName,PrivateIpAddress]" --output table
```

Confirm that the new instance is `running` and its key name is `floci-key`.

## 9. Verify the Docker container and SSH port

List running containers and their port mappings:

```powershell
docker ps --format "table {{.Names}}\t{{.Ports}}"
```

Example:

```text
NAMES                           PORTS
floci-ec2-i-16595db6108dd8680   0.0.0.0:2200->22/tcp
floci-ui                        0.0.0.0:4500->4500/tcp
floci                           0.0.0.0:4566->4566/tcp
```

The mapping:

```text
localhost:2200 -> container port 22
```

means SSH connections to port `2200` on the Windows host are forwarded to port `22` inside the EC2 container.

The assigned host port can differ between instances or configurations. Always check the actual mapping.

## 10. Connect to EC2 using SSH

Use the private key generated earlier:

```powershell
ssh -i "$env:USERPROFILE\.ssh\floci-key" -p 2200 root@127.0.0.1
```

Here:

- `-i` specifies the private key.
- `-p 2200` specifies the forwarded host port.
- `root` is the login username used in this successful setup.
- `127.0.0.1` refers to the local Windows host.

If the port differs, replace `2200` with the mapped host port.

### First-time SSH connection

You may see:

```text
The authenticity of host '[127.0.0.1]:2200' can't be established.
```

If you have verified that this is your intended local Floci endpoint, type:

```text
yes
```

Press Enter.

SSH saves the server's host key in your `known_hosts` file. This is separate from the `floci-key` client authentication key pair.

### Successful connection

After authentication succeeds, you should receive a shell prompt inside the container-backed EC2 environment.

You can then execute commands supported by that environment, such as:

```bash
whoami
```

```bash
hostname
```

```bash
pwd
```

```bash
exit
```

The `exit` command disconnects SSH and returns you to PowerShell.

**Note:** Floci's EC2 implementation is container-backed. Do not assume that every behavior of a real AWS EC2 virtual machine, including its init system, networking, storage, or available services, is identical.

## 11. Troubleshooting

### A. `NoRegion` error

Set the default region:

```powershell
$env:AWS_DEFAULT_REGION = "us-east-1"
```

### B. `AuthFailure`

Reset the local credentials and explicitly specify the endpoint:

```powershell
$env:AWS_ACCESS_KEY_ID = "test"
$env:AWS_SECRET_ACCESS_KEY = "test"
$env:AWS_DEFAULT_REGION = "us-east-1"
```

Then test:

```powershell
aws ec2 describe-instances --endpoint-url http://localhost:4566
```

### C. `InvalidKeyPair.Duplicate`

The key name already exists. Inspect it using:

```powershell
aws ec2 describe-key-pairs --key-names floci-key --endpoint-url http://localhost:4566
```

Ensure the local private key matches the imported public key.

### D. `Connection refused` or `Connection closed`

Check the container and port mapping:

```powershell
docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

Inspect the container:

```powershell
docker inspect floci-ec2-i-16595db6108dd8680
```

Check its logs:

```powershell
docker logs --tail 100 floci-ec2-i-16595db6108dd8680
```

Test SSH with verbose output:

```powershell
ssh -vvv -o ConnectTimeout=10 -i "$env:USERPROFILE\.ssh\floci-key" -p 2200 root@127.0.0.1
```

If authentication fails, verify the username and key association. If the connection closes before authentication, investigate SSH server startup and port forwarding.

### E. AWS CLI rejects `--min-count` and `--max-count`

Check the executable:

```powershell
aws --version
```

Use the JSON file method documented in Sections 7 and 8 to avoid inline JSON quoting and parameter parsing issues.

## 12. Terminate the EC2 instance

When finished, disconnect from SSH:

```bash
exit
```

Back in PowerShell, terminate the instance using its actual ID:

```powershell
aws ec2 terminate-instances --instance-ids i-16595db6108dd8680 --endpoint-url http://localhost:4566
```

Check its state:

```powershell
aws ec2 describe-instances --endpoint-url http://localhost:4566 --query "Reservations[].Instances[].[InstanceId,State.Name]" --output table
```

The instance may remain visible with a `terminated` state.

Do not assume that terminating the instance removes every resource. Inspect associated storage and other resources separately if you are practising resource cleanup.

## 13. Quick reference

| Task | Command or value |
|---|---|
| Start Floci | `docker compose up -d` |
| EC2 API endpoint | `http://localhost:4566` |
| List instances | `aws ec2 describe-instances --endpoint-url http://localhost:4566` |
| SSH key name | `floci-key` |
| Private key | `$env:USERPROFILE\.ssh\floci-key` |
| Public key | `$env:USERPROFILE\.ssh\floci-key.pub` |
| Launch configuration | `$HOME\ec2-launch.json` |
| SSH host port in this setup | `2200` |
| SSH command | `ssh -i "$env:USERPROFILE\.ssh\floci-key" -p 2200 root@127.0.0.1` |
| Inspect Docker mappings | `docker ps --format "table {{.Names}}\t{{.Ports}}"` |
| Terminate instance | `aws ec2 terminate-instances --instance-ids <INSTANCE_ID> --endpoint-url http://localhost:4566` |

## 14. Important notes

1. Run the AWS CLI configuration commands again in each new PowerShell session unless you configure them persistently.
2. Use `--endpoint-url http://localhost:4566` on AWS CLI commands to target Floci explicitly.
3. Do not use real AWS access keys for this local simulator.
4. The SSH port is the host port mapped to container port `22`, not the instance's private IP.
5. A successful SSH connection verifies access to the container-backed environment; it does not establish that a full real-world EC2 VM has been provisioned.
6. Keep the private SSH key secret and retain the public key for importing into Floci.

**Result:** You have configured Floci, imported an SSH key pair, launched a local EC2 instance, connected to it from Windows PowerShell over SSH, and learned how to terminate it.






1. Compose up
2. ssh -i "$env:USERPROFILE\.ssh\floci-key" -p 2200 root@127.0.0.1
