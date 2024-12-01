{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    custompkgs.url = "github:daluca/nix-config";
    custompkgs.inputs.nixpkgs.follows = "nixpkgs";

    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{self, nixpkgs, custompkgs, git-hooks, ...}: let
    supportedSystems = [ "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    checks = forAllSystems (system: {
      pre-commit-check = git-hooks.lib.${system}.run {
        src = ./.;
        hooks = import ./.pre-commit-config.nix { pkgs = nixpkgs.legacyPackages.${system}; };
      };
    });

    devShells = forAllSystems (system: {
      default = nixpkgs.legacyPackages.${system}.mkShell {
        inherit (self.checks.${system}.pre-commit-check) shellHook;
        name = "helm-charts";
        buildInputs = with nixpkgs.legacyPackages.${system}; [
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
        ];
        JUST_COMMAND_COLOR = "blue";
        JUST_UNSTABLE = true;
      };
    });
  };
}
