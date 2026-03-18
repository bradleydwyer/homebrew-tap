class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.2/equip-aarch64-apple-darwin"
      sha256 "5d42d4025426a0b2f7aaef6094dfd010469ad9b26796af1ca13b3962521f1660"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.2/equip-x86_64-apple-darwin"
      sha256 "96d4b4e4d6f2b551388b3867f6fe5cc3370e08775dc765c599489e3348f471dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.2/equip-aarch64-unknown-linux-gnu"
      sha256 "9068e763df20c423d36ffb7401febea0be9adc1a14c6b24bcf8c83e3e7d25298"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v2.0.2/equip-x86_64-unknown-linux-gnu"
      sha256 "5123a4e6175e3fdbc1e6165bffd90e844c4da1967bca7b8e1c141eefeeba8d97"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
