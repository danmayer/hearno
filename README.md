# Hearno
### :see_no_evil: :hear_no_evil: :speak_no_evil:
_______________


Hearno allows users to express in small photos strips and text blurbs there thoughts on censorship.

It is an app build to teach programming Ruby on Rails to friends. Opposed to just throw away projects while learning to code, we decided to build something fun while learning a bit more about programming. 

Also, possibly to drive some donations to some of our favorite charities, related to freedom of speech.
________________________


### Current CI Build Status

[![Build Status](https://secure.travis-ci.org/danmayer/hearno.png)](http://travis-ci.org/danmayer/hearno)

### Getting setup with your own github fork

* visit [hearno repo](https://github.com/danmayer/hearno)
* click 'fork' button in top right
* on your new repo url, which should reload for you
* copy the ssh url of your repo
* `git clone git@github.com:YOURREPO/hearno.git`
* `cd hearno`
* Follow the local applications setup instructions

### Local Application Setup

* `ruby -v` #does it say ruby 1.9.3, if not need to install that first
* `git clone this_repo_url`
* `gem install bundler`
* `bundle install --without production`
* `bundle exec rake -T` #what tasks do you have
* `bundle exec rake db:create` #build the DB
* `bundle exec rake db:migrate`
* __look at config/application.example.yml__
* `open config/application.yml` #add your information and the hearno email that is at mayerdan.com and private 'secret' keys here
* `rake db:seed` #this will populate your admin / test user
* `bundle exec rake` #do the tests work?
* `bundle exec rails server` #starts the server now visit http://localhost:3000

##### Environment Variables you need

    #check in config/application.example.yml
    HEARNO_GMAIL_USERNAME
    HEARNO_GMAIL_PASSWORD



### Updating and Running the app

##### If you don't have a upstream in your .git/config run the command below once

* `git remote add upstream git@github.com:danmayer/hearno.git`

##### After that, every time

* git fetch upstream
* git reset --hard upstream/master
* (if there are migrations) `bundle exec rake db:migrate`
* (if there are db seeds updated) `bundle exec rake db:seed`
* Restart your server: `bundle exec rails server`


### Basic git commands to push changes

Git is the source code management system we use. It allows all of us to keep our source code in sync together. It also is how we push our source code to our servers to deploy our applications. See the basic command flow below.

* `git status` #shows current progress
* `git add .` #add all new files in project directory
* `git commit -a -m "commit message"` #adds your work to be uploaded
* `git push origin master` #uploads your work to remote code repository

I recommend learning a bit more about git, here are some good tutorials:

* [Atlassian git basics](https://www.atlassian.com/git/tutorial/git-basics)
* [free code school class git real](https://www.codeschool.com/courses/git-real)
* [git basics chapter from git-scm book](http://git-scm.com/book/en/Git-Basics)



### Sharing code changes with the group

* After pushing to you origin master you can submit a PR request.
* If I have set you up with upstream commit access you can `git push upstream/master`

### Setting up SSH for git

* you want public / private key ssh key
* `cd ~/.ssh`
* `ssh-keygen -t rsa -C "your_email@example.com"` #example for OSX
* upload to github so you don't have to type user / password every time you interact with the git repo
* Follow the [github ssh key instructions](https://help.github.com/articles/generating-ssh-keys)

### Creating your own heroku staging server

* make sure you are in the hear no directory
* `heroku apps:create 'hearno-YOURNAME-staging'`
* edit your `./git/config` to add or move the heroku repo it should have something like the below


        [remote "heroku"]
          url = git@heroku.com:hearno-YOURNAME-staging.git
          fetch = +refs/heads/*:refs/remotes/heroku/*

### Upcoming lesson topics

* Google Analytics
* Dog ears to go to previous and next photo strip something like these (http://www.usatoday.com/story/news/politics/2013/09/01/kerry-syria-sarin-evidence/2752837/) (now we just need to style this)
* Adding 3rd party JS for sharing support (twitter, google+, Facebook)
* Building your own class (build a standard ruby class and mess around with it in IRB)
* Modifying existing classes
* From scratch AR models (build out creators to include contact info and sorting etc)
* Webcam support to take a new picture opposed to uploading one
* User galleries to show all strips created by one user
* Beter CSS / Design
* SEO walk through on pages and urls scheme
* Testing
* Refactoring
* Javascript updates
* Building a embeddable widget
* [HTML5 photo uploading with camera support](http://www.storminthecastle.com/2013/05/07/how-you-can-build-an-html5-photobooth-app/)

### TODOS

* one this issue is fixed bump the db cleaner gem version https://github.com/bmabey/database_cleaner/pull/191

### Random Tips
________________________

* [Various Heroku commands for Rails3 apps](https://devcenter.heroku.com/articles/rails3#console)
* To start the rails console (IRB) run `bundle exec rails console`
* To see various rails commands run `bundle exec rails`

### IRB / console Tips
________________________


    #add admin role to a user in IRB console
    User.first.update_attributes({"role_ids"=>"1"}, :as => :admin)
    #or
    User.where(:email =>'youremail@gmail.com').update_attributes({"role_ids"=>"1"}, :as => :admin)
    

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

### License

MIT

Copyright (c) 2013 Dan Mayer, Julio Jimenez, Aaron McKay, Dan Webb

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.