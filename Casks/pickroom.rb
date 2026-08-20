cask "pickroom" do
  version "0.4.0"
  sha256 "be83851d9a9a3f944e6416d652a951e63b8a74929d9d78c85e26d7f8b5a782e1"

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
