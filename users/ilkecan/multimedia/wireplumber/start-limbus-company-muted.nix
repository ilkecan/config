{
  ...
}:

{
  xdg.configFile."wireplumber/wireplumber.conf.d/start-limbus-company-muted.conf".text = ''
    wireplumber.components = [
      {
        name = start-limbus-company-muted.lua
        type = script/lua
      }
    ]
  '';

   xdg.dataFile."wireplumber/scripts/start-limbus-company-muted.lua".text = ''
    mute_limbus_om = ObjectManager {
      Interest {
        type = "node",
        Constraint { "application.name", "equals", "LimbusCompany.exe" },
        Constraint { "media.class", "equals", "Stream/Output/Audio" },
        Constraint { "media.name", "equals", "audio stream #1", type = "pw" },
      },
    }

    mute_limbus_om:connect("object-added", function(_, node)
      local muted = false
      node:connect("params-changed", function()
        if node.properties["pulse.corked"] ~= "false" or muted then
          return
        end

        muted = true
        node:set_params("Props", Pod.Object {
          "Spa:Pod:Object:Param:Props", "Props",
          mute = true,
        })
      end)
    end)

    mute_limbus_om:activate()
  '';
}
