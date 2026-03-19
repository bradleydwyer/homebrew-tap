class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  version "1.2.5"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/available/releases/download/v1.2.5/available-aarch64-apple-darwin"
    sha256 "cf97bc818f12c197a45e77b876b32ce77e76be5f441c2b8c1412905a7803ea32"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.5/available-aarch64-unknown-linux-gnu"
      sha256 "3a681c5f6c2c0cfa805864c066404eec15f5653cda44aca44f7b4e7244b08509"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.5/available-x86_64-unknown-linux-gnu"
      sha256 "e02d913be94d8fb3e09e1eb6caf973da69255ff3491fd5477c575ca1d42ffd97"
    end
  end

  def install
    bin.install Dir["available*"].first => "available"
  end

  test do
    assert_match "available", shell_output("\#{bin}/available --version")
  end
end
