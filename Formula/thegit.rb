class Thegit < Formula
  desc "Lightweight native Git client for macOS"
  homepage "https://github.com/zjywill/TheGit"
  url "https://github.com/zjywill/TheGit/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "1a504105db6645636a68e52cdc1d6cfeaecef99e3f1dec52c9a8815dfef7ab27"
  license "MIT"

  # Tags, not releases: the source repo publishes no GitHub Release object,
  # so :github_latest would find nothing to compare against.
  livecheck do
    url "https://github.com/zjywill/TheGit.git"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :git
  end

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    # scripts/bundle.sh is the one place the .app is assembled — the DMG in a
    # release and the bundle installed here come out of the same code, so the
    # Info.plist and its UTI declarations can't drift between them.
    ENV["UNIVERSAL"] = "0"          # Homebrew builds for the host arch only
    ENV["DMG"] = "0"                # a formula ships the bundle, not a disk image
    ENV["DEST"] = buildpath/"dist"
    ENV["VERSION"] = version.to_s
    system "./scripts/bundle.sh"

    prefix.install "dist/TheGit.app"
    # The documented way to surface a binary buried in a .app. Launching from
    # a terminal is the only entry point a formula can give you on its own;
    # `caveats` covers the Finder half.
    bin.write_exec_script prefix/"TheGit.app/Contents/MacOS/TheGit"
  end

  def caveats
    <<~EOS
      TheGit.app was installed to:
        #{opt_prefix}/TheGit.app

      A formula cannot write outside the Homebrew prefix, so link it yourself
      to get it into Finder, Launchpad and Spotlight:
        ln -sfn #{opt_prefix}/TheGit.app /Applications/TheGit.app

      Or launch it from a terminal with:
        thegit
    EOS
  end

  test do
    app = prefix/"TheGit.app"
    assert_path_exists app/"Contents/MacOS/TheGit"
    # Built here rather than downloaded, so it carries no quarantine flag —
    # but it still has to be a bundle macOS will load.
    system "/usr/bin/codesign", "--verify", "--strict", app
    assert_match "com.zjywill.TheGit",
                 shell_output("/usr/bin/defaults read #{app}/Contents/Info CFBundleIdentifier")
  end
end
