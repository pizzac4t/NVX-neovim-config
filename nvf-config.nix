{ inputs, ... }:

{
  imports = [ inputs.nvf.nixosModules.default ];
  
  programs.nvf = {
    enable = true; 
    settings = {  
      vim = {

        autocomplete.blink-cmp.enable = true;
        git.enable = true; 
        statusline.lualine.enable = true;
        fzf-lua.enable = true;
        fzf-lua.profile = "borderless";
        treesitter.enable = true;
        
        
        filetree.neo-tree = {
          enable = true;
          setupOpts.filesystem = {
            follow_current_file = {
              enabled = true;
              leave_dirs_open = false;
            };
            filtered_items = {
              visible = true;
              show_hidden_count = true;
            };
          };
        };

        
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };

        #Tab remapping, js leave it as it is
        options = {
          tabstop = 2;       
          shiftwidth = 2;    
          softtabstop = 2;   
          expandtab = true;  
        };
  
        #Colorsheme
        theme = {
          enable = true;
          name = "tokyonight";
          style = "moon";
        };

        #Keybindings
        keymaps = [
          {
            key = "<leader>e";
            mode = [ "n" ];
            action = "<cmd>Neotree toggle<CR>";
            silent = true;
            desc = "Toggle Neo-tree";
          }
          {
            key = "<leader>f";
            mode = [ "n" ];
            action = "<cmd>FzfLua files<CR>";
            silent = true;
            desc = "FzfLua Find Files";
          }
        ];

        # Lenguajes
        lsp.enable = true;
        languages = {
          enableTreesitter = true;    
          nix.enable = true;
          typescript.enable = true;
          rust.enable = true;
          lua.enable = true;
          css.enable = true;
          clang.lsp.enable = true;
          html.enable = true;
          clang.enable = true;
        };
        # The dashboard
        dashboard.dashboard-nvim = {
          enable = true;
          setupOpts = {
            theme = "doom";
            config = {
              header = [    #Art stolen from the NixOS default fastfetch config
            "                                           "
            "                                           "
            "                                           "
            "          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖         " 
            "          ▜███▙       ▜███▙  ▟███▛         " 
            "           ▜███▙       ▜███▙▟███▛          " 
            "            ▜███▙       ▜██████▛           " 
            "     ▟█████████████████▙ ▜████▛     ▟▙     " 
            "    ▟███████████████████▙ ▜███▙    ▟██▙    " 
            "           ▄▄▄▄▖           ▜███▙  ▟███▛    " 
            "          ▟███▛             ▜██▛ ▟███▛     " 
            "         ▟███▛               ▜▛ ▟███▛      " 
            "▟███████████▛                  ▟██████████▙" 
            "▜██████████▛                  ▟███████████▛" 
            "      ▟███▛ ▟▙               ▟███▛         " 
            "     ▟███▛ ▟██▙             ▟███▛          " 
            "    ▟███▛  ▜███▙           ▝▀▀▀▀           " 
            "    ▜██▛    ▜███▙ ▜██████████████████▛     " 
            "     ▜▛     ▟████▙ ▜████████████████▛      " 
            "           ▟██████▙         ▜███▙          " 
            "          ▟███▛▜███▙         ▜███▙         " 
            "         ▟███▛  ▜███▙         ▜███▙        " 
            "        ▝▀▀▀     ▀▀▀▀▘          ▀▀▀▘       "
            "                                           "
            "                                           "    
            "           PizzaCat's NVX config 😼        "
            "                                           "
            "                                           "
            "                                           "
            "                                           "
              ];
              center = [
                {
                  icon = "󰈞 ";
                  desc = "Find File          ";
                  key = "f";
                  action = "FzfLua files";
                }
                {
                  icon = " ";
                  desc = "Recent Files       ";
                  key = "r";
                  action = "FzfLua oldfiles";
                }
                {
                  icon = "󰙅 ";
                  desc = "File Explorer      ";
                  key = "e";
                  action = "Neotree toggle";
                } 
                {
                  icon = " ";
                  desc = "Quit Neovim        ";
                  key = "q";
                  action = "qa";
                }
              ];
            };
          };
        };
      };
    };
  };
}
