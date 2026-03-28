{
  description = "Your new project, powered by flake-parts!";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
    gleam2nix.url = "https://git.isincredibly.gay/srxl/gleam2nix/archive/main.tar.gz";
    gleam2nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { flake-parts, ... } @ inputs: flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      # other flake-parts modules
    ];

    perSystem = { config, self', inputs', pkgs, system, ... }: let 
      test-gleam = inputs.gleam2nix.lib."${system}".buildGleamApplication {
        pname = "test-gleam";
        version = "1.0.0";
        src = ./.;
        gleamNix = import ./gleam.nix;
      };
    in {
      # Allows definition of system-specific attributes
      # without needing to declare the system explicitly!
      #
      # Quick rundown of the provided arguments:
      # - config is a reference to the full configuration, lazily evaluated
      # - self' is the outputs as provided here, without system. (self'.packages.default)
      # - inputs' is the input without needing to specify system (inputs'.foo.packages.bar)
      # - pkgs is an instance of nixpkgs for your specific system
      # - system is the system this configuration is for

      # This is equivalent to packages.<system>.default
      packages.default = test-gleam;
      # packages.default = pkgs.hello;
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          # gleam compiler, language server, formatter etc.
          gleam
          # BEAM virtual machine/Erlang interpreter
          erlang
          # Erlang package manager (used by gleam)
          rebar3
          # Convert gleam.toml dependencies into Nix dependencies gleam.nix
          inputs.gleam2nix.packages.${system}.gleam2nix
          # Other dev tools and dependencies like treefmt
          # ...
        ];
      };
    };

    flake = {
      # The usual flake attributes can be defined here, including
      # system-agnostic and/or arbitrary outputs.
    };

    # Declared systems that your flake supports. These will be enumerated in perSystem
    systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
  };
}