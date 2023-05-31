{
  inputs = {
    flake1.url = "github:ehllie/flake1";
    flake2.url = "github:ehllie/flake2";
  };
  outputs = { flake1, flake2, ... }:
    let
      eachSystem = pkgBuild:
        builtins.listToAttrs (builtins.map
          (system: { name = system; value = pkgBuild system; })
          [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ]);
    in
    {
      packages = eachSystem (system: {
        hello1 = flake1.packages.${system}.default;
        hello2 = flake2.packages.${system}.default;
      });
    };
}
