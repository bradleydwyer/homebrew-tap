class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/equip/releases/download/v0.3.0/equip-aarch64-apple-darwin"
    sha256 "0096d8e9455adccc7450a51a28d5340e8d0f2443ccf97470b8869d53dccaf96c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.3.0/equip-aarch64-unknown-linux-gnu"
      sha256 "f6f9f034405128ecfb9922c4f60783581d2dbc0aeb607c4b385ae6ae8fe0fca1"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.3.0/equip-x86_64-unknown-linux-gnu"
      sha256 "9b6bd717ec7205522da51f6ad38a2f93431b1130f72d3b633cbff92112dda889"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
