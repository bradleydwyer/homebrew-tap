class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  version "1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.3/available-aarch64-apple-darwin"
      sha256 "4ce55c3c46dcd7fddfe25407bbee4fa980030654a18b383c0ab7aea2d8d72072"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.3/available-x86_64-apple-darwin"
      sha256 "49e8f56562341c2fd62d787f13d27c95db2c495a13996564e303f7206264c928"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.3/available-aarch64-unknown-linux-gnu"
      sha256 "8238e6a1dabe30ebee29f5f3e2e4de1fe24f345980f7beceea5b32bb0093484a"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v1.2.3/available-x86_64-unknown-linux-gnu"
      sha256 "9ce3dc6bff7bb0a1c28249086f2e2e9774f5b547ab22ce1b810cace4d30de2fd"
    end
  end

  def install
    bin.install Dir["available*"].first => "available"
  end

  test do
    assert_match "available", shell_output("\#{bin}/available --version")
  end
end
