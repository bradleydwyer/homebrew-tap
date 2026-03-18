class Published < Formula
  desc "App store name availability checker"
  homepage "https://github.com/bradleydwyer/published"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.0/published-aarch64-apple-darwin"
      sha256 "7bc861e3615cd01864b1d378e6c3ddfc8cc1618f633125e25ed0be434483fbfb"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.0/published-x86_64-apple-darwin"
      sha256 "eab5d74792fba98c0176f2746a36b73e81d3e6218bbd683ba8c192dd1c0be0eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.0/published-aarch64-unknown-linux-gnu"
      sha256 "7abb70f27489f3a5f6efd7b75ba80791a9492e098efef675f447197388fb48aa"
    else
      url "https://github.com/bradleydwyer/published/releases/download/v1.0.0/published-x86_64-unknown-linux-gnu"
      sha256 "c1f7fd4565832640b4b25af36b45097034f6dd9f8cc5ec5dda5d90f5c364e855"
    end
  end

  def install
    bin.install Dir["published*"].first => "published"
  end

  test do
    assert_match "published", shell_output("#{bin}/published --version")
  end
end
