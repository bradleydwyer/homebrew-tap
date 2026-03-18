class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.2/equip-aarch64-apple-darwin"
      sha256 "da5c8a6f231ec4bfb33e797d42f56556f0c8fc689284a093b70abe1845e11576"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.2/equip-x86_64-apple-darwin"
      sha256 "3421c3b43e81ffb4e19e122b616f5340b6c211bd0e2c88091e03803d6f459c1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.2/equip-aarch64-unknown-linux-gnu"
      sha256 "4298f825a0268c8522e2726afa8a1bc7d5806781618a52f953059430a36b8f08"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.2/equip-x86_64-unknown-linux-gnu"
      sha256 "7374083d42b2021ac7d833135b5d94b008b1b9946cab6b9280615324737fd027"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
