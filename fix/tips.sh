# FIND ROOT exclude DIRECTORY /mnt/
sudo find / -path "/mnt" -prune -o -name "file.txt"
sudo find -path "./mnt" -prune -o -name "file.txt"


webscreenshot error 
export OPENSSL_CONF=/etc/ssl/