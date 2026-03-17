class PkgCheck < Formula
  desc "Package registry name availability checker with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/pkg-check"
  url "https://github.com/bradleydwyer/pkg-check/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "301e2f0006f2f362820e0bcf8bba419a1d0160f453a1a8ba0aa869916091cd18"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/pkg-check/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "210622594e50ec0f843e64a9826da184b17fef8584708409d0f64b918f5d5f7f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "61380973003694f208100c40e1463c408b657bcdd4ca3d82f3123f21e8a45886"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "dcd9f28ca390f3f6feecbd21b14ae9f04c2220075f06425df6c735cdd07e786e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "pkg-check", shell_output("#{bin}/pkg-check --version")
  end
end
