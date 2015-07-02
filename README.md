# Powprox: Nginx proxy for Pow apps

* Serve Pow apps with SSL and SPDY
* No certificate mismatch errors in the browser
* Automatically manage SSL certs
* Optional per-app nginx config

# Install
```bash
./bin/powprox setup
open https://yourapp.dev
```

Inspired by @paulnicholson's [powssl for Stud](https://gist.github.com/paulnicholson/2050941)
which raised the bar from a simple wildcard SSL proxy to a smooth, browser-friendly setup.
