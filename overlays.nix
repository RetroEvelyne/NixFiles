[
  # My build of suckless dwm
  (final: prev: {
    dwm = prev.dwm.overrideAttrs (oldAttrs: {
      src = final.fetchFromGitHub {
        owner = "RetroEvelyne";
        repo = "dwm";
        rev = "0409fc4967bbe2b15dd8dc83e8e5c2d1bff41c1d";
        sha256 = "sha256-EqzueCxJ+yCzKp5INV5Op/znoZYWmqMbcpcVuo8ddnQ=";
      };
    });
    st = prev.st.overrideAttrs (oldAttrs: {
      src = final.fetchFromGitHub {
        owner = "RetroEvelyne";
        repo = "st";
        rev = "45efc73331df1c5877e3c6e75a879780bb84504e";
        sha256 = "sha256-D0YmbURDyTW5qzNZjIIwlWOHr5j8kenggSQ8GxhuLKo=";
      };
      buildInputs = oldAttrs.buildInputs ++ [ final.harfbuzz ];
    });
    dmenu = prev.dmenu.overrideAttrs (oldAttrs: {
      src = final.fetchFromGitHub {
        owner = "RetroEvelyne";
        repo = "dickmenu";
        rev = "34073a1a7de2b6f23909154d4425355a04a63f16";
        sha256 = "sha256-JqM6fecuV6ObsPPQQub3WY2dZp2rWcX9u3EqYmhG8WI=";
      };
    });
    slstatus = prev.slstatus.overrideAttrs (oldAttrs: {
      src = final.fetchFromGitHub {
        owner = "SpyHoodle";
        repo = "slstatus";
        rev = "b22f3d8ec8e2d67bbd32f02721d9d8157a46edd4";
        sha256 = "sha256-OhssKVQArcQAgCavkFaCRvxUM3689t1v3YCv9IW7osU=";
      };
    });
    slock = prev.slock.overrideAttrs (oldAttrs: {
      src = final.fetchFromGitHub {
        owner = "SpyHoodle";
        repo = "slock";
        rev = "8c5d321b641961237f747d3e68f52b163d673634";
        sha256 = "sha256-y+6VU3jXbUOyhUcyPC7CDGjyWLSJcCkhYiHscVib7j4=";
      };
      buildInputs = oldAttrs.buildInputs ++ [ final.xorg.libXpm ];
    });
    tabbed = prev.tabbed.overrideAttrs (oldAttrs: {
      src = final.fetchFromGitHub {
        owner = "SpyHoodle";
        repo = "tabbed";
        rev = "1001f193fd076cba12bd1ec9f113c144b37d8689";
        sha256 = "sha256-M5LrFplGfzCdhLTutsPNmox69brvAm2BlXnyza9kGxQ=";
      };
    });
    ncmpcpp = prev.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = false;
    };
    nerdfonts = prev.nerdfonts.override {
      fonts = [ "Iosevka" "JetBrainsMono" "Terminus" ];
    };
  })
]
