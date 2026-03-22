class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.6.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/equip/releases/download/v0.6.0/equip-aarch64-apple-darwin"
    sha256 "0b802c1b68c6d5bcaeacf96ab7985d2e6c6e8bc7ae9bdefbad0b3d2e96fabbfd"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.6.0/equip-aarch64-unknown-linux-gnu"
      sha256 "fb03368b730082e910ea8cd82aa90b5010cb8d0d8e1566e96b701477b4ad537f"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.6.0/equip-x86_64-unknown-linux-gnu"
      sha256 "b948d9c859ca15bf61931f7736cdad575df2a7c59de6fce4e2fdd20d269324d1"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
