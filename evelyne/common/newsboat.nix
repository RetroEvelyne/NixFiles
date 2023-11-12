{ config, pkgs, ... }:

{
  programs.newsboat = {
    enable = true;
    urls = [
      {
        title = "Matt's Channel";
        tags = [ "yt" ];
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC-AU1kLP3m8y6YfNaHEvMuQ";
      }
      {
        title = "Luke's Blog";
        tags = [ "yt" ];
        url = "https://lukesmith.xyz/index.xml";
      }
      {
        title = "Maddie's Gitea";
        tags = [ "git" ];
        url = "https://git.spyhoodle.me/maddie.rss";
      }
    ];
  };
}
