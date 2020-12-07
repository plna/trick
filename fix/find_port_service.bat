rem FIND open port with service
netstat -ano | findstr "8080"
rem Replace 1111 with PID in the above port 8080
tasklist | findstr "1111"
rem kill task
taskkill /f /t /im not_exist.exe


netsh interface portproxy delete v4tov4 listenport=8080 listenaddress=127.0.0.1