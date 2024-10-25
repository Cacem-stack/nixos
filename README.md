# My Nix-os Config

## A very hackish implemenation of a rough personal NixOS configuration, by a normie

- I categoried different functions/purposes into separate modules as I saw fit
- Certain files/dotiles with sensitive information have been remove (i.e .ovpn, zsh_history, etc.)
- My cared for dotfiles are symlinked from flake/dot/script/symlink.sh, is executed on rebuild

```nix
  system.activationScripts = {
  symlink =
    ''
  		 /flake/main/dot/script/symlink.sh
    '';
  };
```
