class Parked < Formula
  desc "Tiered domain availability checker (DNS, WHOIS, RDAP) with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/parked"
  version "2.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/parked/releases/download/v2.3.0/parked-aarch64-apple-darwin"
    sha256 "3a8b06db80afe03f6e9e44283081723b900d2b470c1ad4755649cfe1a9caa8c4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/parked/releases/download/v2.3.0/parked-aarch64-unknown-linux-gnu"
      sha256 "9ca5dff4b9a574c66e53083b73579290dbc6b975a264ab3005576b9cb2f2af26"
    else
      url "https://github.com/bradleydwyer/parked/releases/download/v2.3.0/parked-x86_64-unknown-linux-gnu"
      sha256 "837b98f565a8fc28878c9d2d5204e8f7a8d7579ac353a74bd562a7badc494074"
    end
  end

  def install
    bin.install Dir["parked*"].first => "parked"
  end

  test do
    assert_match "parked", shell_output("\#{bin}/parked --version")
  end
end
