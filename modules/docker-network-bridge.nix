{ config, pkgs, lib, ... }: {
  systemd.services.init-docker-bridge-network-and-files = {
    description = "Create the network bridge bridge for docker-bridge.";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    
    serviceConfig.Type = "oneshot";
    script = let dockercli = "${config.virtualisation.docker.package}/bin/docker";
            in ''
              # Put a true at the end to prevent getting non-zero return code, which will
              # crash the whole service.
              check=$(${dockercli} network ls | grep "bridge" || true)
              if [ -z "$check" ]; then
                ${dockercli} network create bridge
              else
                echo "bridge already exists in docker"
              fi
            '';
  };
}
