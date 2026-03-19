class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  version "2.0.1"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/available/releases/download/v2.0.1/available-aarch64-apple-darwin"
    sha256 "fcfb17db1e4417c6e179b5b2534fbce733efca345eb4269771fb8d22977cc82d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v2.0.1/available-aarch64-unknown-linux-gnu"
      sha256 "ed2ff5a2d25da31e1e59da2557929523d98d00146da5801bc5ccdac54608cb4b"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v2.0.1/available-x86_64-unknown-linux-gnu"
      sha256 "69f7e26cadf5ea08284600fcea87f7ef87f9037a8060dd96f2484cdd1d1f0bde"
    end
  end

  def install
    bin.install Dir["available*"].first => "available"
  end

  test do
    assert_match "available", shell_output("\#{bin}/available --version")
  end
end
