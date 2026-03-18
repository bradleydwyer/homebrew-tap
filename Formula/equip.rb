class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.1/equip-aarch64-apple-darwin"
      sha256 "7a8bfd8c0802d8451ebb51ce57fe53b40b7b40f0cd7aa4e950878149acfbbf7e"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.1/equip-x86_64-apple-darwin"
      sha256 "1839dde6b0702a054bc532c1313ac17a72161a0d8cdf5bd0dd16f166d178c654"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.1/equip-aarch64-unknown-linux-gnu"
      sha256 "04f255d2707392f3aabc49855ec78f6b9d932fd67b484eaf29563b8fb8d90ccc"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.3.1/equip-x86_64-unknown-linux-gnu"
      sha256 "2f3520df48bea29af291eab8d68de42c64fb1931e3ac124915c00fe93b6ae99d"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
