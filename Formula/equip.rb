class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.5/equip-aarch64-apple-darwin"
      sha256 "1b9cc2a3829fe40264c12b6e1795ab12d6794b63b785d96a4a799c7398806711"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.5/equip-x86_64-apple-darwin"
      sha256 "edb264afee7f1df582c0a2f3ff9e21ac7220528648b18d35d76032240f081f94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.5/equip-aarch64-unknown-linux-gnu"
      sha256 "40d5e14f1f15ff5378f25d34c462719a17182391c11aad83fdfe575391ea6336"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.5/equip-x86_64-unknown-linux-gnu"
      sha256 "babaa8053a3213e60a2a015c95e287e96e72dcbe0cb6446e7a1f21b1a349ed2a"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
