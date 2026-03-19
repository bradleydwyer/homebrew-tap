class Available < Formula
  desc "AI-powered project name finder with domain and package registry checks"
  homepage "https://github.com/bradleydwyer/available"
  version "1.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/available/releases/download/v1.3.0/available-aarch64-apple-darwin"
    sha256 "c2580d6f07c5f351522099bde164ac20a60c8c9572d3dfd89528b3769b46ef6f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/available/releases/download/v1.3.0/available-aarch64-unknown-linux-gnu"
      sha256 "4789c0fe7bea915db916bdc04e5311cf7a1b92258f517b2c4d4f74de55f1ca18"
    else
      url "https://github.com/bradleydwyer/available/releases/download/v1.3.0/available-x86_64-unknown-linux-gnu"
      sha256 "2aaf41426e5e13704d6de41184e996882854cc7644d8d955553d27bbd1c65613"
    end
  end

  def install
    bin.install Dir["available*"].first => "available"
  end

  test do
    assert_match "available", shell_output("\#{bin}/available --version")
  end
end
