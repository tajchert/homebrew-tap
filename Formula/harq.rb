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
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/tajchert/harq/releases/download/v0.2.0/harq_0.2.0_linux_amd64.tar.gz"
      sha256 "232cfb2aa447eb13cb1046faafc7e5619a29260664f908441a1f72e458b586b6"

      define_method(:install) do
        bin.install "harq"
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tajchert/harq/releases/download/v0.2.0/harq_0.2.0_linux_arm64.tar.gz"
      sha256 "6ac8fc31a17c019b4c6d49953f1bead32c7c95073a9a4b0fc6d2a9b6d17ed44d"

      define_method(:install) do
        bin.install "harq"
      end
    end
  end

  test do
    assert_match "harq", shell_output("#{bin}/harq --help")
  end
end
