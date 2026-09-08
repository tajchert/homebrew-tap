cask "smallibre" do
  version "0.3.0"
  sha256 "0aef2a3056ba961e3941291aadf40f90ed87c1bea43fc01ea1faefc2fc315463"

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
