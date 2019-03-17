#!/bin/sh

print_type()
{
  echo "\######## Ping $1 \########"
}

# Kill all windows in workspace 9
i3-msg [workspace=9] kill

google=$(print_type "Google")
router=$(print_type "Router")
pihole=$(print_type "Pi Hole")
pivpn=$(print_type "Pi VPN")

# Create new terminal windows in workspace 9
i3-msg "workspace 9; \
        append_layout ~/.config/i3/layout-ws-9.json; \
        exec --no-startup-id i3-sensible-terminal --role=google -e \"echo $google && ping google.com\"; \
        exec --no-startup-id i3-sensible-terminal --role=router -e \"echo $router && ping 192.168.1.1\"; \
        exec --no-startup-id i3-sensible-terminal --role=pihole -e \"echo $pihole && ping 192.168.1.2\"; \
        exec --no-startup-id i3-sensible-terminal --role=pivpn -e \"echo $pivpn && ping 192.168.1.3\";"
