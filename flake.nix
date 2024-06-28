{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils
  }: flake-utils.lib.eachDefaultSystem (system: let

    pkgs = import nixpkgs { inherit system; };

  in {

    devShell = pkgs.mkShell {
      name = "nvim-config-dev";
      nativeBuildInputs = with pkgs; [
        lua-language-server
      ];
    };

  });
}
