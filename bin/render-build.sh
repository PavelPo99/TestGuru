set -o errexit

bundle install
yarn install
bundler exec rake assets:precompile
bundler exec rake assets:clean
bundler exec rake db:migrate
