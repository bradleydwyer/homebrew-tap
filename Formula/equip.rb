class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.6.2"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/equip/releases/download/v0.6.2/equip-aarch64-apple-darwin"
    sha256 "ede58bb23bdab626eacdf9ba4672e112a37d3559b5a48e7a597d97ef9639c652"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.6.2/equip-aarch64-unknown-linux-gnu"
      sha256 "accf550e0ffa4f428b3073eeea03fe941e7654b1860f3ecfcaa5f44926bc95b5"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.6.2/equip-x86_64-unknown-linux-gnu"
      sha256 "d93a92172ae50aa16a3dcd0c4a470a9fe1d6c798f8e11cfa6c33eb1c92678e58"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
