class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.1/equip-aarch64-apple-darwin"
      sha256 "bc759b8bdace0ab384af2e0ae2e48f767256c121ba4d64d20769cf80f71a0f0b"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.1/equip-x86_64-apple-darwin"
      sha256 "48ecd80a2c1a706a644d2712088accdcd2845f41a6ecbdde56022667412ad55a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.1/equip-aarch64-unknown-linux-gnu"
      sha256 "d8619af9b9fb79f96c7b039b6e04eb910da33c283c6c899370dff78e21072660"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.1/equip-x86_64-unknown-linux-gnu"
      sha256 "95c5e05d90411146b846c801745a2e1370497988784eb8a8ca41f23c8cc1349a"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
