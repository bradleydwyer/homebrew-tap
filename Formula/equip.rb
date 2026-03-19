class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.1/equip-aarch64-apple-darwin"
      sha256 "aaa48954bf2725034281ce8da375f42307f90c3538920d650735fa5f9290b196"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.1/equip-x86_64-apple-darwin"
      sha256 "9ae10651e0f8925d96df8d147ca6242a3d3e7937e2a6eb09b9f888a0183d0c4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.1/equip-aarch64-unknown-linux-gnu"
      sha256 "d36e7b01d9584fac36a797a89338df7307cc1792acae2f028fe9d3c640b20b44"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.1/equip-x86_64-unknown-linux-gnu"
      sha256 "9e1eb278b69b0aa712db782926aade7649ef14d369e0f7371170092a24f58c03"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
