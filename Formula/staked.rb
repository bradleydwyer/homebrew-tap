class Staked < Formula
  desc "Package registry name availability checker with CLI and MCP server"
  homepage "https://github.com/bradleydwyer/staked"
  version "2.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/staked/releases/download/v2.0.3/staked-aarch64-apple-darwin"
      sha256 "0dc54a0076638adeea86b1fd6c5ce627614af14349f67768f85e0e78cfa7f273"
    else
      url "https://github.com/bradleydwyer/staked/releases/download/v2.0.3/staked-x86_64-apple-darwin"
      sha256 "b0163e27f307f760f9daf8372c2a7140c570a553ae7093f492c3c962ceb65e31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/staked/releases/download/v2.0.3/staked-aarch64-unknown-linux-gnu"
      sha256 "a36204a54aad0991344d01d01b97d7eb88c00a51acecafba0eefc3e9c624fe22"
    else
      url "https://github.com/bradleydwyer/staked/releases/download/v2.0.3/staked-x86_64-unknown-linux-gnu"
      sha256 "40ca159787b280e2c31a9a031e0fe24a9b963ad469305afbd5c30dcb58cc4af0"
    end
  end

  def install
    bin.install Dir["staked*"].first => "staked"
  end

  test do
    assert_match "staked", shell_output("\#{bin}/staked --version")
  end
end
