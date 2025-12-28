config.load_autoconfig()

config.source("custom/gruvbox.py")
config.source("custom/keymaps/colemak-dh.py")
# Background color for webpages if unset (or empty to use the theme's
# color).
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.policy.images = "never"

c.downloads.position = "bottom"
c.downloads.remove_finished = 150000  # 2.5 minutes

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

c.content.blocking.method = "both"
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist.to/easylist/fanboy-annoyance.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",
    "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
    "https://www.i-dont-care-about-cookies.eu/abp/",
    "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext",
    "https://gitlab.com/curben/urlhaus-filter/-/raw/master/urlhaus-filter-online.txt",
]
