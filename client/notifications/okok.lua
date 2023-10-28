function Notify(title, desc, type)
    exports[Config.NotificationsResource]:Alert(title, desc, 5000, type, false)
end

return Notify