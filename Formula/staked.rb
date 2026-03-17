class Staked < Formula
  desc "Package registry name availability checker with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/staked"
  url "https://github.com/bradleydwyer/staked/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "9a12ec84fe185e7b9659812878b74f3cc27d1d316099b14a8c73da1b8da39d76"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/staked/releases/download/v2.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "1debaf73b3223053a061b6b10727278d4fa8ff8791fe11debe8a714f51a49482"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a8e0238adc29a0be5c9beb4109b3496594a137af144b7c01d2d0024e802cb65e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a6e72621a88471e2bba911d271ce3975719586007968fbf32ebd2c1879ce4ebb"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "staked", shell_output("#{bin}/staked --version")
  end
end
