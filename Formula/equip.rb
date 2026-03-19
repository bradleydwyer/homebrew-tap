class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/equip/releases/download/v0.4.0/equip-aarch64-apple-darwin"
    sha256 "1157c03d1268ab90a5e741d20224c446aa6d1d07123c4c482a2c0bc700004346"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.4.0/equip-aarch64-unknown-linux-gnu"
      sha256 "72452cc2049691351946baca751642a4901a2a0f2d7a4c78ecb7ab49047bca0e"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.4.0/equip-x86_64-unknown-linux-gnu"
      sha256 "4124245f92ed99c4670f01070860c156251810b96974c021a8c1ca48d5e40571"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
