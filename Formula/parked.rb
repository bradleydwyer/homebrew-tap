class Parked < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/parked"
  url "https://github.com/bradleydwyer/parked/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "b4dc466597d8bcfc4f75275220bc8b21ac9a922472b7f6befea0ae6fef314c31"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/parked/releases/download/v2.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "8e3a6e3b9dab74a3aa88705d1f370a0080e67faaf729580c43a186a786d1c785"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9084c8924231d1b8845eee92be7988fa602ba15af860097c9cda787a0f013234"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "96b651f050ccf24ed264f19adff8a9c6e81ed39eb79515f226d0e4996302dd1e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "parked", shell_output("#{bin}/parked --version")
  end
end
