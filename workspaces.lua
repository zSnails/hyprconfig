local monitors = hl.get_monitors()
local last_assigned_workspace_id = 0
local workspaces_per_monitor = 10 / #monitors

for _, monitor in ipairs(monitors) do
    for _ = 1, workspaces_per_monitor, 1 do
        last_assigned_workspace_id = last_assigned_workspace_id + 1
        hl.workspace_rule({
            workspace = "" .. last_assigned_workspace_id .. "",
            monitor = monitor.name,
            persistent = true,
        })
    end
end
