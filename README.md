#ecrails_templates
=================

Rails templates and useful scripts for creating new rails applications and adding useful functions like deployments.

Rails 3.2.3 or higher is recommended.  We found problems with 3.1.x but we haven't tried all the different permutations to provide an exact list of what works.

## Generating a rails app

```
rails new my_awesome_app -T -m https://raw.github.com/edgecase/ecrails_templates/master/rails_templates/ecuk_standard_app.rb
```

We will be adding to this configuration over time, so we won't document the details of what this does here.  However, the source code is quite straightforward so you should be able to read it easily.

## Generating a Deployment

Pull this repo down, or install it as a gem.  Then run the following with your own application's details to create a new deployment.  The results are sent to stdout so you can redirect them anywhere you see fit.

```
# This script is held in the bin dir of the repo
$ ruby ecuk_generate_deployment.rb -n my_app_name -r git@github.com:edgecase/my_app_name.git
```

## Ruby 1.9.3 remote connection issues

While working on this, I had a few problems connecting to remote servers when using 1.9.3.  Here are the solutions in case you run into any of these.

### SSL Certificate Verifictaion Failed

If you get an error like this

SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed (OpenSSL::SSL::SSLError)

Try upgrading openssl via MacPorts (or similar)

Also, download an updated certificate file as follows

See: http://stackoverflow.com/questions/8101377/certificate-verify-failed-openssl-error-when-using-ruby-1-9-3

```
$ cd /opt/local/etc/openssl
$ sudo curl -O http://curl.haxx.se/ca/cacert.pem
$ sudo mv cacert.pem cert.pem
```

### Segementation Fault Running Bundler

This is caused by a problem in MacPorts/openssl land.  The solution is to recompile ruby forcing it to use a compatible version of ssl.

See: http://blog.55minutes.com/2012/01/fixing-a-segmentation-fault-in-ruby-193

There is more detail on the underlying problem at: http://www.christopherirish.com/2011/09/02/ruby-1-9-2-segmentation-fault-and-openssl/

In summary, though, this should fix it...

```
$ sudo port upgrade openssl
$ rvm install ruby-1.9.3 --with-openssl-dir=/opt/local --with-iconv-dir=/opt/local
```