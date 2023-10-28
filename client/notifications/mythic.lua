function Notify(title, desc, type)
    if type == "info" then type = "inform" end
    exports[Config.NotificationsResource]:SendAlert(type, title..": "..desc)
end

return Notify