# enpass-overlay
Ebuilds for [Enpass](https://www.enpass.io/).

Add the folowing lines in your repos.conf to sync this overlay:

    [flbdx-enpass-overlay]
    auto-sync = yes
    location = /path/to/overlays/flbdx-enpass-overlay
    sync-type = git
    sync-uri = https://github.com/flbdx/enpass-overlay.git
