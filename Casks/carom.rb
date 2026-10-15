cask "carom" do
  version "1.0.3"
  sha256 "ba04db3db0251df39e74b7c157a9c8553b4d66efc15021b86222f9cce8a9e3aa"

  url "https://github.com/tajchert/carom/releases/download/v#{version}/Carom-#{version}-macos.zip"
  name "Carom"
  desc "End-to-end encrypted phone notification and clipboard sync"
  homepage "https://github.com/tajchert/carom"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Carom.app"

  uninstall quit: "com.mtajchert.carom.mac"

  zap trash: [
    "~/Library/Application Support/Carom",
    "~/Library/Preferences/com.mtajchert.carom.mac.plist",
  ]

  caveats <<~EOS
    Carom is ad-hoc signed and is not notarized.
    If macOS blocks the first launch, review Carom in System Settings >
    Privacy & Security and choose Open Anyway if you trust this release.
    After an update, macOS may ask once to let Carom use its keychain items.

    Carom needs your own Hub on Cloudflare. See the setup guide:
      https://github.com/tajchert/carom/blob/main/docs/SETUP.md
  EOS
end
