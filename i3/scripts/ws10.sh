#!/bin/sh

# Kill all windows in workspace 10
i3-msg [workspace=10] kill

# Create new terminal windows in workspace 10
i3-msg "workspace 10; \
        append_layout /home/carl/.config/i3/layout-ws-10.json; \
        exec i3-sensible-terminal --role=clock -e \"tty-clock -c -C 5\"; \
        exec i3-sensible-terminal --role=neofetch -e \"neofetch && /bin/zsh\"; \
        exec chromium --app=\"http://pi.hole\" &"
