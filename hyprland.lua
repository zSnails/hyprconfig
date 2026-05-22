hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME","hyprqt6engine")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("GDK_BACKEND", "wayland")

hl.env("CLUTTER_BACKEND", "wayland")

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.curve("quic", { type = "bezier", points = { { 0, 1 }, { 1, 1 } } })
hl.curve("smooth", { type = "bezier", points = { { .21, .47 }, { .86, .52 } } })
hl.curve("ease-in", { type = "bezier", points = { { .42, 0 }, { 1, 1 } } })
hl.curve("zSnails-animation", { type = "bezier", points = { { 0.49, -0.43 }, { 0.48, 1.59 } } })
hl.config({
    plugin = {
        hyprbars = {
            bar_height = 24,
            bar_color = "rgb(ff006e)",
            bar_text_font = "Orbitron",
            bar_text_align = "left",
            bar_part_of_window = true,
            col = {
                text = "rgba(ffffffff)"
            }
        }
    },
    cursor = {
        no_hardware_cursors = false,
    },
    ecosystem = {
        no_donation_nag = true
    },
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border = "rgb(00f5ff)",
            inactive_border = "rgb(ff006e)"
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle"
    },
    decoration = {
        active_opacity = 1,
        inactive_opacity = 1,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },
        blur = {
            enabled = false,
            size = 10,
            passes = 1,
            vibrancy = 0.1696
        }
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true
    },
    master = {
        new_status = "master"
    },
    misc = {
        force_default_wallpaper = false,
        disable_hyprland_logo = true
    },
    input = {
        kb_layout = "us",
        kb_variant = "intl",
        follow_mouse = true,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false
        }
    }
})


hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "quic", style="gnomed" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "zSnails-animation", style="slide" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "linear" })
hl.animation({ leaf = "borderangle", enabled = false, speed = 8, bezier = "zSnails-animation" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "zSnails-animation" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "quic", style = "slide" })

require("./monitors")

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hyprctl dispatch workspace 1")
    hl.exec_cmd("waybar")
end)

hl.on("config.reloaded", function()
    hl.dispatch(hl.dsp.exec_cmd("notify-send -u low 'Hyprland Config' 'Configuration reloaded'"))
end)

require("./workspaces")
require("./binds")
require("./windows")
