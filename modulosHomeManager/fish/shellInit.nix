{
  pkgs,
  config,
}:
# fish
let
  envoltorioDeYazi =
    if config.modulosHomeManager.yazi.activar then import ./scripts/yazi.nix { inherit pkgs; } else "";
in
''
  ${import ./scripts/saludo.nix { inherit pkgs; }}
  ${envoltorioDeYazi}

  set -g tide_os_color brwhite
  set -g tide_os_bg_color red
  set -g tide_pwd_bg_color cyan
  set -g tide_pwd_color_anchors black
  set -g tide_pwd_color_dirs brblack
  set -g tide_pwd_color_truncated_dirs brblack
''
