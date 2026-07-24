class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  version "2.0.2"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/available/releases/download/v2.0.2/available-aarch64-apple-darwin"
    sha256 "4a33e1d73a622ced406ac458be05f4c3b656dd9101f91120a20aea9181b10d30"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v2.0.2/available-aarch64-unknown-linux-gnu"
      sha256 "e8d0244428490edff0ddec1bb3fe4c7a7f4c1b01dd0074b2914d9e806c9b9bf4"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v2.0.2/available-x86_64-unknown-linux-gnu"
      sha256 "c7c7e14fff53e1e6c94f8dac11764cb1ce220e12dfc7b6fa2a5a01b69eb69067"
    end
  end

  def install
    bin.install Dir["available*"].first => "available"
  end

  test do
    assert_match "available", shell_output("\#{bin}/available --version")
  end
end
