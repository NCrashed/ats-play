# Latest Nightly
let pkgs = import ./pkgs.nix {
    config = {
      packageOverrides = pkgs: with pkgs; {
        ats2 = callPackage ./ats2 {};
      };
    };
  };
in pkgs.stdenv.mkDerivation rec {
  name = "ats-env";
  buildInputs = with pkgs; [
    ats2

    # Other packages
    pkgconfig
    git
    libGL
    xorg.libxcb
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];
  LD_LIBRARY_PATH = with pkgs; "/run/opengl-driver/lib:/run/opengl-driver-32/lib:${libGL}/lib:${xorg.libX11}/lib:${xorg.libXcursor}/lib:${xorg.libXrandr}/lib:${xorg.libXi}/lib";
}
