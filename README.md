# Important Information:  
This repository is no longer being maintained.  To see the new version of this, visit the BlueCloud repository:
https://github.com/iknowjason/BlueCloud

# Overview:  HELK_Azure
Automated Terraform deployment of HELK in Azure using Terraform templates!
Automates the deployment of the Hunting ELK:  https://github.com/Cyb3rWard0g/HELK

# Option 1:  HELK Standalone
This option automatically deploys HELK in Azure VM infrastructure with the Option #4 HELK deployment and hardware.  For this option, navigate to the Option 1 directory for instructions.

# Option 2:  HELK with Endpoint
This option automatically deploys HELK in Azure VM infrastructure with a Windows 10 Professional endpoint.  The Windows machine automatically installs Sysmon and Winlogbeat and all logs are sent via Kafka output to the HELK server.  For this option,  navigate to the Option 2 directory for more information.
