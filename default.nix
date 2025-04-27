# default.nix
let
  # We pin to a specific nixpkgs commit for reproducibility.
  # Last updated: 2025-02-25. Check for new commits at https://status.nixos.org.
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/3a05eebede89661660945da1f151959900903b6a.tar.gz") {};
in pkgs.mkShell {
  packages = [
    pkgs.luanti
    pkgs.bashInteractive
    pkgs.lua
    (pkgs.vscode-with-extensions.override {
      vscode = pkgs.vscodium;
      vscodeExtensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        bierner.markdown-mermaid
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vscode-mermaid-editor";
            publisher = "tomoyukim";
            version = "0.19.1";
            #sha256 = "";
            sha256 = "sha256-MZkR9wPTj+TwhQP0kbH4XqlTvQwfkbiZdfzA10Q9z5A=";
          }
          {
            name = "mermaid-markdown-syntax-highlighting";
            publisher = "bpruitt-goddard";
            version = "1.7.0";
            #sha256 = "";
            sha256 = "sha256-Vjmc9tlHSFdhhcSopUG3MnyBSi//B6cpnavqFLhVRho=";
          }
          {
            name = "minetest-tools";
            publisher = "GreenXenith";
            version = "2.0.0";
            #sha256 = "";
            sha256 = "sha256-qSDjisE46PetiX/TChGRx7cOma1jOa+TOrv4gTiQ8/A=";
          }
          {
            name = "local-lua-debugger-vscode";
            publisher = "tomblind";
            version = "0.3.3";
            #sha256 = "";
            sha256 = "sha256-7uZHbhOa/GT9F7+xikaxuQXIGzre1q1uWTWaTJhi2UA=";
          }
        ];
      })
    ];
}
