class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.3/equip-aarch64-apple-darwin"
      sha256 "24e636f25f986c034cfda99ebb063b435832938f3ff2a386c31fc98a29039734"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.3/equip-x86_64-apple-darwin"
      sha256 "2912aa4aeb926db2cb5668c19ae605689df7364bd85a498a1ed1032a7cbf80b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.3/equip-aarch64-unknown-linux-gnu"
      sha256 "93de630cbd01d368ca5ce08b4715c4663b553bf51a88a600dfeabbf0e549721e"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.3/equip-x86_64-unknown-linux-gnu"
      sha256 "1e04cf3bffc8ab891ce58cd803609ba669c403f59785a71693988201fb468baa"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
