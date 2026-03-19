class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  version "1.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/available/releases/download/v1.4.0/available-aarch64-apple-darwin"
    sha256 "159d336c0f4a162f31c1dc08a612f946f91bcbabbdc42769fcf4a1bba3ec7b5c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v1.4.0/available-aarch64-unknown-linux-gnu"
      sha256 "8ded77c38afbbd17815eaf8f1ec7a32c47267e8be24cd825fb515f10c826cec0"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v1.4.0/available-x86_64-unknown-linux-gnu"
      sha256 "3e7a78c820f55e3ad79ff2c4616763caa72b2f744fba66999f630ccda71fbfa4"
    end
  end

  def install
    bin.install Dir["available*"].first => "available"
  end

  test do
    assert_match "available", shell_output("\#{bin}/available --version")
  end
end
