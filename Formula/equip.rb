class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.3/equip-aarch64-apple-darwin"
      sha256 "12fc4927b9dd6293cc0eeb87fc2d161beea87c14eaf04d8eb321f5590b5986d0"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.3/equip-x86_64-apple-darwin"
      sha256 "1f11b6e41c8da0e2ed56cb435edbe57091aedf44c59a593ce4c088029d946f24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.3/equip-aarch64-unknown-linux-gnu"
      sha256 "d552ea6f822b7775117195cb861a9dd6b4b7ef0f3b9ef909f7891a3edf76b112"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.3/equip-x86_64-unknown-linux-gnu"
      sha256 "999c67eabdaf584e78c80826958f3206a4fd17191abd151698fa91371c379379"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
