class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.3.1/equip-aarch64-apple-darwin"
      sha256 "d856aa2fba324bccf2fcdc5508dc81343701107c94e109576d23e5e5aad7e4a7"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.3.1/equip-x86_64-apple-darwin"
      sha256 "eb47ee9c6d00f824a79a7cb48e7be173f9ea237354bc627ad13f5c3558a5e2e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.3.1/equip-aarch64-unknown-linux-gnu"
      sha256 "094b23ff4929c20c4797f342271ccc2cf0502306854257b2d907624a84063a90"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.3.1/equip-x86_64-unknown-linux-gnu"
      sha256 "0f70f3af3414cdbf3f3869bb5238c83b8ca04caf48fbaaa4724cf0b7620242bc"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
