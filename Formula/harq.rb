class Harq < Formula
  desc "CLI tool for exploring and filtering HAR files"
  homepage "https://github.com/tajchert/harq"
  url "https://github.com/tajchert/harq/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "eb56dde77aaa17ca425e6c88c7ea1c965aa219ee3012a537c1cfca15690e3d2a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "harq", shell_output("#{bin}/harq --help")
  end
end
