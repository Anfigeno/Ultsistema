# fish
''
  alias ls="eza --icons always --color always --long --git --no-user --no-time --no-permissions --no-filesize --all  --sort type --grid"
  alias ll="eza --icons always --color always --long --git --all --sort type"
  alias tree="eza --icons always --color always --long --git --no-user --no-time --no-permissions --no-filesize --all  --sort type --tree --git-ignore"
  set -g fzf_preview_dir_cmd eza --icons always --color always --long --git --no-user --no-time --no-permissions --no-filesize --all --sort type
''
