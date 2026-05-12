class Harq < Formula
  desc "CLI tool for exploring and filtering HAR files"
  homepage "https://github.com/tajchert/harq"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tajchert/harq/releases/download/v0.2.0/harq_0.2.0_darwin_amd64.tar.gz"
      sha256 "91d8d96486ab33285a9242ed97b441b565ae0b31c3676925f82e86a1de25cfb9"

      define_method(:install) do
        bin.install "harq"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/tajchert/harq/releases/download/v0.2.0/harq_0.2.0_darwin_arm64.tar.gz"
      sha256 "a613b52e2655e3e370de72cb1b28be1d02de67a4c4568623f7995c4461b71ce6"

      define_method(:install) do
        bin.install "harq"
      end
    end
  end

  on_linux do
    url "https://github.com/tajchert/harq/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "411737c66ec673ad8be3ae58a387087211665390bdff1c81aefae60729ce48e4"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "harq", shell_output("#{bin}/harq --help")
  end
end
