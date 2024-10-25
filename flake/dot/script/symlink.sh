rm -r /home/cac/flake; ln -sf /flake/main /home/cac/flake
rm  /home/cac/script; ln -sf /flake/main/dot/script /home/cac/script
rm  /home/cac/base.ovpn; ln -sf /flake/main/dot/base.ovpn /home/cac/base.ovpn
rm  /home/cac/base2.ovpn; ln -sf /flake/main/dot/base2.ovpn /home/cac/base2.ovpn
rm  /home/cac/ca.protonvpn.udp.ovpn; ln -sf /flake/main/dot/ca.protonvpn.udp.ovpn /home/cac/ca.protonvpn.udp.ovpn
rm  /home/cac/.Xresources; ln -sf /flake/main/dot/.Xresources /home/cac/.Xresources
rm  /home/cac/.zshrc; ln -sf /flake/main/dot/.zshrc /home/cac/.zshrc
rm  /home/cac/.tmux.conf; ln -sf /flake/main/dot/.tmux.conf /home/cac/.tmux.conf
rm  /home/cac/.xbindkeysrc; ln -sf /flake/main/dot/.xbindkeysrc /home/cac/.xbindkeysrc
rm  /home/cac/.zsh_history; ln -sf /flake/main/dot/.zsh_history /home/cac/.zsh_history

## files in .config ##

# rm -r /home/cac/.config; ln -sf /flake/main/dot/.config /home/cac/.config
#
rm -r /home/cac/.config/clipit; ln -sf /flake/main/dot/.config/clipit /home/cac/.config/clipit
rm -r /home/cac/.config/gtk-3.0; ln -sf /flake/main/dot/.config/gtk-3.0 /home/cac/.config/gtk-3.0
rm -r /home/cac/.config/gtk-4.0; ln -sf /flake/main/dot/.config/gtk-4.0 /home/cac/.config/gtk-4.0
rm -r /home/cac/.config/kitty; ln -sf /flake/main/dot/.config/kitty /home/cac/.config/kitty
rm -r /home/cac/.config/nvim; ln -sf /flake/main/dot/.config/nvim /home/cac/.config/nvim
rm -r /home/cac/.config/parcellite; ln -sf /flake/main/dot/.config/parcellite /home/cac/.config/parcellite
rm -r /home/cac/.config/pcmanfm; ln -sf /flake/main/dot/.config/pcmanfm /home/cac/.config/pcmanfm
rm -r /home/cac/.config/picom; ln -sf /flake/main/dot/.config/picom /home/cac/.config/picom
rm -r /home/cac/.config/qtile; ln -sf /flake/main/dot/.config/qtile /home/cac/.config/qtile
rm -r /home/cac/.config/shell_gpt; ln -sf /flake/main/dot/.config/shell_gpt /home/cac/.config/shell_gpt
rm -r /home/cac/.config/mimeapps.list; ln -sf /flake/main/dot/.config/mimeapps.list /home/cac/.config/mimeapps.list

## docs ##

rm -r /home/cac/Pictures; ln -sf /flake/main/docs/Pictures /home/cac/Pictures
rm -r /home/cac/.icons; ln -sf /flake/main/docs/.icons /home/cac/.icons

## ownership ##
chown -R cac:users /home/cac

ln -sf $(find /nix/store/*openvpn* -name "update-systemd-resolved" 2>/dev/null | head -n 1) /flake/main/dot/script/update-resolved
