# nixos

install home manager

```bash
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
sudo nix-channel --update
```

rebuild with tuna mirror

```bash
sudo nix-rebuild switch --option substituters "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
```
