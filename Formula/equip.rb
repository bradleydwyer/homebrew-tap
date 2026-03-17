class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v1.0.0/equip-aarch64-apple-darwin"
      sha256 "8a42b28afe8a1f0e059f378ea8f056d5fc19b46b18015a2648dbfa1d501b3528"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v1.0.0/equip-x86_64-apple-darwin"
      sha256 "77bf6c41127d23f4ed5b3122712dbf045e73444a47a1b82b09772856f05c55bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v1.0.0/equip-aarch64-unknown-linux-gnu"
      sha256 "0c0f5489b9fd47eb8c78ceeb7a9b11baeeac2b57b4b15dbe62a8517a47f77a67"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v1.0.0/equip-x86_64-unknown-linux-gnu"
      sha256 "ba4f29987242ddd4a3d491ef4c3115dc642d337b54be826768cc2f3ada49e880"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
