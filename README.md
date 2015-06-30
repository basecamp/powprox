* Proxy HTTP/HTTPS/SPDY/HTTP2 to Pow
* Automatically manage SSL certs and nginx config for Pow sites
* Pull in optional nginx config for each Pow site

Inspired by @paulnicholson's [powssl for Stud](https://gist.github.com/paulnicholson/2050941)
which raised the bar from a simple wildcard SSL proxy to a smooth, browser-friendly setup.

Install:
* create certificate authority
  * set up directories
    BASE="$USER/.powprox/openssl"
    mkdir -p "$BASE" && cd "$BASE"
    mkdir -p certs newcerts private
    touch index.txt
  * generate CA private key and CSR
    openssl req -new -keyout "$BASE/private/pow_ca_key.pem" -out "$BASE/pow_ca_req.pem"
    openssl ca 3650 -create_serial -batch -selfsign -extensions v3_ca -out "$BASE/pow_ca_cert.pem" -keyfile "$BASE/private/pow_ca_key.pem" -infiles "$BASE/pow_ca_req.pem"
* generate pow.dev cert
  * generate private key and CSR with SAN for all Pow hostnames
    openssl req 3650 -new -nodes -keyout pow_req.pem -out pow_req.pem
  * sign with CA cert
    openssl ca -policy policy_anything -out pow_cert.pem -infiles pow_req.pem
* install nginx
  * symlink powprox.nginx.conf into /usr/local/etc/nginx/servers/
  * mkdir -p ~/.powprox/servers
  * add launchd plist to /Library/LaunchDaemons
* add CA cert to Keychain trusted root
  * sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ~/.powprox/openssl/certs/ca.pem

generate CA
add CA cert to trusted root
generate cert with SAN for all Pow hostnames
generate nginx .dev/test config
