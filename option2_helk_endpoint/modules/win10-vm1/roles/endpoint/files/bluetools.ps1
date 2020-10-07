
# Upload Sysmon
(New-Object System.Net.WebClient).DownloadFile('https://github.com/iknowjason/BlueTools/blob/main/Sysmon.zip?raw=true', 'C:\terraform\Sysmon.zip')

# Upload winlogbeat
(New-Object System.Net.WebClient).DownloadFile('https://github.com/iknowjason/BlueTools/blob/main/winlogbeat-7.9.2-windows-x86_64.zip?raw=true', 'C:\terraform\winlogbeat.zip')

# Upload configuration zip file, which contains SwiftOnSecurity sysmon config and winlogbeat config
(New-Object System.Net.WebClient).DownloadFile('https://github.com/iknowjason/BlueTools/blob/main/configs.zip?raw=true', 'C:\terraform\configs.zip')

# Expand the Sysmon zip archive
Expand-Archive -LiteralPath 'C:\terraform\Sysmon.zip' -DestinationPath 'C:\terraform\Sysmon'

# Expand the configs zip archive
Expand-Archive -LiteralPath 'C:\terraform\configs.zip' -DestinationPath 'C:\terraform\configs'

# Copy the Sysmon configuration for SwiftOnSecurity to destination Sysmon folder
Copy-Item "C:\terraform\configs\sysmonconfig-export.xml" -Destination "C:\terraform\Sysmon"

# Install Sysmon
C:\terraform\Sysmon\sysmon.exe -accepteula -i C:\terraform\Sysmon\sysmonconfig-export.xml 

# Expand the winlogbeat zip archive
Expand-Archive -LiteralPath 'C:\terraform\winlogbeat.zip' -DestinationPath 'C:\terraform\Winlogbeat'

# Copy the Winlogbeat HELK configuration to destination Winlogbeat folder
Copy-Item "C:\terraform\configs\winlogbeat.yml" -Destination "C:\terraform\Winlogbeat\winlogbeat-7.9.2-windows-x86_64"

# Copy the Winlogbeat folder to C:\ProgramData
Copy-Item "C:\terraform\Winlogbeat\winlogbeat-7.9.2-windows-x86_64" -Destination "C:\ProgramData\Winlogbeat" -Recurse

# Install the Winlogbeat service using included powershell script 
C:\ProgramData\Winlogbeat\install-service-winlogbeat.ps1

# Start the Winlogbeat service
start-service winlogbeat
