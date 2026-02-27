-- 获取所有屏幕
local screens = hs.screen.allScreens()

-- 跳到第1个屏幕
hs.hotkey.bind({"cmd","alt"}, "1", function()
    local s = screens[1]
    local f = s:frame()
    hs.mouse.absolutePosition({
        x = f.x + f.w/2,
        y = f.y + f.h/2
    })
end)

-- 跳到第2个屏幕
hs.hotkey.bind({"cmd","alt"}, "2", function()
    local s = screens[2]
    local f = s:frame()
    hs.mouse.absolutePosition({
        x = f.x + f.w/2,
        y = f.y + f.h/2
    })
end)

-- 跳到第3个屏幕
hs.hotkey.bind({"cmd","alt"}, "3", function()
    local s = screens[3]
    local f = s:frame()
    hs.mouse.absolutePosition({
        x = f.x + f.w/2,
        y = f.y + f.h/2
    })
end)
