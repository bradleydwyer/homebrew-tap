class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.1/equip-aarch64-apple-darwin"
      sha256 "00675c7fde359c4aa539e6e97f96a0212114f5289ebc98776dafb8fe3f7e8664"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.1/equip-x86_64-apple-darwin"
      sha256 "ccdf4c2d1a3ff34fa2720847e0c67b331a7991c8621f96fc22bd5233af7a4a35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.1/equip-aarch64-unknown-linux-gnu"
      sha256 "0ffa69d1a0857e2cc53f85ca7e7a51d22702a372f241c7cffdb4c0d2f1eb61cc"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.1/equip-x86_64-unknown-linux-gnu"
      sha256 "edecad00260d0502c6db2941b7f7c70093a416d53698ecf4b94b96bfbfe2fc52"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
