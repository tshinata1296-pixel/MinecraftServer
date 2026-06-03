{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = with pkgs; [
    unzip
    openssh
    git
    curl
    wget
    apt
    sudo

    # Minecraft Java
    temurin-jre-bin-21

    # Utilities
    screen
    tmux
    htop
    nano

    # Docker
    docker
    docker-compose

    # VM / VPS tools
    qemu
    qemu_kvm
    cdrkit
    cloud-utils
  ];

  env = {
    EDITOR = "nano";
  };

  idx = {
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];

    workspace = {
      onCreate = {
        check-java = "java -version";

        install-playit = ''
          if [ ! -f playit ]; then
            curl -L https://github.com/playit-cloud/playit-agent/releases/latest/download/playit-linux-amd64 -o playit
            chmod +x playit
          fi
        '';
      };

      onStart = { };
    };

    previews = {
      enable = false;
    };
  };
}