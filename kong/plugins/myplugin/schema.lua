local typedefs = require "kong.db.schema.typedefs"


local PLUGIN_NAME = "myplugin"


local schema = {
  name = PLUGIN_NAME,
  fields = {
    { config = {
        type = "record",
        fields = {
          { some_config = typedefs.header_name {
              required = true,
              default = "Hello-World" } },
          { some_other_config = typedefs.header_name {
              required = true,
              default = "Bye-World" } },
        },
        entity_checks = {
        },
      },
    },
  },
}

return schema
