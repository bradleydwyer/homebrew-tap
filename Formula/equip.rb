class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.2.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/equip/releases/download/v0.2.0/equip-aarch64-apple-darwin"
    sha256 "8e0a79fe14ab38a50282898f2f19468a06f68f90dd42305168c67e852bf394e4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.2.0/equip-aarch64-unknown-linux-gnu"
      sha256 "ce6d8c82373c3ce375ecead5a2729746e92d38eb0b6552f6ace61eb3beaadf07"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.2.0/equip-x86_64-unknown-linux-gnu"
      sha256 "cb6c7d582190085f0cb3f1a62cc0c877ca4f99389483e457e78f35ad510dd946"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
