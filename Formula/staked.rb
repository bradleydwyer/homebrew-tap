class Staked < Formula
  desc "Package registry name availability checker with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/staked"
  version "2.0.5"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/staked/releases/download/v2.0.5/staked-aarch64-apple-darwin"
    sha256 "9b539ba35ad1bd2b5d5efd563a31fba2bde23135326bb169fc0c3e2c2a1ed351"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/staked/releases/download/v2.0.5/staked-aarch64-unknown-linux-gnu"
      sha256 "5e5c97187b940930902b8c5c0ba4a824d1caa61efe47722f286f44ec1cadc3a3"
    else
      url "https://github.com/bradleydwyer/staked/releases/download/v2.0.5/staked-x86_64-unknown-linux-gnu"
      sha256 "75fddfc240b6a7935e6b98c3158e0b8dcdc3e9b3fd7e560034eec0782cf5fd22"
    end
  end

  def install
    bin.install Dir["staked*"].first => "staked"
  end

  test do
    assert_match "staked", shell_output("\#{bin}/staked --version")
  end
end
