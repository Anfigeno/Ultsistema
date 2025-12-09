{ pkgs }:
# fish
''
  function y
  	set tmp (mktemp -t "yazi-cwd.XXXXXX")
  	${pkgs.yazi}/bin/yazi $argv --cwd-file="$tmp"
  	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
  		builtin cd -- "$cwd"
  	end
  	rm -f -- "$tmp"
  end
''
