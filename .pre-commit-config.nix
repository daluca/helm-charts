{ pkgs }:

rec {
  check-added-large-files.enable = true;
  check-merge-conflicts.enable = true;
  detect-private-keys.enable = true;
  end-of-file-fixer.enable = true;
  forbid-new-submodules.enable = true;
  no-commit-to-branch.enable = true;
  trim-trailing-whitespace.enable = true;
  yamllint.enable = true;
  markdownlint-cli2 = {
    enable = true;
    name = "markdownlint-cli2";
    description = "Checks the style of Markdown/CommonMark files.";
    package = pkgs.markdownlint-cli2;
    entry = "${markdownlint-cli2.package}/bin/markdownlint-cli2";
    types = [ "markdown" ];
  };
  gitleaks = {
    enable = true;
    name = "Detect hardcoded secrets";
    description = "Detect hardcoded secrets using Gitleaks";
    package = pkgs.gitleaks;
    entry = "${gitleaks.package}/bin/gitleaks protect --verbose --redact --staged";
    pass_filenames = false;
  };
  codespell = {
    enable = true;
    name = "codespell";
    description = "Checks for common misspellings in text files.";
    package = pkgs.codespell;
    entry = "${codespell.package}/bin/codespell";
    types = [ "text" ];
  };
  helm-docs = {
    enable = true;
    name = "Helm Docs";
    description = "Uses 'helm-docs' to create documentation from the Helm chart's 'values.yaml' file, and inserts the result into a corresponding 'README.md' file.";
    package = pkgs.helm-docs;
    entry = "${helm-docs.package}/bin/helm-docs";
    args = [
      "--template-files=charts/_templates.gotmpl"
      "--template-files=README.md.gotmpl"
      "--sort-values-order=file"
    ];
    files = "(README\\.md\\.gotmpl|(Chart|requirements|values)\\.yaml)$";
    require_serial = true;
  };
  check-github-workflows = {
    enable = true;
    name = "Validate GitHub Workflows";
    description = "Validate GitHub Workflows against the schema provided by SchemaStore";
    package = pkgs.check-jsonschema;
    entry = "${check-github-workflows.package}/bin/check-jsonschema --builtin-schema vendor.github-workflows";
    args = [
      "--verbose"
    ];
    files = "^\\.github/workflows/[^/]+$";
    types = [ "yaml" ];
  };
}
