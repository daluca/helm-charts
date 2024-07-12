{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{self, nixpkgs, nixpkgs-unstable, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system}.pkgs;
    unstable = nixpkgs-unstable.legacyPackages.${system}.pkgs;
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "daluca/helm-charts tools";
      buildInputs = with pkgs; [
        kubectl
        kubernetes-helm
        chart-testing
        just
        unstable.kind
        unstable.helm-ls
        helm-docs
        nodePackages.prettier
        go-jsonnet
        unstable.jsonnet-language-server
        pre-commit
      ];
      shellHook = ''
        echo "Loaded $name...";
      '';
      JUST_UNSTABLE=true;
    };
  };
}
