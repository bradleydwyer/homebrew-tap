class Staked < Formula
  desc "Package registry name availability checker with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/staked"
  version "2.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/staked/releases/download/v2.1.0/staked-aarch64-apple-darwin"
    sha256 "ac3f1608a3c5376987568137ec6ef406f9540897fd8ae7fe8619ecef3fb80060"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/staked/releases/download/v2.1.0/staked-aarch64-unknown-linux-gnu"
      sha256 "d0959f2c69f50519847817ba8dbe07f98e6f277d17048d57196bedb626d3b7ba"
    else
      url "https://github.com/bradleydwyer/staked/releases/download/v2.1.0/staked-x86_64-unknown-linux-gnu"
      sha256 "7e42f124dd5b52910117a60a91903372e9bfcbcdb50a5b6a025c90d2d9f148b1"
    end
  end

  def install
    bin.install Dir["staked*"].first => "staked"
  end

  test do
    assert_match "staked", shell_output("\#{bin}/staked --version")
  end
end
