class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.0/equip-aarch64-apple-darwin"
      sha256 "f070db10c855d3b5c7836b6e99384f498814bdd86813f18ffa3c03e04f8cfaf7"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.0/equip-x86_64-apple-darwin"
      sha256 "33702392f949027bb9f6e9d4efe3026758de3961bb6ef31b99cf4f362da885d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.0/equip-aarch64-unknown-linux-gnu"
      sha256 "2ec5826e87bfef50668f41e6eaa13222bc2acc97c4d1fa031c2494688b02f3b5"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.0/equip-x86_64-unknown-linux-gnu"
      sha256 "860af5f154bf7713011f1a117e8d334a5e214bb263185f5210e13de7bfb7e6ab"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
