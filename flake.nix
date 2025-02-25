{
  description = "A talking ASCII duck with nix run!";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";  # Import nixpkgs

  outputs = { self, nixpkgs }: 
  let 
    system = "x8664-linux";  # Adjust for your system if needed
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = pkgs.writeShellScriptBin "duck" ''
      TEXT="$1"

      if [ -z "$TEXT" ]; then
        TEXT="Quack?"
      fi

      LENGTH=${#TEXT}
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
