cask "thegit" do
  version "0.11.0"
  sha256 "6d09954fc3936353911916c2b64b430b390b51c85ba61881fcf6fc2546f95e50"

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
