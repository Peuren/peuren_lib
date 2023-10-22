Input = function(title, options)
    local input = {}

    for _, v in pairs(options) do
        input[#input + 1] = {
            text = v.title,
            name = v.name,
            type = v.type,
            isRequired = v.isRequired or false,
            default = v.default,
            options = v.options or nil,
        }
    end

    return exports[Confif.InputResource]:ShowInput({
        header = header,
        submitText = locale('input_confirm'),
        inputs = fields,
    })
end 

return Input