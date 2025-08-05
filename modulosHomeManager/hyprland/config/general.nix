let
  orchis = import ../../../lib/orchis.nix;
in
{
  border_size = 1;
  "col.active_border" = "rgb(${builtins.substring 1 (-1) orchis.grey."600"})";
  "col.inactive_border" = "rgb(${builtins.substring 1 (-1) orchis.grey."600"})";
  gaps_in = 10;
  gaps_out = 10;
}
