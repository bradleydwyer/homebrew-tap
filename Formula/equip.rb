class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.4/equip-aarch64-apple-darwin"
      sha256 "aa6b23526c81f0ddff4d42ad610d68eb195aa17d2a841ef58e3ad29f5b174997"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.4/equip-x86_64-apple-darwin"
      sha256 "d396b79e1ca88c6f580bcb96565bc3b5e7d933b971c1128443e08eb6bd67b621"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.4/equip-aarch64-unknown-linux-gnu"
      sha256 "e7703f3d6ba5fee27f37348a0eddc146654f252d1755ae99ff54667cdcd00623"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.4/equip-x86_64-unknown-linux-gnu"
      sha256 "518bbb6ee4eb16a4888a7f1bf1cd43d17242309b3966fb6b78cb6027092e8bed"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
