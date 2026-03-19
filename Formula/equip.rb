class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.3/equip-aarch64-apple-darwin"
      sha256 "4a3e3059847b1a9799230c30794eae933e7a55e4d6d93754dcbe2bf9fa6e8223"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.3/equip-x86_64-apple-darwin"
      sha256 "1cfe78e00c8d7882dd05f9f3b236efbe6c218cc3d1edfb4883fc50c6fc405d2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.3/equip-aarch64-unknown-linux-gnu"
      sha256 "e1232adf0844a682d4b9b17320308015025c60120b45ab6b2a46ebadb430c2c3"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.3/equip-x86_64-unknown-linux-gnu"
      sha256 "50e2d00915fee8c54746e2c3f2195d6ffb37908da735f4f372d56b3c85f9753c"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
