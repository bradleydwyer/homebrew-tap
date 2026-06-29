class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.6.3"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/equip/releases/download/v0.6.3/equip-aarch64-apple-darwin"
    sha256 "376c3585c70c05d2fcfa55837775b8028d3869f4d130a4fcb14d5d80d0dd31bc"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.6.3/equip-aarch64-unknown-linux-gnu"
      sha256 "8e7a033dc1f391d3d20d1019c2ad77c17b549f3c4480bcec21706710aa363293"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.6.3/equip-x86_64-unknown-linux-gnu"
      sha256 "09da45481ec6e085f29e50f4fe9e4981cdd2040e4324c16d9c08371b649b1e86"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
