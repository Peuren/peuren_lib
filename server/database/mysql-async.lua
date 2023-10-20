Database = {
    FetchSync = function(query, params)
        return MySQL.Sync.fetchAll(query, params)
    end,
    ExecuteSync = function(query, params)
        return MySQL.Sync.execute(query, params)
    end,
    Insert = function(query, params, callback)
        MySQL.Async.insert(query, params, callback)
    end,
    Execute = function(query, params, callback)
        MySQL.Async.execute(query, params, callback)
    end
}

return Database