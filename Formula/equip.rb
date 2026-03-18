class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.2/equip-aarch64-apple-darwin"
      sha256 "86ad4ca06d8abbd51fb38085564d8cd34d3a0fec02197012f9f6ef9fe57cafff"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.2/equip-x86_64-apple-darwin"
      sha256 "6b0adcc7d48b89ba8eb7904c686c9f339a07cd57f9ab95425690a3737c317ad9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.2/equip-aarch64-unknown-linux-gnu"
      sha256 "1e87d77fdfb82e7f460b8b7046dfc743b0523acc8c09f2ed0b1be8ba50532b58"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.2/equip-x86_64-unknown-linux-gnu"
      sha256 "9ed58bd8aeed39ec9a9dd43053adfa1fef10725a839019f86644739ea0bc22e1"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
