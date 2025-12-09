let
  mestizo = import ../../lib/mestizo.nix;
in
{
  mgr = {
    cwd = {
      fg = mestizo.rojo;
    };

    hovered = {
      reversed = true;
    };
    preview_hovered = {
      underline = true;
    };

    find_keyword = {
      fg = mestizo.amarillo;
    };
    find_position = {
      fg = mestizo.fucsia;
    };

    marker_copied = {
      fg = mestizo.amarillo;
      bg = mestizo.amarillo;
    };
    marker_cut = {
      fg = mestizo.rojo;
      bg = mestizo.rojo;
    };
    marker_marked = {
      fg = mestizo.cian;
      bg = mestizo.cian;
    };
    marker_selected = {
      fg = mestizo.magenta;
      bg = mestizo.magenta;
    };

    count_copied = {
      fg = mestizo.amarillo;
    };
    count_cut = {
      fg = mestizo.rojo;
    };
    count_selected = {
      fg = mestizo.magenta;
    };

    border_symbol = "│";
    border_style = {
      fg = mestizo.base3;
    };
  };

  tabs = {
    active = {
      fg = mestizo.tope;
      bg = mestizo.base3;
    };
    inactive = {
      fg = mestizo.tope_2;
      bg = mestizo.base;
    };
    sep_inner = {
      open = "";
      close = "";
    };
    sep_outer = {
      open = "";
      close = "";
    };
  };

  mode = {
    normal_main = {
      fg = mestizo.tope_2;
      bg = mestizo.base;
    };
    normal_alt = {
      fg = mestizo.tope_2;
      bg = mestizo.base;
    };

    select_main = {
      fg = mestizo.magenta;
      bg = mestizo.base;
    };
    select_alt = {
      fg = mestizo.magenta;
      bg = mestizo.base;
    };

    unset_main = {
      fg = mestizo.fucsia;
      bg = mestizo.base;
    };
    unset_alt = {
      fg = mestizo.fucsia;
      bg = mestizo.base;
    };
  };

  status = {
    perm_sep = {
      fg = mestizo.tope_2;
    };
    perm_type = {
      fg = mestizo.azul;
    };
    perm_read = {
      fg = mestizo.amarillo;
    };
    perm_write = {
      fg = mestizo.rojo;
    };
    perm_exec = {
      fg = mestizo.verde;
    };

    progress_label = {
      fg = mestizo.tope_2;
    };
    progress_normal = {
      fg = mestizo.verde;
      bg = mestizo.base3;
    };
    progress_error = {
      fg = mestizo.rojo;
      bg = mestizo.base3;
    };
  };

  confirm = {
    border = {
      fg = mestizo.base1;
      bg = mestizo.base1;
    };
    title = {
      fg = mestizo.base;
      bg = mestizo.rojo;
    };
    content = {
      bg = mestizo.base1;
    };
    list = {
      bg = mestizo.base1;
    };
    btn_yes = {
      fg = mestizo.verde;
      bg = mestizo.base3;
    };
    btn_no = {
      fg = mestizo.rojo;
      bg = mestizo.base3;
    };
  };

  pick = {
    border = {
      fg = mestizo.celeste;
    };
    active = {
      fg = mestizo.fucsia;
    };
    inactive = { };
  };

  input = {
    border = {
      fg = mestizo.base1;
      bg = mestizo.base1;
    };
    title = {
      fg = mestizo.base;
      bg = mestizo.rojo;
    };
    value = {
      bg = mestizo.base1;
    };
    selected = {
      reversed = true;
    };
  };

  tasks = {
    border = {
      fg = mestizo.base1;
      bg = mestizo.base1;
    };
    title = {
      fg = mestizo.base;
      bg = mestizo.rojo;
    };
  };

  notify = {
    title_info = {
      fg = mestizo.verde;
    };
    title_warn = {
      fg = mestizo.amarillo;
    };
    title_error = {
      fg = mestizo.rojo;
    };
  };

  filetype = {
    rules = [
      {
        url = "*";
        fg = mestizo.tope;
      }
      {
        url = "*/";
        fg = mestizo.rosa;
      }
      {
        name = "*";
        fg = mestizo.tope;
      }
      {
        name = "*/";
        fg = mestizo.rosa;
      }
    ];
  };
}
