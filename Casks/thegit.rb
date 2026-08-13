cask "thegit" do
  version "0.10.8"
  sha256 "988ee0f1c28851fd34da379b3bb37e513929c2cc7087d695fec1fbb833c7be7d"

  url "https://github.com/zjywill/TheGit/releases/download/v#{version}/TheGit-#{version}.dmg"
  name "TheGit"
  desc "Lightweight native Git client for macOS"
  homepage "https://github.com/zjywill/TheGit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "TheGit.app"

  zap trash: [
    "~/Library/Preferences/com.zjywill.TheGit.plist",
    "~/Library/Saved Application State/com.zjywill.TheGit.savedState",
  ]
end
