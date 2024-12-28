{
  description = "Raylib development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          name = "raylib flake";
          packages = with pkgs; [
            cmake
            pkg-config
            libgcc
            tmux
            ninja
            clang-tools
            libGL

            # X11 dependencies
            xorg.libX11
            xorg.libX11.dev
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXrandr

            # Uncomment the line below if you want to build Raylib with web support
            # pkgs.emscripten
          ];
        };
      }
    );
}
