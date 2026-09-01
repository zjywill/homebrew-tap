cask "pickroom" do
  version "0.5.0"
  sha256 "0fe7f663f65afa048b6164af75208258ac9b3bfb4b92ed558e76f299cfee5ad4"

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
