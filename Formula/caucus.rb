class Caucus < Formula
  desc "Multi-LLM consensus engine — aggregate and synthesize LLM outputs"
  homepage "https://github.com/bradleydwyer/caucus"
  version "1.0.7"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/caucus/releases/download/v1.0.7/caucus-aarch64-apple-darwin"
    sha256 "cfc4c188a0cf26773ab9f2929e9cff2a8adc03e9c82f55779b02ca7983daf40b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.0.7/caucus-aarch64-unknown-linux-gnu"
      sha256 "2195ce8ff62763f96a2326c87c1b7b4961fe3ed89f25fce95748c9986c401d38"
    else
      url "https://github.com/bradleydwyer/caucus/releases/download/v1.0.7/caucus-x86_64-unknown-linux-gnu"
      sha256 "a8a5212babee5bae57edcb2a1443d20b11bad0146665c704792d56fd8863ae9e"
    end
  end

  def install
    bin.install Dir["caucus*"].first => "caucus"
  end

  test do
    assert_match "caucus", shell_output("\#{bin}/caucus --version")
  end
end
