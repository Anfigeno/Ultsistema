let
  mestizo = import ./mestizo.nix;
in {
  primario = mestizo.rojo;

  texto = mestizo.tope;

  fondoClaro = mestizo.base2;
  fondo = mestizo.base;

  bordeActivo = mestizo.tope_3;
  bordeInactivo = mestizo.base3;
}
