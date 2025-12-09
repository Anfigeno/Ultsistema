let
  mestizo = import ./mestizo.nix;
in {
  primario = mestizo.rojo;

  texto = mestizo.tope;
  textoInactivo = mestizo.tope_2;

  fondoClaro = mestizo.base2;
  fondo = mestizo.base;

  bordeActivo = mestizo.base3;
  bordeInactivo = mestizo.base2;
}
