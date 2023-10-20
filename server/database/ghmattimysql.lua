Database = {
    FetchSync = function(query, params)
        return exports.ghmattimysql:execute(query, params)
    end,

    ExecuteSync = function(query, params)
        return exports.ghmattimysql:execute(query, params)
    end,

    Insert = function(query, params, callback)
        exports.ghmattimysql:execute(query, params, callback)
    end,

    Execute = function(query, params, callback)
        exports.ghmattimysql:execute(query, params, callback)
    end
}

return Database