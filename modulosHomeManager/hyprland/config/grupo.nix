let

  orchis = import ../../../lib/orchis.nix;
in
{
  auto_group = true;
  "col.border_active" = "rgb(${builtins.substring 1 (-1) orchis.grey."600"})";
  "col.border_inactive" = "rgb(${builtins.substring 1 (-1) orchis.grey."600"})";
  "col.border_locked_active" = "rgb(${builtins.substring 1 (-1) orchis.grey."550"})";
  "col.border_locked_inactive" = "rgb(${builtins.substring 1 (-1) orchis.grey."550"})";

  groupbar = {
    enabled = true;
    height = 30;
    indicator_height = 0;
    gradients = true;
    font_family = "Ubuntu";
    font_size = 12;
    render_titles = true;
    scrolling = true;
    rounding = 10;
    gradient_rounding = 10;
    gaps_in = 5;
    gaps_out = 5;
    keep_upper_gap = false;
    "col.active" = "rgb(${builtins.substring 1 (-1) orchis.grey."700"})";
    "col.inactive" = "rgba(${builtins.substring 1 (-1) orchis.grey."700"}80)";
    "col.locked_active" = "rgb(${builtins.substring 1 (-1) orchis.grey."700"})";
    "col.locked_inactive" = "rgba(${builtins.substring 1 (-1) orchis.grey."700"}80)";
  };
}
