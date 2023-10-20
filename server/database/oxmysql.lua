Database = {
    FetchSync = function(query, params)
        return exports.oxmysql:executeSync(query, params)
    end,

    ExecuteSync = function(query, params)
        return exports.oxmysql:executeSync(query, params)
    end,

    Insert = function(query, params, callback)
        exports.oxmysql:insert(query, params, callback)
    end,
    Execute = function(query, params, callback)
        exports.oxmysql:execute(query, params, callback)
    end
}

return Database