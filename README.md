Hearno
========================

A app for friends, to build something fun while learning a bit more about programming.
________________________


__CI Build Status__

[![Build Status](https://secure.travis-ci.org/danmayer/hearno.png)](http://travis-ci.org/danmayer/hearno)


### TODOS

* one this issue is fixed bump the db cleaner gem version https://github.com/bmabey/database_cleaner/pull/191

### IRB Tips
________________________


    #add admin role to a user in IRB console
    User.first.update_attributes({"role_ids"=>"1"}, :as => :admin)
    
### Random Tips
________________________

* [Various Heroku commands for Rails3 apps](https://devcenter.heroku.com/articles/rails3#console)

### Vagrant

To help simplify the development setup you can run on a preconfigured vagrant box. First grab the latest free [virtual box](https://www.virtualbox.org/) client for your OS. Then follow the commands below.

    cd ~/projects/hearno
    vagrant box add hearno https://www.dropbox.com/s/2nm494bm0prfhxr/hearno.box
    vagrant up
    vagrant ssh
    sudo apt-get update #stay up to date on the latest on vagrant
    cd /vagrant #this should put you into the rails app project directory
    bundle exec rails s 
    #Listening on 0.0.0.0:3000, but go to 4000 where vagrant is forwarding
    open http://localhost:4000

### Acknowledgments
________________________

This application was generated with the rails_apps_composer gem:
https://github.com/RailsApps/rails_apps_composer
provided by the RailsApps Project:
http://railsapps.github.com/

Recipes:
["controllers", "core", "email", "extras", "frontend", "gems", "git", "init", "models", "prelaunch", "railsapps", "readme", "routes", "saas", "setup", "testing", "views"]

Preferences:
{:git=>true, :railsapps=>"rails3-bootstrap-devise-cancan", :database=>"sqlite", :unit_test=>"rspec", :integration=>"cucumber", :fixtures=>"factory_girl", :frontend=>"bootstrap", :bootstrap=>"sass", :email=>"gmail", :authentication=>"devise", :devise_modules=>"default", :authorization=>"cancan", :starter_app=>"admin_app", :form_builder=>"simple_form", :quiet_assets=>true, :local_env_file=>true, :better_errors=>true, :dev_webserver=>"thin", :prod_webserver=>"thin", :templates=>"erb", :continuous_testing=>"guard", :rvmrc=>true, :ban_spiders=>true, :github=>true}

________________________

####License

MIT

Copyright (c) 2013 Dan Mayer, Julio Jimenez, Aaron McKay

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.