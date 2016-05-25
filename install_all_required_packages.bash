#!/bin/bash
# script for installing new ruby, rails and mysql client application and gem
# run it with this command:     . ./install_all_required_packages_script.bash

echo 11111
sudo apt-get update;
sudo apt-get install gcc git-core curl nginx zlib1g-dev mysql-client libmysqlclient-dev nodejs build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y;

echo 22222
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv;
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile;
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile;

echo 33333
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build;
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile;
source ~/.bash_profile;

echo 44444
rbenv install -v 2.2.3;
rbenv global 2.2.3;
echo "gem: --no-document" > ~/.gemrc;

echo 55555
gem install bundler;
gem install rails;
rbenv rehash;

ruby -v;
rails -v;

echo 66666
git clone https://github.com/adityahemanth/lookup;
cd lookup;
bundle install;
rake db:schema:dump;
rails s;

echo 77777

