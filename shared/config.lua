Config = {}

Config.Debug = false -- Adds additional prints and enables all other resource debug options | true or false
Config.Language = 'en' -- Language file name, this means, that it will only load files from script locales folders that contain this name, 
                        -- if this is an invalid locale name on a resource it will default to english

Config.Framework = "qb" -- esx / qb - The framework your server is based on
Config.FrameworkResource = "qb-core" -- Framework resource name

Config.SQLConnector = "oxmysql" -- oxmysql / mysql-async  / ghmattimysql - The SQL connector resource that you're using.

Config.Inventory = "qb-inventory" -- esx_inventory / qb-inventory / ox_inventory / qs-inventory / core_inventory / cheeza_inventory / mf_inventory - The inventory system that you're using
Config.InventoryResource = 'qb-inventory' -- The inventory system folder name that you're using

Config.Target = "qb-target" -- qb-target / ox_target / qtarget - The target system that you're using.

Config.ProgessBar = 'qb' -- ox_lib / qb - The progress bar system that you're using.

Config.Menu = 'qb' -- ox_lib / qb / nh-context / esx_menu_default / esx_context - The menu system that you're using.
Config.MenuResource = 'qb-menu'

Config.Input = 'qb-input' -- ox_lib / qb-input / nh-keyboard - The input system that you're using
Config.InputResource = 'qb-input' -- The input system folder name that you're using

Config.Notifications = "qb" -- ox_lib / qb / esx / okok / mythic - The notification system that your're using
Config.NotificationsResource = "qb" -- The notification system folder name that you're using