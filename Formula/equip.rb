class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.0/equip-aarch64-apple-darwin"
      sha256 "74cf45a6888c756107f7e736c11677935f5f482d3909d9219013e3467a026b4c"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.0/equip-x86_64-apple-darwin"
      sha256 "58bf27514e0817315eed01833f5a3e32a0383d1d168ddffcbd04841684ee5c66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.0/equip-aarch64-unknown-linux-gnu"
      sha256 "d4fde841a549566cc707eaf885bb63ff5268620b1ff39eddbdecfc5916d81003"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.0/equip-x86_64-unknown-linux-gnu"
      sha256 "589aa1372a0252fcae447a109bc1368c6d5610ea0043537330fad96a7001f2ea"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
