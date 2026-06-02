# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_20,
    pkgs.nodePackages.http-server
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "vscodevim.vim",
      "github.copilot",
      "ms-azuretools.vscode-docker",
      "mutantdino.resourcemonitor",
      "redhat.vscode-yaml",
      "bradlc.vscode-tailwindcss"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["http-server", "-p", "$PORT", "dist"];
          manager = "web";
          env = {
            PORT = "$PORT";
          };
        };
        "web-root" = {
          command = ["http-server", "-p", "$PORT"];
          manager = "web";
        };
        "build-config" = {
          command = ["http-server", "-p", "$PORT", "build_config.html"];
          manager = "web";
        };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
      };
    };
  };
}
