class Parked < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/parked"
  version "2.2.4"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/parked/releases/download/v2.2.4/parked-aarch64-apple-darwin"
    sha256 "02b1457fac3de2536d65072e88cb5e86d85273bd40307f955b8d4f7eea635c22"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.4/parked-aarch64-unknown-linux-gnu"
      sha256 "19fa4b4fb3a34697c11a4c12513bd29fcf08a8ff37f25b6412b3a77f4c41f15f"
    else
      url "https://github.com/bradleydwyer/parked/releases/download/v2.2.4/parked-x86_64-unknown-linux-gnu"
      sha256 "63bfd4e386733b8c9ff758987302891192b8ea0c4fe78210e48159df883fdf89"
    end
  end

  def install
    bin.install Dir["parked*"].first => "parked"
  end

  test do
    assert_match "parked", shell_output("\#{bin}/parked --version")
  end
end
