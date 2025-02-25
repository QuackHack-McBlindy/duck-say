{
  description = "A talking ASCII duck with nix run!";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";  # Import nixpkgs

  outputs = { self, nixpkgs }: 
  let 
    system = "x86_64-linux";  # Adjust for your system if needed
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = pkgs.writeShellScriptBin "duck" ''
      #!/bin/sh
      TEXT="$1"

      if [ -z "$TEXT" ]; then
        TEXT="Quack?"
      fi

      LENGTH=${#TEXT}
      BORDER=$(head -c "$LENGTH" < /dev/zero | tr '\0' '-')


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
