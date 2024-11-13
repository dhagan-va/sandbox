dc-localstack.yml - GFE you MUST run from an elevated (zero account) powershell.  DO NOT run from gitbash.
docker-compose -f [name of the file] up

#some localstack commands fail without the latest localstack update
#grab latest with command below
docker pull localstack/localstack

WSL issue on later version of docker desktop
If you docker doesn't run because of wsl go to Docker Desktop > Settings > General > (Uncheck) Use the WSL 2 based engine

If you cannot uninstall docker delete this registry item (zero account)
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Docker Desktop
