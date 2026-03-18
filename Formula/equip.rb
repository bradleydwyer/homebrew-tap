class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.0/equip-aarch64-apple-darwin"
      sha256 "0473e7af8e5844671a638f04bc9a9210845c2b040162b0dac1ebf57282d7322e"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.0/equip-x86_64-apple-darwin"
      sha256 "8c6376291570ca290ca28246f5c6b1f51ce0fe09de71336d49a27194fddf19b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.0/equip-aarch64-unknown-linux-gnu"
      sha256 "9692b319d56658193173f2334d416db57337d2c66fd0b228ddc3e657f05913c6"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.2.0/equip-x86_64-unknown-linux-gnu"
      sha256 "fa51de2321f5eb0f9a67abedbfb5ddb70ec902d8916737c01f016c9c1b8a26b6"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
