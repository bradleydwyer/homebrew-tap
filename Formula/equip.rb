class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.5/equip-aarch64-apple-darwin"
      sha256 "bbafdf909321594045f5f67d36779ee7034b59052b3b8417b13781b78f551dfb"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.5/equip-x86_64-apple-darwin"
      sha256 "653f28d4be540817d5ff58fda6da864c2d0ae90459c953c082643b58bee41777"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.5/equip-aarch64-unknown-linux-gnu"
      sha256 "51c91ec82545087a25da4513e744b7fd0c8cf96c77bcc54e46ea4eb56a027075"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.5/equip-x86_64-unknown-linux-gnu"
      sha256 "9e68fd4ccd282b58d0bc751ef3de9578e3907b3c016bbbee7893985a9cbc0b0e"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
