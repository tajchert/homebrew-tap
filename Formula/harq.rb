class Harq < Formula
  desc "CLI tool for exploring and filtering HAR files"
  homepage "https://github.com/tajchert/harq"
  url "https://github.com/tajchert/harq/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "411737c66ec673ad8be3ae58a387087211665390bdff1c81aefae60729ce48e4"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "harq", shell_output("#{bin}/harq --help")
  end
end
