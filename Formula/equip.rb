class Equip < Formula
  desc "Install SKILL.md files across AI coding agents"
  homepage "https://github.com/bradleydwyer/equip"
  version "0.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.6/equip-aarch64-apple-darwin"
      sha256 "372f14fa05c62bbe63e8428f64f3db202559a11465c59d4b65cb42bfad2a79a5"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.6/equip-x86_64-apple-darwin"
      sha256 "00c4465297eefead0261aa29808d75fea9d00001ab7d7121717f6341e3bc7b32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.6/equip-aarch64-unknown-linux-gnu"
      sha256 "c7d5770839f2fb9f32930557d14607d3c4e696937d1224e414bdee986ea92031"
    else
      url "https://github.com/bradleydwyer/equip/releases/download/v0.0.6/equip-x86_64-unknown-linux-gnu"
      sha256 "696e2387ad74a565a7a032c2d9db73ab22a56a87be9544f27afb4bc1cbc50576"
    end
  end

  def install
    bin.install Dir["equip*"].first => "equip"
  end

  test do
    assert_match "equip", shell_output("#{bin}/equip --version")
  end
end
