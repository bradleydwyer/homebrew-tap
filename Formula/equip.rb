class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.0/equip-aarch64-apple-darwin"
      sha256 "0cfcad0deb9fc950deacaab9480111cc6dbda0be6e62ea71e42b6a96bac9afa4"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.0/equip-x86_64-apple-darwin"
      sha256 "14a245b9010cf82a0b6f79000a65ac5541c40b3f0dc37a612dbf8186ae0375cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.0/equip-aarch64-unknown-linux-gnu"
      sha256 "392650f1561277ade14d24075301305a4dd72e04b097480ed9762068a9aad771"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.0/equip-x86_64-unknown-linux-gnu"
      sha256 "995da4171fa1ce277f220873e40119398a734f9e0bdc6478560149f6fb12f505"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
