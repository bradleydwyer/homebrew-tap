class DomainCheck < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/domain-check"
  url "https://github.com/bradleydwyer/domain-check/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f640bb262f7ee697a7b0e03c07ef04aa9299ff8cc7694d2f12763467355c134a"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/domain-check/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "cbc8d7abd60d57107186a91517bc13e43a8bd7483ac660a953cd026e34a64ccb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "51bf3579e5298d418db96390d05ffa33fc1c576767ce00a24c90e37ab3bc4df3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "bcad0c16893b38eb46d2c9f9a3b25ffc8d550234f66df56756ba803660cc752f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "domain-check", shell_output("#{bin}/domain-check --version")
  end
end
