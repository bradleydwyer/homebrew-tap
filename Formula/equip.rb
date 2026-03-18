class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.1.0/equip-aarch64-apple-darwin"
      sha256 "934f1eb27ba9b106ffbfc606485ec792c0780bd61b72fbd6470ee7ad78777a6b"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.1.0/equip-x86_64-apple-darwin"
      sha256 "0022ba47c929dc15a721460b215e8500cf8ec4b6a20733871b345d21e2b5a42c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.1.0/equip-aarch64-unknown-linux-gnu"
      sha256 "15ae7c39a652ca71611acb657200422ee06bb7ffe933e6d3eb3af4856f46efa6"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.1.0/equip-x86_64-unknown-linux-gnu"
      sha256 "74a2086bce909d7d3a8dde04db374a6a3cccf360fce519e165be44d3364a4311"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
