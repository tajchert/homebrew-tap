cask "carom" do
  version "1.0.9"
  sha256 "fe696d7b2d6dcdd174222e6c1a9c1d5053ff9aa9124cb8b891dd92621de8f37e"

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
