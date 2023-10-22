Config = {}

Config.Debug = false -- Adds additional prints and enables all other resource debug options | true or false
Config.Language = 'en' -- Language file name, this means, that it will only load files from script locales folders that contain this name, 
                        -- if this is an invalid locale name on a resource it will default to english

Config.Framework = "esx" -- esx / qb - The framework your server is based on
Config.FrameworkResource = "es_extended" -- Framework resource name

Config.SQLConnector = "oxmysql" -- oxmysql / mysql-async  / ghmattimysql - The SQL connector resource that you're using.

Config.Inventory = "ox_inventory" -- esx_inventory / qb-inventory / ox_inventory / qs-inventory / core_inventory / cheeza_inventory / mf_inventory - The inventory system that you're using
Config.InventoryResource = 'ox_inventory' -- The inventory system folder name that you're using

Config.Target = "ox_target" -- qb-target / ox_target / qtarget - The target system that you're using.

Config.ProgessBar = 'ox_lib' -- ox_lib / qb - The progress bar system that you're using.

Config.Menu = 'ox_lib' -- ox_lib / qb / nh-context / esx_menu_default / esx_context - The menu system that you're using.
Config.MenuResource = 'ox_lib'

Config.Input = 'ox_lib' -- ox_lib / qb-input / nh-keyboard - The input system that you're using
Config.InputResource = 'ox_lib' -- The input system folder name that you're using