{ deGithub, pkgs }:

{
  plugin = pkgs.vimPlugins.todo-comments-nvim;
  type = "lua";
  config = builtins.readFile ./todo-comments.lua;
}
