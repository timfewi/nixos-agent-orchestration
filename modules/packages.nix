{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl
    git
    jq
    ripgrep
    tmux
    tree
    vim
  ];
}
