cask "smallibre" do
  version "0.2.0"
  sha256 "6f2efeb1363498930631abd74cbc2185f5084a1211e5789e16fca5d48e71d2d7"

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
