# typed: false
# frozen_string_literal: true

require "language/node"

class ScreenshotComposer < Formula
  desc "Compose Google Play Store screenshots from Android app screenshots"
  homepage "https://github.com/tajchert/screenshot-composer"
  url "https://registry.npmjs.org/screenshot-composer/-/screenshot-composer-0.2.0.tgz"
  sha256 "d64b1f5a0fc8a2e290ce7acb80e44e1bd89d7f3c1083ff19e96898573bd31253"
  license all_of: ["MIT", "Apache-2.0"]

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      On first `screenshot-composer generate`, Chromium (~170 MB) is downloaded once into
      ~/.screenshot-composer/chromium. No download happens until you render.
    EOS
  end

  test do
    assert_match "screenshot-composer", shell_output("#{bin}/screenshot-composer --version")
  end
end
