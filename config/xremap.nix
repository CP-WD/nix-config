{...}:

{
  services.xremap = {
    userName = "gavagai";
    serviceMode = "system";
    config = {
      virtual_modifiers = [
        "MUHENKAN"
        "HENKAN"
      ];
      modmap = [
        {
          name = "";
          remap = {
            "CapsLock" = "LEFTALT";
            "APOSTROPHE" = "RIGHTCTRL";
            "SEMICOLON" = "ENTER";
            "TAB" = "ESC";
          };
        }
      ];
      keymap = [
        {
          name = "Muhenkan";
          remap = {
            "MUHENKAN-y" = "Home";
            "MUHENKAN-o" = "End";

            "MUHENKAN-h" = "Left";
            "MUHENKAN-j" = "Down";
            "MUHENKAN-k" = "Up";
            "MUHENKAN-l" = "Right";

            "MUHENKAN-t" = "TAB";
            "MUHENKAN-n" = "BackSpace";

            "MUHENKAN-Enter" = "shift-space";
          };
        }
        {
          name = "henkan";
          remap = {
            "HENKAN-q" = "1";
            "HENKAN-w" = "2";
            "HENKAN-e" = "3";
            "HENKAN-r" = "4";
            "HENKAN-t" = "5";
            "HENKAN-y" = "6";
            "HENKAN-u" = "7";
            "HENKAN-i" = "8";
            "HENKAN-o" = "9";
            "HENKAN-p" = "0";

            "HENKAN-m" = "APOSTROPHE";
            "HENKAN-n" = "SEMICOLON";

            "HENKAN-h" = "LEFTBRACE";
            "HENKAN-j" = "RIGHTBRACE";
            "HENKAN-k" = "MINUS";
            "HENKAN-l" = "EQUAL";
            "HENKAN-SEMICOLON" = "BACKSLASH";
          };
        }
      ];
    };
  };
}
