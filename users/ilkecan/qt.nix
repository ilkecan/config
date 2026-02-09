{
  pkgs,
  ...
}:

{
  home = {
    packages = with pkgs; [
      kdePackages.qt6ct
      libsForQt5.qt5ct
    ];

    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "gtk3";
    };
  };

  qt = {
    enable = true;
    kde.settings = {};
    qt5ctSettings = {};
    qt6ctSettings = {};
    style.name = "adwaita-dark";
  };
}
