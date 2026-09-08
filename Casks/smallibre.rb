cask "smallibre" do
  version "0.3.5"
  sha256 "1eafe657b6ad32fe3a87f6271b53f476dc5cdf1fffd059d653a982166fe77cae"

  url "https://github.com/tajchert/smallibre/releases/download/v#{version}/Smallibre-#{version}-macos-arm64.zip"
  name "Smallibre"
  desc "Native ebook library manager"
  homepage "https://github.com/tajchert/smallibre"

  livecheck do
    skip "Early-alpha releases are updated manually"
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Smallibre.app"

  caveats <<~EOS
    This early-alpha build is ad-hoc signed and is not notarized.
    If macOS blocks the first launch, review Smallibre in System Settings >
    Privacy & Security and choose Open Anyway if you trust this release.
  EOS
end
