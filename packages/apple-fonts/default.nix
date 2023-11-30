{ lib, inputs, pkgs, stdenvNoCC, xorg }:
stdenvNoCC.mkDerivation {
  pname = "apple-fonts";
  version = "1.0";

  dontBuild = true;
  dontUnpack = true;
  src = ./.;

  nativeBuildInputs = [ xorg.mkfontscale ];

  # read install --help to find -Dm644 meaning
  installPhase = ''
    runHook preInstall
    mkdir -p $out/usr/share/fonts/opentype
    for folder in $src/fonts/*; do
        install -Dm644 "$folder"/*.otf -t $out/usr/share/fonts/opentype
    done
    mkfontdir "$out/usr/share/fonts/opentype"
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://developer.apple.com/fonts/";
    description = "Apple Fonts package for nixOS";
    longDescription = ''
      Get the typefaces you need to design interfaces for your apps on Apple platforms.
      These typefaces are designed to optimally display text at a variety of sizes
      and in a wide range of languages across multiple interfaces.
    '';
    platforms = platforms.all;
  };
}
