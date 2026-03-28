# Gleam with Nix

This hello-world Wisp webapp project shows how to get Gleam up and running quickly with [Nix](https://nixos.org/).
Simply copy the flake.nix file to your project and run `nix develop .` to get
all required tools to start building Gleam code, e.g.
the Gleam compiler, the Erlang BEAM virtual machine and the Erlang rebar3 package manager.
You can then open the project in your favorite editor like Visual Studio code (i.e. run `code .`)

## Usual Gleam Commands

```sh
gleam test  # Run the tests
gleam run   # Run the project
# ...
```

## Gleam as a Nix package

Adapt the "buildGleamApplication" settings in `flake.nix` to your project.
Run `gleam2nix` to convert your gleam.toml dependencies (technically the manifest.toml lock file) into Nix dependencies inside a new gleam.nix file
Run `nix build .` to build your Gleam project inside a Nix sandbox. If that works, you are ready to deploy
your app to a NixOS server (all required tools will be installed automatically on the server in the same versions).

## Nix Commands

```sh
nix develop .    # Load current flake.nix file, i.e. load gleam compiler, Erlang BEAM interpreter etc into developer environment.
gleam2nix        # Run on every gleam.toml change to convert gleam.toml dependencies into Nix dependencies gleam.nix
nix build .      # Build your Gleam project inside a Nix sandbox (output binary in ./result/bin/test-gleam)
nix flake update # Update all Nix dependencies to the lastest versions (Gleam compiler, Erlang BEAM virtual machine etc.)
```

## Attributions

Nix is a package manager that allows you to manage dependencies in a reproducible way.
This example uses the [gleam2nix](https://gleam2nix.foxgirl.engineering/guides/getting-started/) project
to convert gleam.toml dependencies to Nix packages so that they can be managed by Nix.
