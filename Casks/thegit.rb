cask "thegit" do
  version "0.14.0"
  sha256 "315916003f35788e3fa8d84a7298007c72d8561dd8072311a663af1eddd5d427"

  url "https://github.com/zjywill/TheGit/releases/download/v#{version}/TheGit-#{version}.dmg"
  name "TheGit"
  desc "Lightweight native Git client for macOS"
  homepage "https://github.com/zjywill/TheGit"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Bare symbol, not ">= :sonoma": Homebrew 6 reads a symbol as a minimum and
  # deprecates the string form, which every brew command then warns about.
  depends_on macos: :sonoma

  app "TheGit.app"

  zap trash: [
    "~/Library/Preferences/com.zjywill.TheGit.plist",
    "~/Library/Saved Application State/com.zjywill.TheGit.savedState",
  ]
end
