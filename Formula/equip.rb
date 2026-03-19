class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.1.7"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/equip/releases/download/v0.1.7/equip-aarch64-apple-darwin"
    sha256 "9db287410603792a951bb2f041ef840d092484b3bf5c8000762b2ff37f8cfef1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.7/equip-aarch64-unknown-linux-gnu"
      sha256 "4521a86d0ce427ebe24672bf8f3bed0cad4c2ef01439420cc86db795e4a36fa1"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.7/equip-x86_64-unknown-linux-gnu"
      sha256 "467b4cec47c392eb311f16fcb688619d4860f49b95e6351024ad2055331793f4"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
