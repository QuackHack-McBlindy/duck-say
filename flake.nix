{
  description = "A duck says - what?";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = pkgs.writeShellScriptBin "duck" ''
      #!/usr/bin/env bash

      TEXT="$1"

      if [ -z "$TEXT" ]; then
        TEXT="Quack?"
      fi

      LENGTH=$(echo -n "$TEXT" | wc -c)
      BORDER=$(head -c "$LENGTH" < /dev/zero | tr '\0' '-')

      echo "      $BORDER"
      echo "     / $TEXT \\"
      echo "     \\ $BORDER /"
      echo "        ,----,"
      echo "   ___.\`      \`,"
      echo "   \`===  D     :"
      echo "     \`'.      .'"
      echo "        )    (                   ,"
      echo "       /      \\_________________/|"
      echo "      /                          |"
      echo "     |                           ;"
      echo "     |               _____       /"
      echo "     |      \\       ______7    ,'"
      echo "     |       \\    ______7     /"
      echo "      \\       \`-,____7      ,'"
      echo "^~^~^~^\\                  /~^~^~^~^"
      echo "  ~^~^~^ \`----------------' ~^~^~^"
      echo " ~^~^~^~^~^^~^~^~^~^~^~^~^~^~^~^~"
    '';
  };
}
