# Powprox: Nginx proxy for Pow apps

* Serve Pow apps with SSL and SPDY
* No certificate mismatch errors in the browser
* Automatically manage SSL certs
* Optional per-app nginx config

# Install
```bash
./bin/powprox
open https://yourapp.dev
```

Inspired by @paulnicholson's [powssl for Stud](https://gist.github.com/paulnicholson/2050941)
which raised the bar from a simple wildcard SSL proxy to a smooth, browser-friendly setup.

## Browser support
* Chrome: Just Works
* Safari: Just Works
* Firefox: manually import `~/.powprox/ssl/ca/pow-root-ca.crt` as a trusted certificate authority. Preferences > Advanced > Certificates > View Certificates > Authorities > Import… > Trust this CA to identify websites
* iOS: email yourself `~/.powprox/ssl/ca/pow-root-ca.crt` and open it on the device to install it
* Android: http://wiki.cacert.org/FAQ/ImportRootCert#Android_Phones_.26_Tablets
