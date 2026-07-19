class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  version "1.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.1/caucus-aarch64-apple-darwin"
    sha256 "275a8666dd6fe0f72f6fa2e4967bf57146104cda59b1a8469ac0dbd7e9faef06"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.1/caucus-aarch64-unknown-linux-gnu"
      sha256 "3590e77b961c4c175437f9eaaebe38118c25ca15f5c230a9c56699e75e1ba791"
    else
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.1.1/caucus-x86_64-unknown-linux-gnu"
      sha256 "ce39bea97da0b0567f8c9cd0585ec3b37630266561c4560ba25980107ccdf072"
    end
  end

  def install
    bin.install Dir["caucus*"].first => "caucus"
  end

  test do
    assert_match "caucus", shell_output("\#{bin}/caucus --version")
  end
end
