{ pkgs }:
# fish
''
    set -g hora (date +%H)
    set -g usuario (whoami)
    set -g tiempo_encendido (uptime | string match -r -e 'up (.*),')
    set tiempo_encendido (string replace "up " "" -- $tiempo_encendido)
    set -g saludo_hora ""
    switch $hora
        case 00 01 02 03 04 05 06
            set saludo_hora "Tu productividad es un mito, ve a dormir."
        case 07 08 09 10 11
            set saludo_hora "A ver si hoy si rindes."
        case 12 13 14 15 16 17
            set saludo_hora "Ya terminaste la siesta?"
        case 18 19 20 21 22 23
            set saludo_hora "Aun aqui? Tu vida social te extrana."
    end

    set -g bienvenidas \
      "$saludo_hora" \
      "Ahora que rompiste?" \
      "Al menos tu terminal te es leal." \
      "Es un buen dia para ser $usuario." \
      "El sistema lleva $tiempo_encendido sin fallar (aun)." \
      "Recuerda: 10 minutos de trabajo, 3 horas de redes sociales." \
      "Hola. Espero que hoy si sepas lo que haces." \
      "Bienvenido de nuevo. Romperemos algo hoy?" \
      "Tu computadora te extranaba. O tal vez no." \
      "A trabajar? O solo vas a mirar la pantalla?" \
      "Recuerda:" \
      "Otra vez tu? No tienes casa?" \
      "Ingresa cafeina para continuar." \
      "Espero que hayas dormido mas de 4 horas." \
      "No instales otro complemento, por favor." \
      "Oh, genial. Regresaste." \
      "Tus dedos deben doler de tanto teclear." \
      "Existe vida fuera de esta terminal, sabes?" \
      "Cargando motivacion... Error 404." \
      "Menos charla y mas codigo." \
      "Si funciona, no lo toques." \
      "Has probado a apagarlo y encenderlo?" \
      "sudo rm -rf / --no-preserve-root" \
      "El teclado no tiene la culpa de tu logica." \
      "Bienvenido al matrix, version presupuesto bajo." \
      "No culpes al compilador." \
      "Asegurate de estar en la rama correcta." \
      "Hola, $usuario. Aun sigues aqui?" \
      "Vaya, miren quien decidio aparecer." \
      "Le preguntamos a la IA?" \
      "Activando modo hacker..." \
      "Ya revisaste los registros o vas a adivinar el error?" \
      "Programar es 10% escribir, 90% googlear." \
      "Peligro inminente." \
      "La nube no es mas que la computadora de otro." \
      "Deberías hacer un respaldo." \
      "Estas seguro de que quieres ejecutar eso?" \
      "$tiempo_encendido y sigues intentando..." \
      "Insertar moneda para continuar."

    function fish_greeting
      set -l total (count $bienvenidas)
      set -l indice (random 1 $total)

      echo $bienvenidas[$indice] | ${pkgs.lolcat}/bin/lolcat -f
  end
''
