let
  mestizo = import ./mestizo.nix;
in {
  primario = mestizo.rojo;

  texto = mestizo.tope;

  fondo = mestizo.base;

  bordeActivo = mestizo.tope_3;
  bordeInactivo = mestizo.base3;
}
