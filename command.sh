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

# add list of packages
yarn add @svgr/webpack@^8.1.0 babel-plugin-dynamic-import-node@^2.3.3 babel-plugin-macros@^3.1.0 babel-plugin-js-logger@^1.0.17 css-loader@^6.8.1 dotenv-webpack@^8.0.1 i18next ignore-loader@^0.1.2 mini-css-extract-plugin@^2.7.6 js-logger@^1.6.1 postcss@^8.4.29 postcss-flexbugs-fixes@^5.0.2 postcss-import@^15.1.0 postcss-loader@^7.3.3 postcss-preset-env@^9.1.2 process@^0.11.10 ramda sass@^1.66.1 sass-loader@^13.3.2 source-map-loader@^4.0.1 style-loader@^3.3.3

# config babel from wheel repo
curl -o "babel.config.js" "https://raw.githubusercontent.com/bigbinary/wheel/main/babel.config.js"

# customizing Shakapacker configuration from wheel repo
raw_base_url="https://raw.githubusercontent.com/bigbinary/wheel/main"
declare -a configs=(
  "config/webpack/environment.js"
  "config/webpack/development.js"
  "config/webpack/production.js"
  "config/webpack/test.js"
  "config/webpack/rules.js"
  "config/webpack/webpack.config.js"
  "config/webpack/helpers/customize-default-rules.js"
  "config/webpack/helpers/utils.js"
)
for config in "${configs[@]}"; do
  echo "Downloading ${config}..."
  curl --create-dirs -o "${config}" "${raw_base_url}/${config}"
done

# handle alias
touch config/webpack/resolve.js
cat << EOF > config/webpack/resolve.js
const path = require("path");

const absolutePath = basePath =>
  path.resolve(__dirname, "..", "..", \`app/javascript/\${basePath}\`);

module.exports = {
  alias: {
  },
  extensions: [
    ".ts",
    ".mjs",
    ".js",
    ".sass",
    ".scss",
    ".css",
    ".module.sass",
    ".module.scss",
    ".module.css",
    ".png",
    ".svg",
    ".gif",
    ".jpeg",
    ".jpg",
  ],
};
EOF

# Webpack development server
./bin/webpacker-dev-server

# *** Tailwind ***

# add tailwind css
yarn add tailwindcss@^3.4.1