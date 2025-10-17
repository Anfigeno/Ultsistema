let
  tema = import ../../../lib/tema.nix;
in
{
  border_size = 1;
  "col.active_border" = "rgb(${builtins.substring 1 (-1) tema.bordeActivo})";
  "col.inactive_border" = "rgb(${builtins.substring 1 (-1) tema.bordeInactivo})";
  gaps_in = 10;
  gaps_out = 10;
}
