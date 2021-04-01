{ pkgs ? import <nixpkgs> {}
, myPkgs ? import (fetchTarball "https://github.com/powermosfet/asmunds-nix-packages/tarball/b4bb3c35e813130549ef81a8c5f9487e46572b9c") { }
}:

let
  sdkPath = ".sdk";
in

pkgs.mkShell {
  nativeBuildInputs = [
    myPkgs.xtensa-esp8266-toolchain
    myPkgs.esp8266-rtos-sdk

    pkgs.python
    pkgs.python27Packages.pip
    pkgs.python27Packages.virtualenv

    pkgs.ncurses
    pkgs.git
    pkgs.flex
    pkgs.which
    pkgs.bison
    pkgs.gperf
    pkgs.wget
  ];

  shellHook = ''
    LOCALE_ARCHIVE="$(nix-build --no-out-link '<nixpkgs>' -A glibcLocales)/lib/locale/locale-archive"

    rm -r ${sdkPath}
    mkdir -p ${sdkPath}
    cp -Ru ${myPkgs.esp8266-rtos-sdk}/* ${sdkPath}/
    chmod -R u+w ${sdkPath}
    export IDF_PATH="${sdkPath}"

    virtualenv bereder
    source bereder/bin/activate
    python -m pip install -r $IDF_PATH/requirements.txt

    export LANG=en_GB.UTF-8
  '';
}
