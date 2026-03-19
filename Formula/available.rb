class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  version "2.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/available/releases/download/v2.0.0/available-aarch64-apple-darwin"
    sha256 "2382c8c2eef2f416dafb68e2b3887ed7dc610ded72c853c59373f5bbb5210316"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v2.0.0/available-aarch64-unknown-linux-gnu"
      sha256 "3c4263c4b0ee022d3f14931e59cba40bb424c7ee86920d6c977700c445d3624d"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v2.0.0/available-x86_64-unknown-linux-gnu"
      sha256 "4171aca9f3dcbf52c9132893f750f9f0419f7115a29348225a5d791643593c11"
    end
  end

  def install
    bin.install Dir["available*"].first => "available"
  end

  test do
    assert_match "available", shell_output("\#{bin}/available --version")
  end
end
