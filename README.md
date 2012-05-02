#ecrails_templates
=================

Rails templates and useful scripts for creating new rails applications and adding useful functions like deployments.

## Example

```
rails new my_awesome_app -T -m https://raw.github.com/edgecase/ecrails_templates/master/rails_templates/ecuk_standard_app.rb
```

## Ruby 1.9.3 SSL issue

If you get an error like this

SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed (OpenSSL::SSL::SSLError)

Try upgrading openssl via MacPorts (or similar)

Also, download an updated certificate file as follows (from http://stackoverflow.com/questions/8101377/certificate-verify-failed-openssl-error-when-using-ruby-1-9-3)

```
$ cd /opt/local/etc/openssl
$ sudo curl -O http://curl.haxx.se/ca/cacert.pem
$ sudo mv cacert.pem cert.pem
```