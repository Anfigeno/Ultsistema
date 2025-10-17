let
  mestizo = import ./mestizo.nix;
in
{
  base00 = mestizo.base; # Fondo por defecto
  base01 = mestizo.base2; # Fondo más claro (línea actual, selección)
  base02 = mestizo.base3; # Selección de fondo
  base03 = mestizo.tope_3; # Comentarios, invisibles, línea resaltada

  # Foregrounds
  base04 = mestizo.tope_1; # Foreground oscuro (números de línea)
  base05 = mestizo.tope; # Foreground por defecto
  base06 = mestizo.tope1; # Foreground claro
  base07 = mestizo.tope3; # Foreground muy claro

  # Colores del tema
  base08 = mestizo.rojo; # Variables, etiquetas XML, markup link text, lists, diff deleted
  base09 = mestizo.naranja; # Integers, Boolean, Constants, attributes, markup link url
  base0A = mestizo.amarillo; # Classes, markup bold, search text background
  base0B = mestizo.verde; # Strings, heredoc, markup code, diff inserted
  base0C = mestizo.cian; # Support, regex, escape chars, markup quotes
  base0D = mestizo.azul; # Functions, methods, attribute IDs, headings
  base0E = mestizo.magenta; # Keywords, storage, selector, markup italic, diff changed
  base0F = mestizo.rosa; # Deprecated, opening/closing embedded language tags
}
