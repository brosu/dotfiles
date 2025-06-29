local lastCmdTime = 0
local kittyAppName = "kitty"

-- Bind the left_command key (⌘)
local cmdWatcher = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(event)
    local flags = event:getFlags()
    local now = hs.timer.secondsSinceEpoch()

    -- Detect left_command only (not when other modifiers are held)
    if flags["cmd"] and not (flags["shift"] or flags["ctrl"] or flags["alt"] or flags["fn"]) then
        if (now - lastCmdTime) < 0.3 then
            toggleKitty()
        end
        lastCmdTime = now
    end
    return false
end)

cmdWatcher:start()

-- Toggle Kitty: show if hidden, hide if frontmost
function toggleKitty()
    local app = hs.application.find(kittyAppName)
    if app then
        local win = app:mainWindow()
        if win and app:isFrontmost() then
            app:hide()
        else
            hs.application.launchOrFocus(kittyAppName)
            hs.timer.doAfter(0.1, function()
                local newWin = app:mainWindow()
                if newWin then newWin:focus() end
            end)
        end
    else
        hs.application.launchOrFocus(kittyAppName)
    end
end