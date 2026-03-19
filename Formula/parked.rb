class Parked < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/parked"
  version "2.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/parked/releases/download/v2.4.0/parked-aarch64-apple-darwin"
    sha256 "1424ae4b37558a69dabe8281ed9ed1cd6f57c9e5d323ea54bc9ae0958d46d88b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/parked/releases/download/v2.4.0/parked-aarch64-unknown-linux-gnu"
      sha256 "e7518cd69f6f3ff678d6d3806c4c5c3d3fd1bf4b1174d1effaba247107a10e76"
    else
      url "https://github.com/bradleydwyer/parked/releases/download/v2.4.0/parked-x86_64-unknown-linux-gnu"
      sha256 "349e06e4537650f0f9f4b5ab3dbc3747172776581f18b777bdc0e23bbd9db3fa"
    end
  end

  def install
    bin.install Dir["parked*"].first => "parked"
  end

  test do
    assert_match "parked", shell_output("\#{bin}/parked --version")
  end
end
