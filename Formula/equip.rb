class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.6.1"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/equip/releases/download/v0.6.1/equip-aarch64-apple-darwin"
    sha256 "6588c5ad3bf7b028c83c6b92ea229a37678a46fd713e2809c116fdb2c9aa8e28"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.6.1/equip-aarch64-unknown-linux-gnu"
      sha256 "3bf1c6891e89936f18b679e6affd58749a9899bfbc3b2404f1af8a2530abe35f"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.6.1/equip-x86_64-unknown-linux-gnu"
      sha256 "8c586b5561f44dc175c06d7c1f988f5370369a83353333ca32fd488c77695a36"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
