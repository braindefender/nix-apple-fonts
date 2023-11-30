{ lib, inputs, pkgs, stdenv }:
stdenv.mkDerivation {
  pname = "apple-fonts";
  version = "1.0";

  # read install --help to find -Dm644 meaning
  installPhase = ''
    runHook preInstall
    for folder in ./fonts/*; do
        install -Dm644 "$folder"/*.otf -t $out/share/fonts/opentype
    done
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
