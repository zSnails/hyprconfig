---@param modes table
---@return MonitorMode
local function get_best_mode(modes)
    local l_modes = modes
    table.sort(l_modes, function(a, b)
        local pixelsA = a["width"] * a["height"]
        local pixelsB = b["width"] * b["height"]

        if pixelsA ~= pixelsB then
            return pixelsA > pixelsB
        end

        return a["refresh_rate"] > b["refresh_rate"]
    end)
    return l_modes[1]
end

local monitors = hl.get_monitors()
for _, value in ipairs(monitors) do
    local best_mode = get_best_mode(value.available_modes)
    hl.monitor({
        output = value.name,
        mode = "" .. best_mode.width .. "x" .. best_mode.height .. "@" .. best_mode.refresh_rate,
        scale = "1"
    })
end
