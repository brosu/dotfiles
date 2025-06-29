local lastCmdTime = 0
local kittyAppName = "kitty"

-- Bind the left_command key (⌘)
cmdWatcher = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(event)
    local flags = event:getFlags()
    local now = hs.timer.secondsSinceEpoch()
    print("Flags:", hs.inspect(flags), "Time since last ⌘:", now - lastCmdTime)

    -- Detect left_command only (not when other modifiers are held)
    if flags["cmd"] and not (flags["shift"] or flags["ctrl"] or flags["alt"] or flags["fn"]) then
        if (now - lastCmdTime) < 0.3 then
            print("Double ⌘ detected")
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
    print("toggleKitty: found app?", app ~= nil)
    if app then
        local win = app:mainWindow()
        print("Main window exists?", win ~= nil)
        print("App is frontmost?", app:isFrontmost())
        if win and app:isFrontmost() then
            print("Hiding Kitty")
            app:hide()
        else
            print("Focusing Kitty")
            hs.application.launchOrFocus(kittyAppName)
            hs.timer.doAfter(0.1, function()
                local newWin = app:mainWindow()
                if newWin then
                    print("Focusing new window")
                    newWin:focus()
                end
            end)
        end
    else
        print("Kitty not found, launching")
        hs.application.launchOrFocus(kittyAppName)
    end
end

-- Add a reload hotkey and notification
hs.hotkey.bind({"cmd", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Hammerspoon config loaded")

-- Monitor system sleep/wake to restart eventtap if needed
hs.caffeinate.watcher.new(function(event)
  if event == hs.caffeinate.watcher.systemWillSleep then
    print("System going to sleep, stopping cmdWatcher")
    if cmdWatcher and cmdWatcher:isEnabled() then
      cmdWatcher:stop()
    end
  elseif event == hs.caffeinate.watcher.systemDidWake then
    print("System woke up, restarting cmdWatcher")
    if cmdWatcher and not cmdWatcher:isEnabled() then
      cmdWatcher:start()
    end
  end
end):start()

-- Heartbeat log to monitor cmdWatcher status every 60 seconds
hs.timer.doEvery(60, function()
  local status = cmdWatcher and cmdWatcher:isEnabled()
  print("HEARTBEAT: cmdWatcher active:", status)
end)