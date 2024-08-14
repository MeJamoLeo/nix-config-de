{
	programs.qutebrowser = {
		enable = true;
		extraConfig =
		''
		# config.set('content.javascript.clipboard', 'access', 'github.com')
		# config.set('content.javascript.clipboard', 'access', 'atcoder.jp')
		# config.set('content.javascript.clipboard', 'access', 'chat.openai.com')

		# Unbind the original keybindings
		# config.unbind('<Shift-j>', mode='normal')
		# config.unbind('<Shift-k>', mode='normal')

		# config.bind('<Shift-j>', 'tab-prev', mode='normal') # Bind Shift+j to move the tab focus to the left
		# config.bind('<Shift-k>', 'tab-next', mode='normal') # Bind Shift+k to move the tab focus to the right
		'';
		searchEngines = {
			"DEFAULT" = "https://duckduckgo.com/?ia=web&q={}";
			"!g" = "https://www.google.com/search?hl=en&q={}";
			"!gm" = "https://www.google.com/maps?q={}";
			"!d" = "https://duckduckgo.com/?ia=web&q={}";
			"!nw" = "https://nixos.wiki/index.php?search={}";
			"!np" = "https://github.com/NixOS/nixpkgs/search?q={}";
			"!no" = "https://mynixos.com/search?q={}";
			"!hp" = "https://github.com/nix-community/home-manager/search?q={}";
			"!a" = "https://www.amazon.com/s?k={}";
			"!gh" = "https://github.com/search?o=desc&q={}&s=stars";
			"!ghn" = "https://github.com/search?o=desc&q=lang%3ANix+{}&type=code";
			"!s" = "https://sourcegraph.com/search?patternType=standard&sm=1&q=context:global+{}";
			"!y" = "https://www.youtube.com/results?search_query={}";
		};
		settings = {
			tabs = {
				focus_stack_size = -1;
				new_position = {
					unrelated = "next";
				};
				title = {
					format = "{audio}{current_title}";
				};
				position = "left";
				width = "5%";
			};
			content = {
				blocking = {
					enabled = true;
				};
				javascript = {
					clipboard = "access";
				};
			};
		};
	};
}

