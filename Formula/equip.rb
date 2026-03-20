class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.5.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/equip/releases/download/v0.5.0/equip-aarch64-apple-darwin"
    sha256 "5f3b4c819ca83b2419de5119c56ff2b8b75763c18386b4707f7ae5b7380a9e5b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.5.0/equip-aarch64-unknown-linux-gnu"
      sha256 "2de48bb6a24bddc44181c01dfe0cabaee5fe8bd6526b59ba271cd5939d6330e8"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.5.0/equip-x86_64-unknown-linux-gnu"
      sha256 "6766440664940dce6082e3c57cab54cd326942adca341a2879c4769cf045c696"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
