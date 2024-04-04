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

# config webpacker from wheel repo
curl -o "config/webpacker.yml" "https://raw.githubusercontent.com/bigbinary/wheel/main/config/webpacker.yml"

# update app folder structure
mkdir -p ./app/javascript/packs/
mv ./app/javascript/application.js ./app/javascript/packs/application.js

# add browserlistrc
echo "cover 95%" > .browserslistrc  