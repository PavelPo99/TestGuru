set -o errexit

yarn build
yarn build:css

bundle install
bin/rails assets:precompile
bin/rails assets:clean
bin/rails db:migrate
