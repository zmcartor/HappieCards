Happie Cards
==========

A small greeting card project built with **Sinatra**

#### Includes
* ActiveRecord
* Sprockets
* Paperclip
* Facebook JS API
* Koala
* HappieCard IRB Console
* Bootstrap

### Why ?
Sending greeting cards should be simple and fun. The typical eCard site is a blackhole of poor design and banner ads.

##Getting Started
*bundle install
*Edit the file config/db.yml for your specific DB settings
*rake db:migrate
*./startserver

HappieCards uses Facebook auth for all it's user business, so a FB application
key is needed for domain localhost:9393 (or whevever HappieCards is running). Place this key within config/access.yml.

The included config.ru should be enough to get started on any rack compliant
environment.

## Architecture

Built on Sinatra, this is a skinny MVC with parts broken out into respective
folders. app.rb requires controllers/init.rb and models/init.rb which in turn
link in all needed model or controller files. 

Model classes subclass ActiveRecord::Base and perform all the AR magic.

Controller classes subclass HappieCards, which allows the controllers to add
new routes to the app namespace. Controller files are organized under a
resource. ie - /foo or /beer.

## Configuration
Put Facebook creds in config/access.yml

If you're using a CDN, create a paperclip.yml and place CDN configuration
there. It will be added to the Paperclip::Attachment.defaults array. Here's an
example that will upload to Rackspace:

defaults:
  storage: !ruby/symbol fog
  use_timestamp: false
  fog_credentials:
    provider: 'Rackspace'
    rackspace_api_key: '12345568565868568568586'
    rackspace_username: 'SmilyGuy'
  fog_directory: 'happie'
  fog_public: true
  fog_host: 'http://04309ca038a9dfdfdfdb8-4abc72c672de1f2d0fd428ce7da4ea95.r61.cf1.rackcdn.com'
