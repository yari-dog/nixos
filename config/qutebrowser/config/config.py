config.load_autoconfig()

# Background color for webpages if unset (or empty to use the theme's
# color).
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.policy.images = "never"

c.downloads.position = "bottom"
c.downloads.remove_finished = 600000  # 10 minutes

c.editor.command = ["nvim", "-f", "{file}", "-c", "normal {line}G{column0}l"]

c.hints.chars = "arstgmneio"

c.input.mode_override = "normal"
c.input.spatial_navigation = False

# c.qt.workarounds.disable_hangouts_extension = False

c.scrolling.bar = "when-searching"
c.scrolling.smooth = False

c.statusbar.show = "always"

c.tabs.background = True
c.tabs.last_close = "close"
c.tabs.position = "top"
c.tabs.select_on_remove = "last-used"
c.tabs.show = "multiple"

c.url.searchengines["DEFAULT"] = "https://kagi.com/search?q={}"
c.url.start_pages = "https://kagi.com/"
c.url.default_page = "https://kagi.com/"

c.window.hide_decoration = True

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:131.0) Gecko/20100101 Firefox/131.0",
    "https://accounts.google.com/*",
)

c.content.cookies.accept = "no-3rdparty"

c.content.javascript.clipboard = True

config.source("custom/gruvbox.py")
config.source("custom/keymaps/colemak-dh.py")
