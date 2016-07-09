#!/bin/bash
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
extd="airootfs-lo/usr/lib/firefox/browser/extensions"

for src in ${sources}; do
	wget -P "${extd}" "${src}"
done
for xpi in ${extd}/*; do
	unzip -d "${extd}/${xpi}" "${xpi}"
	mv -Tt "${extd}/$(head -n 1 "${extd}/${xpi}/chrome.manifest" | cut -d ' ' -f 3)" "${extd}/${xpi}"
done
