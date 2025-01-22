{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    custompkgs.url = "github:daluca/nix-config";
    custompkgs.inputs.nixpkgs.follows = "nixpkgs";

    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, custompkgs, git-hooks, ...}: let
    supportedSystems = [ "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    checks = forAllSystems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        git-hooks' = git-hooks.lib.${system};
      in {
        pre-commit = git-hooks'.run {
          src = ./.;
          hooks = import ./.pre-commit-config.nix { inherit pkgs; };
        };
      }
    );

    devShells = forAllSystems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pre-commit = self.checks.${system}.pre-commit;
      in {
        default = pkgs.mkShell {
          inherit (pre-commit) shellHook;
          name = "helm-charts";
          buildInputs = with pkgs; [
            kubectl
            kubernetes-helm
            chart-testing
            just
            kind
            helm-ls
            nodePackages.prettier
            go-jsonnet
            jsonnet-language-server
            custompkgs.packages.${system}.jsonnet-debugger
            helm-docs
          ] ++ pre-commit.enabledPackages;
          JUST_COMMAND_COLOR = "blue";
          JUST_UNSTABLE = true;
        };
      }
    );
  };
}