/*
aliases = ;
auto_save.interval = ;
auto_save.session = ;
backend = ;
bindings.commands = ;
bindings.default = ;
bindings.key_mappings = ;
changelog_after_upgrade = ;
colors.completion.category.bg = ;
colors.completion.category.border.bottom = ;
colors.completion.category.border.top = ;
colors.completion.category.fg = ;
colors.completion.even.bg = ;
colors.completion.fg = ;
colors.completion.item.selected.bg = ;
colors.completion.item.selected.border.bottom = ;
colors.completion.item.selected.border.top = ;
colors.completion.item.selected.fg = ;
colors.completion.item.selected.match.fg = ;
colors.completion.match.fg = ;
colors.completion.odd.bg = ;
colors.completion.scrollbar.bg = ;
colors.completion.scrollbar.fg = ;
colors.contextmenu.disabled.bg = ;
colors.contextmenu.disabled.fg = ;
colors.contextmenu.menu.bg = ;
colors.contextmenu.menu.fg = ;
colors.contextmenu.selected.bg = ;
colors.contextmenu.selected.fg = ;
colors.downloads.bar.bg = ;
colors.downloads.error.bg = ;
colors.downloads.error.fg = ;
colors.downloads.start.bg = ;
colors.downloads.start.fg = ;
colors.downloads.stop.bg = ;
colors.downloads.stop.fg = ;
colors.downloads.system.bg = ;
colors.downloads.system.fg = ;
colors.hints.bg = ;
colors.hints.fg = ;
colors.hints.match.fg = ;
colors.keyhint.bg = ;
colors.keyhint.fg = ;
colors.keyhint.suffix.fg = ;
colors.messages.error.bg = ;
colors.messages.error.border = ;
colors.messages.error.fg = ;
colors.messages.info.bg = ;
colors.messages.info.border = ;
colors.messages.info.fg = ;
colors.messages.warning.bg = ;
colors.messages.warning.border = ;
colors.messages.warning.fg = ;
colors.prompts.bg = ;
colors.prompts.border = ;
colors.prompts.fg = ;
colors.prompts.selected.bg = ;
colors.prompts.selected.fg = ;
colors.statusbar.caret.bg = ;
colors.statusbar.caret.fg = ;
colors.statusbar.caret.selection.bg = ;
colors.statusbar.caret.selection.fg = ;
colors.statusbar.command.bg = ;
colors.statusbar.command.fg = ;
colors.statusbar.command.private.bg = ;
colors.statusbar.command.private.fg = ;
colors.statusbar.insert.bg = ;
colors.statusbar.insert.fg = ;
colors.statusbar.normal.bg = ;
colors.statusbar.normal.fg = ;
colors.statusbar.passthrough.bg = ;
colors.statusbar.passthrough.fg = ;
colors.statusbar.private.bg = ;
colors.statusbar.private.fg = ;
colors.statusbar.progress.bg = ;
colors.statusbar.url.error.fg = ;
colors.statusbar.url.fg = ;
colors.statusbar.url.hover.fg = ;
colors.statusbar.url.success.http.fg = ;
colors.statusbar.url.success.https.fg = ;
colors.statusbar.url.warn.fg = ;
colors.tabs.bar.bg = ;
colors.tabs.even.bg = ;
colors.tabs.even.fg = ;
colors.tabs.indicator.error = ;
colors.tabs.indicator.start = ;
colors.tabs.indicator.stop = ;
colors.tabs.indicator.system = ;
colors.tabs.odd.bg = ;
colors.tabs.odd.fg = ;
colors.tabs.pinned.even.bg = ;
colors.tabs.pinned.even.fg = ;
colors.tabs.pinned.odd.bg = ;
colors.tabs.pinned.odd.fg = ;
colors.tabs.pinned.selected.even.bg = ;
colors.tabs.pinned.selected.even.fg = ;
colors.tabs.pinned.selected.odd.bg = ;
colors.tabs.pinned.selected.odd.fg = ;
colors.tabs.selected.even.bg = ;
colors.tabs.selected.even.fg = ;
colors.tabs.selected.odd.bg = ;
colors.tabs.selected.odd.fg = ;
colors.tooltip.bg = ;
colors.tooltip.fg = ;
colors.webpage.bg = ;
colors.webpage.darkmode.algorithm = ;
colors.webpage.darkmode.contrast = ;
colors.webpage.darkmode.enabled = ;
colors.webpage.darkmode.policy.images = ;
colors.webpage.darkmode.policy.page = ;
colors.webpage.darkmode.threshold.background = ;
colors.webpage.darkmode.threshold.foreground = ;
colors.webpage.preferred_color_scheme = ;
completion.cmd_history_max_items = ;
completion.delay = ;
completion.favorite_paths = ;
completion.height = ;
completion.min_chars,completion.min_chars = ;
completion.open_categories = ;
completion.quick = ;
completion.scrollbar.padding = ;
completion.scrollbar.width = ;
completion.show = ;
completion.shrink = ;
completion.timestamp_format = ;
completion.use_best_match = ;
completion.web_history.exclude = ;
completion.web_history.max_items = ;
confirm_quit = ;
content.autoplay = ;
content.blocking.adblock.lists = ;
content.blocking.enabled = ;
content.blocking.hosts.block_subdomains = ;
content.blocking.hosts.lists = ;
content.blocking.method = ;
content.blocking.whitelist = ;
content.cache.appcache = ;
content.cache.maximum_pages = ;
content.cache.size = ;
content.canvas_reading = ;
content.cookies.accept = ;
content.cookies.store = ;
content.default_encoding = ;
content.desktop_capture = ;
content.dns_prefetch = ;
content.frame_flattening = ;
content.fullscreen.overlay_timeout = ;
content.fullscreen.window = ;
content.geolocation = ;
content.headers.accept_language = ;
content.headers.custom = ;
content.headers.do_not_track = ;
content.headers.referer = ;
content.headers.user_agent = ;
content.hyperlink_auditing = ;
content.images = ;
content.javascript.alert = ;
content.javascript.can_close_tabs = ;
content.javascript.can_open_tabs_automatically = ;
content.javascript.clipboard = ;
content.javascript.enabled = ;
content.javascript.legacy_touch_events = ;
content.javascript.log = ;
content.javascript.log_message.excludes = ;
content.javascript.log_message.levels = ;
content.javascript.modal_dialog = ;
content.javascript.prompt = ;
content.local_content_can_access_file_urls = ;
content.local_content_can_access_remote_urls = ;
content.local_storage = ;
content.media.audio_capture = ;
content.media.audio_video_capture = ;
content.media.video_capture = ;
content.mouse_lock = ;
content.mute = ;
content.netrc_file = ;
content.notifications.enabled = ;
content.notifications.presenter = ;
content.notifications.show_origin = ;
content.pdfjs = ;
content.persistent_storage = ;
content.plugins = ;
content.prefers_reduced_motion = ;
content.print_element_backgrounds = ;
content.private_browsing = ;
content.proxy = ;
content.proxy_dns_requests = ;
content.register_protocol_handler = ;
content.site_specific_quirks.enabled = ;
content.site_specific_quirks.skip = ;
content.tls.certificate_errors = ;
content.unknown_url_scheme_policy = ;
content.user_stylesheets = ;
content.webgl = ;
content.webrtc_ip_handling_policy = ;
content.xss_auditing = ;
downloads.location.directory = ;
downloads.location.prompt = ;
downloads.location.remember = ;
downloads.location.suggestion = ;
downloads.open_dispatcher = ;
downloads.position = ;
downloads.prevent_mixed_content = ;
downloads.remove_finished = ;
editor.command = ;
editor.encoding = ;
editor.remove_file = ;
fileselect.folder.command = ;
fileselect.handler = ;
fileselect.multiple_files.command = ;
fileselect.single_file.command = ;
fonts.completion.category = ;
fonts.completion.entry = ;
fonts.contextmenu = ;
fonts.debug_console = ;
fonts.default_family = ;
fonts.default_size = ;
fonts.downloads = ;
fonts.hints = ;
fonts.keyhint = ;
fonts.messages.error = ;
fonts.messages.info = ;
fonts.messages.warning = ;
fonts.prompts = ;
fonts.statusbar = ;
fonts.tabs.selected = ;
fonts.tabs.unselected = ;
fonts.tooltip = ;
fonts.web.family.cursive = ;
fonts.web.family.fantasy = ;
fonts.web.family.fixed = ;
fonts.web.family.sans_serif = ;
fonts.web.family.serif = ;
fonts.web.family.standard = ;
fonts.web.size.default = ;
fonts.web.size.default_fixed = ;
fonts.web.size.minimum = ;
fonts.web.size.minimum_logical = ;
hints.auto_follow = ;
hints.auto_follow_timeout = ;
hints.border = ;
hints.chars = ;
hints.dictionary = ;
hints.find_implementation = ;
hints.hide_unmatched_rapid_hints = ;
hints.leave_on_load = ;
hints.min_chars = ;
hints.mode = ;
hints.next_regexes = ;
hints.padding = ;
hints.prev_regexes = ;
hints.radius = ;
hints.scatter = ;
hints.selectors = ;
hints.uppercase = ;
history_gap_interval = ;
input.escape_quits_reporter = ;
input.forward_unbound_keys = ;
input.insert_mode.auto_enter = ;
input.insert_mode.auto_leave = ;
input.insert_mode.auto_load = ;
input.insert_mode.leave_on_load = ;
input.insert_mode.plugins = ;
input.links_included_in_focus_chain = ;
input.match_counts = ;
input.media_keys = ;
input.mode_override = ;
input.mouse.back_forward_buttons = ;
input.mouse.rocker_gestures = ;
input.partial_timeout = ;
input.spatial_navigation = ;
keyhint.blacklist = ;
keyhint.delay = ;
keyhint.radius = ;
logging.level.console = ;
logging.level.ram = ;
messages.timeout = ;
new_instance_open_target = ;
new_instance_open_target_window = ;
prompt.filebrowser = ;
prompt.radius = ;
qt.args = ;
qt.chromium.experimental_web_platform_features = ;
qt.chromium.low_end_device_mode = ;
qt.chromium.process_model = ;
qt.chromium.sandboxing = ;
qt.environ = ;
qt.force_platform = ;
qt.force_platformtheme = ;
qt.force_software_rendering = ;
qt.highdpi = ;
qt.workarounds.disable_accelerated_2d_canvas = ;
qt.workarounds.disable_hangouts_extension = ;
qt.workarounds.locale = ;
qt.workarounds.remove_service_workers = ;
scrolling.bar = ;
scrolling.smooth = ;
search.ignore_case = ;
search.incremental = ;
search.wrap = ;
search.wrap_messages = ;
session.default_name = ;
session.lazy_restore = ;
spellcheck.languages = ;
statusbar.padding = ;
statusbar.position = ;
statusbar.show = ;
statusbar.widgets = ;
tabs.background = ;
tabs.close_mouse_button = ;
tabs.close_mouse_button_on_bar = ;
tabs.favicons.scale = ;
tabs.favicons.show = ;
tabs.focus_stack_size = ;
tabs.indicator.padding = ;
tabs.indicator.width = ;
tabs.last_close = ;
tabs.max_width = ;
tabs.min_width = ;
tabs.mode_on_change = ;
tabs.mousewheel_switching = ;
tabs.new_position.related = ;
tabs.new_position.stacking = ;
tabs.new_position.unrelated = ;
tabs.padding = ;
tabs.pinned.frozen = ;
tabs.pinned.shrink = ;
tabs.position = ;
tabs.select_on_remove = ;
tabs.show = ;
tabs.show_switching_delay = ;
tabs.tabs_are_windows = ;
tabs.title.alignment = ;
tabs.title.elide = ;
tabs.title.format = ;
tabs.title.format_pinned = ;
tabs.tooltips = ;
tabs.undo_stack_size = ;
tabs.width = ;
tabs.wrap = ;
url.auto_search = ;
url.default_page = ;
url.incdec_segments = ;
url.open_base_url = ;
url.searchengines = ;
url.start_pages = ;
url.yank_ignored_parameters = ;
window.hide_decoration = ;
window.title_format = ;
window.transparent = ;
zoom.default = ;
zoom.levels = ;
zoom.mouse_divider = ;
zoom.text_only = ;
*/

