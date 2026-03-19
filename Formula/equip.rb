class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.2/equip-aarch64-apple-darwin"
      sha256 "4121ff4aefe6f9f8e99c289d20b78b80d930bb9ab0fed06f520441db20edd80c"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.2/equip-x86_64-apple-darwin"
      sha256 "288c3295032f19e66ab97b998ec39d43b1978c7f2a6a19677853b7b37f015578"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.2/equip-aarch64-unknown-linux-gnu"
      sha256 "0d97210ca29cc20479b650b55d226d1fe65188dee4ef7d1fe673574726b61890"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.1.2/equip-x86_64-unknown-linux-gnu"
      sha256 "a1e5f7e113499f1a6ec981c7c7e9afa6a66402476b9e053b71834c370c328b4a"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
