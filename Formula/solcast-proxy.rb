class SolcastProxy < Formula
  desc "Caching reverse proxy for the Solcast solar forecast API"
  homepage "https://github.com/bradleydwyer/solcast-proxy"
  version "1.0.5"
  license "MIT"

  on_macos do
    url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.5/solcast-proxy-aarch64-apple-darwin"
    sha256 "f80421b6f72d2b7c2f12cef235f78faaf0931aef2e1474dea80237006f78a8a7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.5/solcast-proxy-aarch64-unknown-linux-gnu"
      sha256 "b4dba31581df2672b5d6b6bfb76007fd4debcd1d4cf94ae9068833b148bd4b94"
    else
      url "https://github.com/bradleydwyer/solcast-proxy/releases/download/v1.0.5/solcast-proxy-x86_64-unknown-linux-gnu"
      sha256 "0f8c40bb69257d9517183e99e5e79b0b6d447a80a52060f20dddafceaa5703e2"
    end
  end

  def install
    bin.install Dir["solcast-proxy*"].first => "solcast-proxy"
  end

  test do
    assert_match "solcast-proxy", shell_output("\#{bin}/solcast-proxy --version")
  end
end
