class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.2/equip-aarch64-apple-darwin"
      sha256 "024244e72c51ce4a6d957df7f9cf40cec0bdd27c2affb8d98d7c2d291a37d834"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.2/equip-x86_64-apple-darwin"
      sha256 "e741ec706b103309e8f40b441c46787c5cf90f496d8ed6c1b18bef54e4ea02d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.2/equip-aarch64-unknown-linux-gnu"
      sha256 "cccca8eef2771297124fd95e23f83a13b8d479e7e644a69d5589012b90e008b6"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.2/equip-x86_64-unknown-linux-gnu"
      sha256 "675ac66d25f142311a6e504638357e7ddab67dff6089305b69d255bbc9d1b931"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
