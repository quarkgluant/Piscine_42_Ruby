#!/bin/bash
echo "########################################## multipl apt-get install -y\n\n"
sudo apt-get install -y curl
sudo apt-get install -y git 
sudo apt-get install -y vi
sudo apt-get install -y postgresql-9.4
sudo apt-get install -y libpq-dev
sudo apt-get install -y nodejs
echo "########################################## install postgresql & create db\n\n"
sudo -u postgres psql --command "CREATE ROLE vagrant WITH SUPERUSER CREATEDB LOGIN;"
echo "########################################## install rvm & ruby"
\curl -sSL https://rvm.io/mpapis.asc | gpg --import
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.3
source /home/vagrant/.rvm/scripts/rvm
echo "gem: --no-document" >> ~/.gemrc
echo "########################################## install rails puma\n\n"
gem install rails -v 4.2.7
gem install puma
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/hosts

mkdir /home/vagrant/site
cd /home/vagrant/site
rails new foubarre -d postgresql
cd foubarre
rails g scaffold component great_data
echo "Component.create(great_data: 'foo_bar_name')" >> db/seeds.rb
bundle install
sed -i -e "s/username: foubarre/username: vagrant/g" config/database.yml
RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake db:seed
sed -i "2iroot to: 'components#index'" config/routes.rb
echo "<h1><%=Rails.env%></h1>">app/views/components/index.html.erb
export SECRET_KEY_BASE=`rake secret`
puma -e production -b 'tcp://0.0.0.0:3000' config.ru
sudo usermod -p vagrant vagrant