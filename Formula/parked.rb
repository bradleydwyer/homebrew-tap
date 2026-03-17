class Parked < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/parked"
  url "https://github.com/bradleydwyer/parked/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "c2f457bc57876d446da6b37c7e24c36d15cbf5286bc909f554966625dbc5db3e"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/parked/releases/download/v2.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "35a8c02d7aa59b1eaf169c39c4cecc5cb3176862224a0441edca2835bd27df80"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "21f01e5472314377e5df8e82d7f2174f4cbfff17317c1e6fab099cf52b4df11b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "3e2e97ad533e2b14d9e2389fcd12648806da3370fcf7845795d4d9bd5e355136"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "parked", shell_output("#{bin}/parked --version")
  end
end
