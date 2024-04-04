# create db
rails db:create

# migrate db
rails db:migrate

# *** Shakapacker ***

# add yarn install
add yarn 

# remove app/javascript
rm -rf app/javascript

# add gem "shakapacker", "~> 6.6.0"

# install webpack
bin/rails webpacker:install

# upgrade webpack
yarn upgrade webpack-dev-server@4.13.1