### Install packages

```
cd nix-config
export NIX_CONFIG="experimental-features = nix-command flakes"
# compare configuration files, especially copy hardware
cp -a /etc/nixos/* nixos
sudo nixos-rebuild switch --flake .#nixos
```

### Run home manager

```
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
export NIX_PATH=~/.nix-defexpr/channels:$NIX_PATH
nix-shell '<home-manager>' -A install
home-manager switch --flake .#hao@nixos
```
