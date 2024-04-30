-- mainmodule.lua
local RunService = game:GetService("RunService")

local QuickTask = {}

function QuickTask.spawn(func, ...)
    assert(type(func) == "function", "First argument must be a function")

    local args = {...}
    local count = select("#", ...)

    RunService.Heartbeat:Connect(function()
        func(table.unpack(args, 1, count))
        return true  -- disconnects the event after running once
    end)
end

return QuickTask
