{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  
  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs;[
            hugo
            (python3.withPackages (p: [
              p.pillow 
            ]))
            (texlive.combine {
              inherit (texlive) scheme-basic wrapfig etoolbox xcolor
                enumitem supertabular titlesec multirow parskip
                biblatex fontawesome fontawesome5
              ;
            })
          ];
        };
      }
    );
}
