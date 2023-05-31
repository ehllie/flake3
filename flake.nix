{
  inputs = {
    flake1.url = "github:ehllie/flake1";
    flake2.url = "github:ehllie/flake2";
  };
  outputs = { flake1, flake2, ... }: {
    packages.aarch64-darwin = {
      hello1 = flake1.packages.aarch64-darwin.default;
      hello2 = flake2.packages.aarch64-darwin.default;
    };
  };
}
