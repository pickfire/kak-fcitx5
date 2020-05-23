Kakoune Fcitx5 Integration
==========================

Keep and restore fcitx5 state for each buffer separately when
leaving/re-entering insert mode.

Install
-------

Clone this repository and symlink fcitx.kak to your autoload directory.

To enable fcitx5 support, add `fcitx-enable` to `kakrc`.

For fcitx support, change `fcitx5-remote` to `fcitx-remote` in
`fcitx.kak`.

Based on https://github.com/h-youhei/kakoune-fcitx which was not updated to 
work with kakoune 2019.12.10 with newer ModeChange.
