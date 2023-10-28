function Notify(title, desc, type)
    ESX.ShowNotification(title..": "..desc, type, 5000)
end

return Notify