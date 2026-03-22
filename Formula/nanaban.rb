class Nanaban < Formula
  desc "Gemini image generation CLI (Nano Banana 2 / Pro)"
  homepage "https://github.com/bradleydwyer/nanaban"
  version "0.2.8"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.8/nanaban-aarch64-apple-darwin"
    sha256 "e09123aa87091ec75448ffa8cb5ed53f447077a948e6ea69a53632814ee4d8b4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.8/nanaban-aarch64-unknown-linux-gnu"
      sha256 "70dc73e774e1241edc560c033e45df27b24c968cd56430bf270eaf318c25e98f"
    else
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.8/nanaban-x86_64-unknown-linux-gnu"
      sha256 "fc716e7d1aef3db8ce33605befa28c8e497a6ccd7cbc6d84d3ccd31522f70e1d"
    end
  end

  def install
    bin.install Dir["nanaban*"].first => "nanaban"
  end

  test do
    assert_match "nanaban", shell_output("\#{bin}/nanaban --version")
  end
end
