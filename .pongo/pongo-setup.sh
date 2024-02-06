#!/bin/bash
if [ "$PONGO_COMMAND" = "shell" ]; then

  # Make Kong use the declarative config from file kong-conf.yaml of the host
  export KONG_DATABASE=off
  export KONG_DECLARATIVE_CONFIG=/kong-plugin/kong-conf.yaml

  # Initialize db and start kong
  kong migrations bootstrap --force
  kong start

  # Sample request in the plugin route
  curl -i --head --url "http://localhost:8000/foo"
fi
