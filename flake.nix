{
  description = "A talking ASCII duck with nix run!";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: 
  let 
    system = "x8664-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = pkgs.writeShellScriptBin "duck" ''
      #!/usr/bin/env bash

      TEXT="$1"

      if [ -z "$TEXT" ]; then
        TEXT="Quack?"
      fi

      LENGTH=$(echo -n "$TEXT" | wc -c)
      BORDER=$(printf '%.0s' $(seq 1 $LENGTH))


      echo "      $BORDER"
      echo "     / $TEXT \"
      echo "     \$BORDER/"
      echo "        ,----,"
      echo "   .`      `,"
      echo "   `===  D     :"
      echo "     `'.      .'"
      echo "        )    (                   ,"
      echo "       /      \__/|"
      echo "      /                          |"
      echo "     |                           ;"
      echo "     |               _       /"
      echo "     |      \       __7    ,'"
      echo "     |       \    __7     /"
      echo "      \       `-,____7      ,'   jgs"
      echo "^~^~^~^`\                  /~^~^~^~^"
      echo "  ~^~^~^ `----------------' ~^~^~^"
      echo " ~^~^~^~^~^^~^~^~^~^~^~^~^~^~^~^~"
    '';
  };
}
