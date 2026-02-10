{
  ...
}:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "fish";
        pad = "25x25";
      };
      key-bindings = {
        clipboard-copy = "Control+c";
        clipboard-paste = "Control+v";
      };
      cursor = {
        # style = "beam";
        blink = "yes";
      };
    };
  };
}
