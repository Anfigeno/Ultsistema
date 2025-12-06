let

  tema = import ../../../lib/tema.nix;
in
{
  auto_group = true;
  "col.border_active" = "rgb(${builtins.substring 1 (-1) tema.bordeActivo})";
  "col.border_inactive" = "rgb(${builtins.substring 1 (-1) tema.bordeInactivo})";
  "col.border_locked_active" = "rgb(${builtins.substring 1 (-1) tema.bordeActivo})";
  "col.border_locked_inactive" = "rgb(${builtins.substring 1 (-1) tema.bordeInactivo})";

  groupbar = {
    enabled = true;
    height = 30;
    indicator_height = 0;
    gradients = true;
    font_family = "Iosevka";
    font_size = 13;
    render_titles = true;
    scrolling = true;
    rounding = 10;
    gradient_rounding = 10;
    gaps_in = 5;
    gaps_out = 5;
    keep_upper_gap = false;
    "col.active" = "rgb(${builtins.substring 1 (-1) tema.bordeActivo})";
    "col.inactive" = "rgba(${builtins.substring 1 (-1) tema.bordeInactivo}80)";
    "col.locked_active" = "rgb(${builtins.substring 1 (-1) tema.bordeActivo})";
    "col.locked_inactive" = "rgba(${builtins.substring 1 (-1) tema.bordeInactivo}80)";
    text_color = "rgb(${builtins.substring 1 (-1) tema.texto})";
  };
}
