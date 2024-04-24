'Powershell.exe -WindowStyle hidden Install-WindowsFeature -Name Web-Server -IncludeManagementTools':
  cmd.run:
    - runas: corp\Administrator
    - password: VMware1! 
