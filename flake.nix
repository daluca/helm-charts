{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
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
        helm-docs
        nodePackages.prettier
        go-jsonnet
      ];
      shellHook = ''
        echo "Loaded $name...";
      '';
    };
  };
}
