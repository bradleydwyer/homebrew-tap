class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.4/equip-aarch64-apple-darwin"
      sha256 "0739293e492a8d0b0a52bdc45b422898c9683d87b23fa0dae0450163352a4c82"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.4/equip-x86_64-apple-darwin"
      sha256 "5f5066f3209bedacef31aef1d2e83b5a224f66c993a5958a6c3b1329e92dd786"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.4/equip-aarch64-unknown-linux-gnu"
      sha256 "885b80ceeebe63fd374bb083cb12f4f44941275499ee863d007f880cde15afa4"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.4/equip-x86_64-unknown-linux-gnu"
      sha256 "ac5c2111f2db82c0d4e45eb93e32ae16008b6ee3703515ef56d16156a05838e3"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
