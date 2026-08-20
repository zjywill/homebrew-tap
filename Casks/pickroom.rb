cask "pickroom" do
  version "0.3.0"
  sha256 "cd04f8a231f271011de01314ddf2d29c8a8a3dc24f15f6ad34a99eb1ad1ba0c9"

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
