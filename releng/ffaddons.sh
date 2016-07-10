#!/bin/zsh
sources=(
	'https://update.adblockplus.org/latest/adblockplusfirefox.xpi'
	'https://addons.mozilla.org/firefox/downloads/latest/greasemonkey/addon-748-latest.xpi'
	'https://addons.mozilla.org/firefox/downloads/latest/downthemall/addon-201-latest.xpi'
	'https://addons.mozilla.org/firefox/downloads/latest/markdown-viewer/addon-405191-latest.xpi'
	'https://addons.mozilla.org/firefox/downloads/latest/youtube-lyrics-by-rob-w/addon-415920-latest.xpi'
	'https://addons.mozilla.org/en-US/firefox/downloads/latest/722/addon-722-latest.xpi'
	'https://addons.mozilla.org/firefox/downloads/latest/user-agent-overrider/addon-429678-latest.xpi'
	'https://addons.mozilla.org/firefox/downloads/latest/reload-plus/addon-5200-latest.xpi'
	'https://addons.mozilla.org/firefox/downloads/latest/lazarus-form-recovery/addon-6984-latest.xpi'
	'https://lastpass.com/download/cdn/lp4.xpi'
)

extd="airootfs-hi/usr/lib/firefox/browser/extensions"
for src in ${sources}; do
	echo ${src}
	wget -P "${extd}" "${src}"
done
