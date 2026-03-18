class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.1/equip-aarch64-apple-darwin"
      sha256 "1d6d9b76ebc8031479cdc0c9118c3a3c18d8ae355cfc2a83f415275b1224d45c"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.1/equip-x86_64-apple-darwin"
      sha256 "329a1f6171dc4bbed50fe555f603d3ad0e14082b55987ff44a55015eb03ed542"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.1/equip-aarch64-unknown-linux-gnu"
      sha256 "a0db5923e1c43eff47f136f037fd5e02c6ce47a953d4c94303bffab4dc0d90ec"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.1/equip-x86_64-unknown-linux-gnu"
      sha256 "c6a98f8f32a87f914208580f3de9a2685e61209a36d6b4c45c62704b2551fa74"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
