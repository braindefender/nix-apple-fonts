{
  description = "Apple Fonts package for nixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    # The name "snowfall-lib" is required due to how Snowfall Lib processes your
    # flake's inputs.
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # We will handle this in the next section.
  outputs = inputs: inputs.snowfall-lib.mkFlake {
    inherit inputs;

    src = ./.;

    snowfall = {
      namespace = "plusultra";

      meta = {
        name = "nix-apple-fonts";
        title = "Nix Apple Fonts";
      };
    };
  };
}
