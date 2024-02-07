Input = function(header, options)
    local input = {}

    for _, v in pairs(options) do
        input[#input + 1] = {
            text = v.title,
            placeholder = v.name,
            type = v.type,
            isRequired = v.isRequired or false,
            default = v.default,
            options = v.options or nil,
        }
    end

    return exports[Config.InputResource]:Input({
        header = header,
        inputs = input
    })
end 

return Input