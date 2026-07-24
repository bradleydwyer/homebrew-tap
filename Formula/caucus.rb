class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  version "1.1.4"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.4/caucus-aarch64-apple-darwin"
    sha256 "fbe3ae1e228027b69704820a222adc0cd2f75986a1f71a30a5a8b9f8780e23f6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.4/caucus-aarch64-unknown-linux-gnu"
      sha256 "246c16e8668d26d70d95ed986b0f687caf75dc6040f3fed345c2e5bfb7312cbd"
    else
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.4/caucus-x86_64-unknown-linux-gnu"
      sha256 "7101d1b0ba0eca27d2197f5be6a37e9aafc25fb3652f78f0e36fcdf83d80bc0e"
    end
  end

  def install
    bin.install Dir["caucus*"].first => "caucus"
  end

  test do
    assert_match "caucus", shell_output("\#{bin}/caucus --version")
  end
end
