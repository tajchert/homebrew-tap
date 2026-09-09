cask "smallibre" do
  version "0.4.1"
  sha256 "4a5ceb1dc4845c3f53a7e039f43c8316383aa919aecfa1cdab667585a6377a41"

  url "https://github.com/tajchert/smallibre/releases/download/v#{version}/Smallibre-#{version}-macos-arm64.zip"
  name "Smallibre"
  desc "Native ebook library manager"
  homepage "https://github.com/tajchert/smallibre"

  livecheck do
    skip "Releases are updated manually"
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Smallibre.app"

  caveats <<~EOS
    This build is ad-hoc signed and is not notarized.
    If macOS blocks the first launch, review Smallibre in System Settings >
    Privacy & Security and choose Open Anyway if you trust this release.
  EOS
end
