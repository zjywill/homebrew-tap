cask "pickroom" do
  version "0.3.1"
  sha256 "3a9c8bfb202a88622383ff41a5b9ae7be2133f7302c3b210fbfac51d79640981"

  url "https://github.com/zjywill/Pickroom/releases/download/v#{version}/Pickroom-#{version}.dmg"
  name "Pickroom"
  desc "Keyboard-first RAW culling workspace for macOS"
  homepage "https://github.com/zjywill/Pickroom"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Bare symbol, not ">= :sonoma": Homebrew 6 reads a symbol as a minimum and
  # deprecates the string form, which every brew command then warns about.
  depends_on macos: :sonoma

  app "Pickroom.app"

  zap trash: [
    "~/Library/Application Support/Pickroom",
    "~/Library/Caches/Pickroom",
    "~/Library/Preferences/com.junyizhang.Pickroom.plist",
    "~/Library/Saved Application State/com.junyizhang.Pickroom.savedState",
  ]
end
