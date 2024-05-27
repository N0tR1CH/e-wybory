#!/bin/sh

# Thanks to 'set -e' script will fail as soon as any subsequent comamnd terminate with non-zero exit status
set -e

# If server.pid file already exists then remove it
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Start rails server
exec "$@"

