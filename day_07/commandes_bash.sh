brew update
brew install postgresql
#==> Caveats
#If builds of PostgreSQL 9 are failing and you have version 8.x installed,
#you may need to remove the previous version first. See:
#  https://github.com/Homebrew/homebrew/issues/2510
#
#To migrate existing data from a previous major version (pre-9.0) of PostgreSQL, see:
#  https://www.postgresql.org/docs/9.6/static/upgrading.html
#
#To migrate existing data from a previous minor version (9.0-9.5) of PostgreSQL, see:
#  https://www.postgresql.org/docs/9.6/static/pgupgrade.html

#  You will need your previous PostgreSQL installation from brew to perform `pg_upgrade`.
#  Do not run `brew cleanup postgresql` until you have performed the migration.
#
#To have launchd start postgresql now and restart at login:
#  brew services start postgresql
#Or, if you don't want/need a background service you can just run:
#  pg_ctl -D /Users/pcadiot/.brew/var/postgres start
pg_ctl -D /Users/pcadiot/.brew/var/postgres start
cd ex00
rvm 2.3.3
rvm gemset create d07
rvm gemset use d07
gem install rails -v 4.2.7
bundle update
createdb d07
rails new acme -d postgresql
cd acme
cp -f ~/Downloads/gemfile .
rake db:create
#ex01
rails generate devise:install
#copier le code ci-dessous dans application.html.erb
#<div class="row">
#  <div class="col-xs-6 col-xs-offset-3">
#    <% if flash[:notice] %>
#      <div class="alert alert-info" role="alert">
#        <%= flash[:notice] %>
#      </div>
#    <% end %>
#
#    <% if flash[:alert] %>
#      <div class="alert alert-danger" role="alert">
#        <%= flash[:alert] %>
#      </div>
#    <% end %>
#
#  </div>
#</div>
rails generate devise user name:string email:string password:string password_confirmation:string bio:text
rails g controller users new create edit