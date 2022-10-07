if status is-interactive
    # Commands to run in interactive sessions can go here
    status --is-interactive; and rbenv init - fish | source
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end
