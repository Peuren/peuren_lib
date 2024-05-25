Config = {}

Config.Debug = false -- Adds additional prints and enables all other resource debug options | true or false
Config.Language = 'en' -- Language file name, this means, that it will only load files from script locales folders that contain this name, 
                       -- if this is an invalid locale name on a resource it will default to english

Config.Framework = "qb" -- esx / qb / qbx (Uncomment qbx_core export in fxmanifest.lua file) / ox (Uncomment ox_core imports in fxmanifest.lua file) - The framework your server is based on
Config.FrameworkResource = "qb-core" -- Framework resource name

Config.SQLConnector = "oxmysql" -- oxmysql / mysql-async  / ghmattimysql - The SQL connector resource that you're using.

Config.Inventory = "ox_inventory" -- mf-inventory / esx_inventory / qb-inventory / ox_inventory / qs-inventory - The inventory system that you're using
Config.InventoryResource = 'ox_inventory' -- The inventory system folder name that you're using

Config.Target = "ox_target" -- qb-target / ox_target / qtarget - The target system that you're using.
Config.TargetResource = 'ox_target' -- The inventory system folder name that you're using

Config.ProgessBar = 'ox_lib' -- ox_lib / qb - The progress bar system that you're using.

Config.Menu = 'ox_lib' -- ps-ui / ox_lib (Uncomment ox_lib export in fxmanifest.lua file) / qb / nh-context / esx_menu_default / esx_context - The menu system that you're using.
Config.MenuResource = 'ox_lib'

Config.Input = 'ox_lib' -- okokTextUI / ps-ui / ox_lib (Uncomment ox_lib export in fxmanifest.lua file) / qb-input / nh-keyboard - The input system that you're using
Config.InputResource = 'ox_lib' -- The input system folder name that you're using

Config.TextUI = "ox_lib" -- ps-ui / ox-lib (Uncomment ox_lib export in fxmanifest.lua file) / qb - The TextUI system that you're using
Config.TextUIResource = "ox_lib" -- The TextUI system folder name that you're using

Config.Poly = "ox_lib" -- polyzone/ox_lib (Uncomment ox_lib export in fxmanifest.lua file)
Config.PolyResource = "ox_lib" -- The Polyzone system folder name that you're using

Config.Notifications = "ox_lib" -- ps-ui / ox_lib (Uncomment ox_lib export in fxmanifest.lua file) / qb / esx / okok / mythic - The notification system that your're using
Config.NotificationsResource = "ox_lib" -- The notification system folder name that you're using

Config.WeatherSync = 'qb-weathersync'-- renewed-weathersync / qb-weathersync / cd_easytime - The weathersync system thet you're using

Config.Dispatch = 'cd_dispatch' -- origen_police / rcore_dispatch / cd_dispatch / core_dispatch / default / outwalter / ps-dispatch / qs-dispatch - The dispatch system that you are using for alerts
Config.DispatchResource = 'cd_dispatch' -- The dispatch system resource folder name

Config.Fuel = 'LegacyFuel' -- okokGasStation / LegacyFuel / ox_fuel / lj-fuel / ti-fuel / ND_fuel / ps-fuel / esx-sna-fuel / cdn-fuel / FRFuel -- The fuel system that you're using
Config.FuelResource = 'LegacyFuel' -- The fuel system resource folder name

Config.VehicleKeys = 'qb-vehiclekeys' -- okokGarage / qs-vehiclekeys / wasabi_carlock / cd_garage / t1ger_keys / F_RealCarKeysSystem / fivecode_carkeys / qb-vehiclekeys / stasiek_vehiclekeys / ti_vehicleKeys / vehicles_keys / xd_locksystem / -- The vehicle key system that you're using
Config.VehicleKeysResource = 'qb-vehiclekeys' -- The vehicle key system resource folder name

Config.CarryItemsEnabled = true -- Should the Carry Items system be enabled for supported inventores esx/qb/ox_inventory (QS-INVENTORY support is coming)
Config.SkillMenu = { -- Configuration for skill menu.
    Enabled = true, -- Should the Skill Menu be enabled
    Command = "skills" -- The comand which opens the skill menu. Set this to false to disable it. Skill menu can be also opened by using exports["peuren_lib"]:OpenSkillMenu()
}

Config.Clothing = 'qb-clothing' -- esx_skin / fivem-appearance / illenium-appearance / ox_appearance / qb-clothing