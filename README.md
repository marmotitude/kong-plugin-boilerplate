# `<Your plugin name>` Kong Plugin

[Kong](https://docs.konghq.com/gateway-oss/) plugin for `<what your plugin do>`.

## Overview


## Development

For development and local testing, use [kong-pongo](https://github.com/Kong/kong-pongo).

### Running tests

Tests are located on the [/specs](./spec) folder. To run the whole suite use:

```
pongo run
```

### Pongo shell

To manually make requests to a Kong Gateway configured with this plugin, you can use the pongo shell,
to recreate the environment and enter a interactive shell type:

```
pongo restart
pongo shell
```

Inside the shell, a bootstrap script that starts kong and configure services, routes and plugins
will run, the contents of this script is at [.pongo/pongo-setup.sh](.pongo/pongo-setup.sh).

After this initial setup, kong will be running on `localhost:8000` and you can type curl commands
to send requests to it (the kong API runs on port 8001 if needed for aditional setups).

## Acknowledgements

- https://github.com/Kong/kong-plugin/tree/master
- https://github.com/Kong/kong-pongo
- https://github.com/marmotitude/kong-plugin-boilerplate
