function Notify(title, desc, type)
    QBCore.Functions.Notify({text = desc, caption = title}, type, 5000)
end

return Notify