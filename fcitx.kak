declare-option -hidden bool fcitx_was_on false

define-command -hidden fcitx-turn-on %{ nop %sh{ fcitx5-remote -o }}

define-command -hidden fcitx-turn-off %{ nop %sh{ fcitx5-remote -c }}

define-command -hidden fcitx-turn-off-with-state %{ evaluate-commands %sh{
    case `fcitx5-remote` in
        1) echo 'set-option buffer fcitx_was_on false';;
        2) echo 'set-option buffer fcitx_was_on true'
           echo 'fcitx-turn-off';;
    esac
}}

define-command -hidden fcitx-restore-state %{ evaluate-commands %sh{
    [ $kak_opt_fcitx_was_on = true ] && echo 'fcitx-turn-on'
}}

define-command -docstring 'Enable fcitx.' fcitx-enable %{
    remove-hooks global fcitx
    hook -group fcitx global ModeChange pop:insert:.* %{ fcitx-turn-off-with-state }
    hook -group fcitx global ModeChange .*:.*:insert %{ fcitx-restore-state }
    hook -group fcitx global ModeChange push:.*:normal %{ fcitx-turn-off }
}

define-command -docstring 'Disable fcitx.' fcitx-disable %{
    remove-hooks global fcitx
}

hook global WinDisplay .* %{ set-option buffer fcitx_was_on false }
