{
  pkgs,
  config,
}:
let
  envoltorioDeYazi =
    if config.modulosHomeManager.yazi.activar then import ./scripts/yazi.nix { inherit pkgs; } else "";
in
# fish
''
  ${import ./scripts/saludo.nix { inherit pkgs; }}
  ${envoltorioDeYazi}

  set -g tide_os_color brwhite
  set -g tide_os_bg_color red
  set -g tide_pwd_bg_color cyan
  set -g tide_pwd_color_anchors black
  set -g tide_pwd_color_dirs brblack
  set -g tide_pwd_color_truncated_dirs brblack

  set -Ux LS_COLORS "di=91:ln=36:so=36:pi=32:ex=32:bd=30;46:cd=30;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
  set fzf_preview_dir_cmd eza --icons always --color always --long --git --no-user --no-time --no-permissions --no-filesize --all --sort type
  set -Ux FZF_DEFAULT_OPTS '
    --color=fg:#FF808C,fg+:#C1C2FB,bg:#1C1C26,bg+:#2b3246
    --color=hl:#FF808C,hl+:#ffe780,info:#8eeda1,marker:#F27AFF
    --color=prompt:#6ae4fc,spinner:#af5fff,pointer:#ff5263,header:#5fd7ff
    --color=gutter:#1C1C26,border:#1C1C26,scrollbar:#2b3246,preview-fg:#C1C2FB
    --color=preview-bg:#222533,preview-border:#222533,preview-scrollbar:#3c3d67,label:#C1C2FB
    --color=query:#C1C2FB
    --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
    --marker=">" --pointer="◆" --separator="─" --scrollbar="│"
    --layout="reverse" --info="right"'
''
