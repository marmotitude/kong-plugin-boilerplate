#!/bin/bash
# Run this script after a pongo restart to recreate a service with a route that uses the plugin

# utility function
log() {
    printf "\n\n%s\n" "$1"
}

log "Making Kong use the declarative config from file .pongo/kong-conf.yaml of the host"
export KONG_DATABASE=off
export KONG_DECLARATIVE_CONFIG=/kong-plugin/kong-conf.yaml
export KONG_PLUGINS=myplugin

log "Initializing db and startng kong"
kong migrations bootstrap --force
kong start

log "sample request in the plugin route"
curl -i --head --url "http://localhost:8000/foo"
