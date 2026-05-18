hl.window_rule {
    name = "Send discord to sixth workspace",
    match = {
        class = "discord"
    },
    workspace = 6
}

hl.window_rule {
    name = "Send spotify to tenth workspace",
    match = {
        class = "([Ss]potify)"
    },
    workspace = 10
}

hl.window_rule {
    name = "Make some special windows secret so that screen share won't fuck me over",
    match = {
        class = "(firefox|org.telegram.desktop)"
    },
    no_screen_share = true
}

hl.window_rule {
    name = "Make hytale a game",
    match = {
        class = "HytaleClient"
    },
    content = "game"
}

hl.window_rule {
    name = "Fake feh photo",
    match = {
        class = "feh"
    },
    content = "photo"
}

hl.window_rule {
    name = "Make mpv video",
    match = {
        class = "mpv"
    },
    content = "video"
}

hl.window_rule {
    name = "Make selected window bar color consistent with the border color",
    match = {
        focus = true
    },
    ["hyprbars:bar_color"] = "rgb(00f5ff)",
    ["hyprbars:title_color"] = "rgb(2b2b3b)",
}
