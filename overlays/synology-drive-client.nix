# overlays/synology-drive-client-4_0_1.nix
final: prev: {
  synology-drive-client =
    prev.synology-drive-client.overrideAttrs (old: let
      version = "4.0.1-17885";
      buildNumber = prev.lib.last (prev.lib.splitString "-" version);
    in {
      inherit version;

      # 等价于 patch 中对 Linux src + sha256 的修改
      src = prev.fetchurl {
        url = "https://global.synologydownload.com/download/Utility/SynologyDriveClient/${version}/Ubuntu/Installer/synology-drive-client-${buildNumber}.x86_64.deb";
        sha256 = "sha256-DMHqh8o0RknWTycANSbMpJj133/MZ8uZ18ytDZVaKMg=";
      };

      # 等价于 patch 中 unpackPhase 的新增清理逻辑
      unpackPhase = (old.unpackPhase or "") + ''
        rm -rf $out/lib/x86_64-linux-gnu/nautilus
        rm -rf $out/usr/lib/x86_64-linux-gnu/nautilus

        find $out -name "libqpdf.so" -delete
      '';
    });
}

