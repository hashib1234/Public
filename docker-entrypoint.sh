#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid



echo "MySQL is up and running!"



bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:create db:migrate db:seed


 rails server -b "0.0.0.0"
