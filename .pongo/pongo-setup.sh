#!/bin/bash

# Run this script after a pongo restart to recreate a service with a route that uses the plugin

# init db and start kong
kong migrations bootstrap --force
kong start

set -x
# create service
curl -i -X POST --url http://localhost:8001/services/ \
  --data 'name=example-service' \
  --data 'url=http://www.example.com'

# create route
curl -i -X POST --url http://localhost:8001/services/example-service/routes \
    --data 'paths[]=/foo' \
    --data 'name=foo'

# configure plugin on a route
curl -i -X POST --url http://localhost:8001/services/example-service/plugins/ \
    --data 'name=object-storage' \
		--data 'config.some_config=some-config-value'

# access plugin route
curl -i --url "http://localhost:8000/foo"

