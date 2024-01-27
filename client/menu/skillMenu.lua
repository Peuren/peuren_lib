if not Config.SkillMenu.Enabled then return end

function OpenSkillMenu()
    local skillData = Core.Framework.Callbacks.Trigger("peuren_lib:GetSkillData")

    if not skillData then return end

    local options = {}

    for k, v in pairs(skillData) do
        options[#options+1] = {
            title = Core.Locale(v.locale),
            description = Core.Locale('skill_menu_description'):format(v.xp, v.level),
        }
    end

    Core.Menu(Core.Locale("skill_menu_title"), options)
end

if Config.SkillMenu.Command then
    RegisterCommand(Config.SkillMenu.Command, function()
        OpenSkillMenu()
    end)
end

exports("OpenSkillMenu", OpenSkillMenu)