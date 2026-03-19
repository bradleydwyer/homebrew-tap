class Nanaban < Formula
  desc "Gemini image generation CLI (Nano Banana 2 / Pro)"
  homepage "https://github.com/bradleydwyer/nanaban"
  version "0.2.6"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.6/nanaban-aarch64-apple-darwin"
    sha256 "be54bc66f0a248142ec7f2e3e8b4d57204de96ae907cce7beed4c80f6f3a8b1e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.6/nanaban-aarch64-unknown-linux-gnu"
      sha256 "2238f435247c947d2454cbbe2574e1079e4439926ccf1998f4a8fde7aa04a5c5"
    else
      url "https://github.com/bradleydwyer/nanaban/releases/download/v0.2.6/nanaban-x86_64-unknown-linux-gnu"
      sha256 "804f234ab28bd8b2485376b666a97ef5ee4b5ccbb654e98c66bccf17d410f363"
    end
  end

  def install
    bin.install Dir["nanaban*"].first => "nanaban"
  end

  test do
    assert_match "nanaban", shell_output("\#{bin}/nanaban --version")
  end
end
