class Grepmail < Formula
  desc "Fast, grep-style CLI for searching and exploring mbox mail archives"
  homepage "https://github.com/tajchert/grepmail"
  url "https://github.com/tajchert/grepmail/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2b5cc6fb8b350bdfd7b3e91f8fae7afefaebf57a37747f7de92d91054136b9f1"
  license "MIT"
  head "https://github.com/tajchert/grepmail.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/grepmail"
  end

  test do
    assert_match "grepmail", shell_output("#{bin}/grepmail help")
  end
end
